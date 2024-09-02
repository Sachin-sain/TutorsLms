import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutor_lms/widgets/player/src/controllers/pod_getx_video_controller.dart';
import 'package:tutor_lms/widgets/player/src/widgets/material_icon_button.dart';
import 'package:tutor_lms/widgets/player/src/widgets/pod_progress_bar.dart';

class MobileBottomSheet extends StatelessWidget {
  final String tag;
  final BuildContext context;
  const MobileBottomSheet({super.key,
    required this.tag,
    required this.context
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PodGetXVideoController>(
      tag: tag,
      builder: (podCtr) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (podCtr.vimeoOrVideoUrls.isNotEmpty)
            bottomSheetTiles(
              context: context,
              title: podCtr.podPlayerLabels.quality,
              icon: Icons.video_settings_rounded,
              subText: '${podCtr.vimeoPlayingVideoQuality}p',
              onTap: () {
                Navigator.of(context).pop();
                Timer(const Duration(milliseconds: 100), () {
                  showModalBottomSheet<void>(
                    backgroundColor: Theme.of(context).cardColor,
                    context: context,
                    builder: (context) => SafeArea(
                      child: VideoQualitySelectorMob(
                        tag: tag,
                        onTap: null,
                      ),
                    ),
                  );
                });
                // await Future.delayed(
                //   const Duration(milliseconds: 100),
                // );
              },
            ),
          bottomSheetTiles(
            context: context,
            title: podCtr.podPlayerLabels.loopVideo,
            icon: Icons.loop_rounded,
            subText: podCtr.isLooping
                ? podCtr.podPlayerLabels.optionEnabled
                : podCtr.podPlayerLabels.optionDisabled,
            onTap: () {
              Navigator.of(context).pop();
              podCtr.toggleLooping();
            },
          ),
          bottomSheetTiles(
            context: context,
            title: podCtr.podPlayerLabels.playbackSpeed,
            icon: Icons.slow_motion_video_rounded,
            subText: podCtr.currentPaybackSpeed,
            onTap: () {
              Navigator.of(context).pop();
              Timer(const Duration(milliseconds: 100), () {
                showModalBottomSheet<void>(
                  backgroundColor: Theme.of(context).cardColor,
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => SafeArea(
                    child: _VideoPlaybackSelectorMob(
                      tag: tag,
                      onTap: null,
                    ),
                  ),
                );
              });
            },
          ),
        ],
      ),
    );
  }

  ListTile bottomSheetTiles({
    required String title,
    required IconData icon,
    String? subText,
    void Function()? onTap,
    required BuildContext context
  }) {
    return ListTile(
      leading: Icon(icon),
      onTap: onTap,
      title: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Text(
              title,
            ),
            if (subText != null) const SizedBox(width: 6),
            if (subText != null)
              const SizedBox(
                height: 4,
                width: 4,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            if (subText != null) const SizedBox(width: 6),
            if (subText != null)
              Text(
                subText,
                style:  TextStyle(color: Theme.of(context).highlightColor),
              ),
          ],
        ),
      ),
    );
  }
}

class VideoQualitySelectorMob extends StatelessWidget {
  final void Function()? onTap;
  final String tag;

  const VideoQualitySelectorMob({super.key,
    required this.onTap,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    final podCtr = Get.find<PodGetXVideoController>(tag: tag);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: podCtr.vimeoOrVideoUrls
            .map(
              (e) => ListTile(
                title: Text('${e.quality}p'),
                onTap: () {
                  onTap != null ? onTap!() : Navigator.of(context).pop();

                  podCtr.changeVideoQuality(e.quality);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

class _VideoPlaybackSelectorMob extends StatelessWidget {
  final void Function()? onTap;
  final String tag;

  const _VideoPlaybackSelectorMob({
    required this.onTap,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    final podCtr = Get.find<PodGetXVideoController>(tag: tag);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: podCtr.videoPlaybackSpeeds
            .map(
              (e) => ListTile(
                tileColor: Theme.of(context).cardColor,
                title: Text(e),
                onTap: () {
                  onTap != null ? onTap!() : Navigator.of(context).pop();
                  podCtr.setVideoPlayBack(e);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

class MobileOverlayBottomControlles extends StatelessWidget {
  final String tag;

  const MobileOverlayBottomControlles({super.key,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle durationTextStyle = TextStyle(color: Theme.of(context).highlightColor);
    return GetBuilder<PodGetXVideoController>(
      tag: tag,
      id: 'full-screen',
      builder: (podCtr) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const SizedBox(width: 12),
              GetBuilder<PodGetXVideoController>(
                tag: tag,
                id: 'video-progress',
                builder: (podCtr) {
                  return Row(
                    children: [
                      Text(
                        podCtr.calculateVideoDuration(podCtr.videoPosition),
                        style:  TextStyle(color: Theme.of(context).highlightColor),
                      ),
                       Text(
                        ' / ',
                        style: durationTextStyle,
                      ),
                      Text(
                        podCtr.calculateVideoDuration(podCtr.videoDuration),
                        style: durationTextStyle,
                      ),
                    ],
                  );
                },
              ),
              const Spacer(),
              MaterialIconButton(
                toolTipMesg: podCtr.isFullScreen
                    ? podCtr.podPlayerLabels.exitFullScreen ??
                        'Exit full screen${kIsWeb ? ' (f)' : ''}'
                    : podCtr.podPlayerLabels.fullscreen ??
                        'Fullscreen${kIsWeb ? ' (f)' : ''}',
                color: Theme.of(context).cardColor,
                onPressed: () {
                  if (podCtr.isOverlayVisible) {
                    if (podCtr.isFullScreen) {
                      podCtr.disableFullScreen(context, tag);
                    } else {
                      podCtr.enableFullScreen(tag);
                    }
                  } else {
                    podCtr.toggleVideoOverlay();
                  }
                },
                child: Icon(color: Theme.of(context).highlightColor,
                  podCtr.isFullScreen
                      ? Icons.fullscreen_exit
                      : Icons.fullscreen,
                ),
              ),
            ],
          ),
          GetBuilder<PodGetXVideoController>(
            tag: tag,
            id: 'overlay',
            builder: (podCtr) {
              if (podCtr.isFullScreen) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 20),
                  child: Visibility(
                    visible: podCtr.isOverlayVisible,
                    child: PodProgressBar(
                      tag: tag,
                      alignment: Alignment.topCenter,
                      podProgressBarConfig: podCtr.podProgressBarConfig,
                    ),
                  ),
                );
              }
              return PodProgressBar(
                tag: tag,
                alignment: Alignment.bottomCenter,
                podProgressBarConfig: podCtr.podProgressBarConfig,
              );
            },
          ),
        ],
      ),
    );
  }
}
