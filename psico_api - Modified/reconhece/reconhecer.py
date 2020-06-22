import cv2
import dlib
import numpy as np
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing.image import img_to_array
import os
from pathlib import Path


class Reconhecer:

    def __init__(self, video):
        self.video = video

    def realizar_reconhecimento(self):
        os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'

        classificador_emocoes = self.carregar_modelo()
        expressoes = ["Raiva", "Nojo", "Medo", "Feliz", "Triste", "Surpreso", "Neutro"]

        cap = cv2.VideoCapture(self.video)
        cont = 0
        v = 0
        while not cap.isOpened():
            cap = cv2.VideoCapture()
            cv2.waitKey(1000)
            print("Tentando abrir o vídeo")
            cont += 1
            if cont > 10:
                cont = 0
                return "Erro ao abrir video"

        posFrame = cap.get(cv2.CAP_PROP_POS_FRAMES)
        facesDetectadas = ''
        detector = dlib.get_frontal_face_detector()
        quantFrames = cap.get(cv2.CAP_PROP_FRAME_COUNT)
        print(quantFrames)
        medProb = [0, 0, 0, 0, 0, 0, 0]

        while True:
            flag, frame = cap.read()
            if flag:
                posFrame = cap.get(cv2.CAP_PROP_POS_FRAMES)
                frame = cv2.resize(frame, (200, 120))
                facesDetectadas = detector(frame, 3)
                # print("Faces detectadas: ", len(facesDetectadas))
                original = frame.copy()

                if len(facesDetectadas) == 1:
                    for face in facesDetectadas:
                        x, y, d, b = (int(face.left()), int(face.top()), int(face.right()), int(face.bottom()))
                        cinza = cv2.cvtColor(original, cv2.COLOR_BGR2GRAY)
                        roi = self.criar_roi(cinza[y:y + d, x:x + d])
                        preds = classificador_emocoes.predict(roi)[0]
                        label = expressoes[preds.argmax()]
                        # print(label)

                        for a, b in enumerate(preds):
                            medProb[a] += (b * 100)
                        '''
                        print("******************************")
                        print(medProb)
                        print("******************************")
                        '''
                        print('*')

                elif len(facesDetectadas) == 0:
                    print("Nenhuma face detectada! Por favor, verifique o vídeo!")
                    return 0
                else:
                    print("Mais de uma face detectada! Por favor, grave somente uma pessoa!")
                    return 0
            else:
                cap.set(cv2.CAP_PROP_POS_FRAMES, posFrame - 1)
                print("Frame não está pronto!")
                cv2.waitKey(1000)
                v = v + 1
                if v > 8:
                    v = 0
                    return ''

            if cap.get(cv2.CAP_PROP_POS_FRAMES) == cap.get(cv2.CAP_PROP_FRAME_COUNT):
                emocoes = self.calcular_media_emocoes(medProb, quantFrames, facesDetectadas, expressoes)
                mapa_emocoes = self.montar_mapa(emocoes)
                print(mapa_emocoes)
                return mapa_emocoes


    @staticmethod
    def criar_roi(imagem_cinza):
        roi = imagem_cinza
        roi = cv2.resize(roi, (48, 48))
        roi = roi.astype('float')
        roi = roi / 255
        roi = img_to_array(roi)
        roi = np.expand_dims(roi, axis=0)
        return roi

    @staticmethod
    def carregar_modelo():
        caminho = Path.cwd()
        modelo = str(caminho) + "/reconhece/modelos/modelo_01_expressoes.h5"
        carregado = load_model(modelo, compile=False)
        return carregado

    @staticmethod
    def calcular_media_emocoes(med_prob, quant_frames, num_faces, expressoes):
        result_prob = []
        emocoes = []
        for cont, val in enumerate(med_prob):
            result_prob.append(val / quant_frames)
        if len(num_faces) == 1:
            for (i, (emotion, prob)) in enumerate(zip(expressoes, result_prob)):
                text = "{}: {:.2f}%".format(emotion, prob)
                emocoes.append(text)
                # print(text)
            return emocoes
        else:
            return 0

    @staticmethod
    def montar_mapa(emocoes):
        contador = 0
        cont2 = 0
        mapa = [[1, ''], [1, ''], [1, ''], [1, ''], [1, ''], [1, ''], [1, '']]

        while contador < len(emocoes):
            a = emocoes[contador].replace('%', '')
            a = a.split(' ')
            # print(a)
            mapa[contador][cont2] = a[cont2]
            cont2 += 1
            mapa[contador][cont2] = a[cont2]
            cont2 = 0
            contador += 1

        return mapa
