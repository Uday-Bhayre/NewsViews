import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:uday/features/home/model/newsModel.dart';
import 'package:video_player/video_player.dart';

class NewsCard extends StatelessWidget {
  final NewsItem newsItem;

  const NewsCard({
    super.key,
    required this.newsItem,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite - 100,
      child: Stack(
        children: [
          Chewie(
            controller: ChewieController(
              videoPlayerController: VideoPlayerController.networkUrl(
                Uri.parse(
                  newsItem.videoUrl,
                ),
              ),
              aspectRatio: 9 / 16,
              autoPlay: true,
              looping: false,
              allowFullScreen: false,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: Container(
              alignment: Alignment.centerRight,
              child: Row(
                children: [
                  const Icon(
                    Icons.circle_sharp,
                    color: Colors.blue,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    newsItem.title,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
