import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:psicoapp/stores/consulta_reg_store.dart';
import 'package:video_player/video_player.dart';

class ChooseVideo extends StatefulWidget {
  @override
  _ChooseVideoState createState() => _ChooseVideoState();
}

class _ChooseVideoState extends State<ChooseVideo> {
  PickedFile _imageFile;
  dynamic _pickImageError;
  bool isVideo = false;
  VideoPlayerController _controller;
  String _retrieveDataError;
  File video;

  final ImagePicker _picker = ImagePicker();

  Future<void> _playVideo(PickedFile file) async {
    if (file != null && mounted) {
      await _disposeVideoController();
      if (kIsWeb) {
        _controller = VideoPlayerController.network(file.path);
      } else {
        _controller = VideoPlayerController.file(File(file.path));
      }
      await _controller.setVolume(0.0);
      await _controller.initialize();
      await _controller.setLooping(true);
      await _controller.play();
      setState(() {});
    }
  }

  void _onImageButtonPressed(ImageSource source, {BuildContext context}) async {
    if (_controller != null) {
      await _controller.setVolume(0.0);
    }
    if (isVideo) {
      final PickedFile file = await _picker.getVideo(
          source: source, maxDuration: const Duration(seconds: 60)
      );
      video = File(file.path);
      await _playVideo(file);
    } else {
      await _displayPickImageDialog(context,
              (double maxWidth, double maxHeight, int quality) async {
            try {
              final pickedFile = await _picker.getImage(
                source: source,
                maxWidth: maxWidth,
                maxHeight: maxHeight,
                imageQuality: quality,
              );
              setState(() {
                _imageFile = pickedFile;
              });
            } catch (e) {
              setState(() {
                _pickImageError = e;
              });
            }
          });
    }
  }

  @override
  void deactivate() {
    if (_controller != null) {
      _controller.setVolume(0.0);
      _controller.pause();
    }
    super.deactivate();
  }

  @override
  void dispose() {
    _disposeVideoController();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  Future<void> _disposeVideoController() async {
    if (_controller != null) {
      await _controller.dispose();
      //_controller = null;
    }
  }

  Widget _previewVideo() {
    final Text retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_controller == null) {
      return const Text(
        'Você não selecionou/gravou um vídeo.',
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      );
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AspectRatioVideo(_controller),
    );
  }

  Future<void> retrieveLostData() async {
    final LostData response = await _picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      if (response.type == RetrieveType.video) {
        isVideo = true;
        await _playVideo(response.file);
      } else {
        isVideo = false;
        setState(() {
          _imageFile = response.file;
        });
      }
    } else {
      _retrieveDataError = response.exception.code;
    }
  }

  @override
  Widget build(BuildContext context) {
    ConsultaRegStore consultaRegStore = Provider.of<ConsultaRegStore>(context);
    if(video != null){
      consultaRegStore.changeVideo(video);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Video', style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFF4B2637),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height - 88,
          child: Center(
            child: !kIsWeb && defaultTargetPlatform == TargetPlatform.android
                ? FutureBuilder<void>(
              future: retrieveLostData(),
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const Text(
                      'Você não selecionou/gravou um vídeo.',
                      textAlign: TextAlign.center,
                    );
                  case ConnectionState.done:
                    return _previewVideo();
                  default:
                    if (snapshot.hasError) {
                      return Text(
                        'Pick image/video error: ${snapshot.error}}',
                        textAlign: TextAlign.center,
                      );
                    } else {
                      return const Text(
                        'Você não selecionou/gravou um vídeo.',
                        textAlign: TextAlign.center,
                      );
                    }
                }
              },
            )
                : (_previewVideo()),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                isVideo = true;
                _onImageButtonPressed(ImageSource.gallery);
              },
              heroTag: 'video0',
              tooltip: 'Pick Video from gallery',
              child: const Icon(Icons.video_library),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                isVideo = true;
                _onImageButtonPressed(ImageSource.camera);
              },
              heroTag: 'video1',
              tooltip: 'Take a Video',
              child: const Icon(Icons.videocam),
            ),
          ),
        ],
      ),
    );
  }

  void setLandscapeMode(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  Text _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
  }
}

typedef void OnPickImageCallback(
    double maxWidth, double maxHeight, int quality);

class AspectRatioVideo extends StatefulWidget {
  AspectRatioVideo(this.controller);

  final VideoPlayerController controller;

  @override
  AspectRatioVideoState createState() => AspectRatioVideoState();
}

class AspectRatioVideoState extends State<AspectRatioVideo> {
  VideoPlayerController get controller => widget.controller;
  bool initialized = false;

  void _onVideoControllerUpdate() {
    if (!mounted) {
      return;
    }
    if (initialized != controller.value.initialized) {
      initialized = controller.value.initialized;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(_onVideoControllerUpdate);
  }

  @override
  void dispose() {
    controller.removeListener(_onVideoControllerUpdate);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if (initialized) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AspectRatio(
            aspectRatio: controller.value?.aspectRatio,
            child: VideoPlayer(controller),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text('Selecionar', style: TextStyle(color: Colors.white),),
                color: Colors.green,
              )
            ],
          )
        ],
      );
    } else {
      return Container();
    }
  }
}