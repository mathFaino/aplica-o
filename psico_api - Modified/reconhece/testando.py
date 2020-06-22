import reconhece.reconhecer as reconhecer
from pathlib import Path


def top_three(map_sended):
    lista = []
    contador = 0
    pos = []
    lista_emotions = []
    while contador <= (len(map_sended) - 1):
        lista.append(int(map_sended[contador][1]))
        contador += 1
    print(lista)
    original_list = lista.copy()
    print(original_list)
    lista.sort()
    print(lista)
    tops = lista[-3:]
    q = sorted(tops, reverse=True)
    print(q)
    for a in q:
        print(a)
        pos.append(original_list.index(a))

    for b in pos:
        lista_emotions.append((map_sended[b][0] + ' ' + map_sended[b][1]))
    return lista_emotions


map_test = [['a', '12'], ['b', '2'], ['c', '10'], ['d', '19'], ['e', '4']]
list1 = top_three(map_test)
# list1 = top_three([2, 3, 5, 16, 8, 4, 2, 1])
print(list1)

dictionary = {'a': '1', 'b': '2'}
print(dictionary)
teste = dictionary.keys()

t = ''
for c in dictionary:
    t = c
    break
print(t)


print(Path.home())
print(Path.cwd())
'''
caminho = '../media_images/videos/'
video = 'http://127.0.0.1:8000/media_files/videos/meu_video.mp4'
video = video.split('videos')


variavel = reconhecer.Reconhecer(caminho + video[1])
variavel2 = variavel.realizar_reconhecimento()
print(variavel2)
print("AAAAa")
'''
