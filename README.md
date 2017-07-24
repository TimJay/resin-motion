# Camera Motion Detection

A software motion detection container for [resinOS][1] based on [motion][2].
Serves the captured photos via [nginx][3] and pushes notifications via [Pushover][4] API.

## Configuration
The following items may be configured via environment variables:

- PUSHOVER_TOKEN: Your Pushover application's API token.
- PUSHOVER_USERKEY: The user key of your Pushover user.
- DEVICEURL: The public URL of your resin.io device.
- VIDEODEVICE: Video device to be used for capturing.
- ROTATE: Rotate image this number of degrees. The rotation affects all saved images as well as movies. Valid values: 0 (default = no rotation), 90, 180 and 270.
- WIDTH: Image width (pixels).
- HEIGHT: Image height (pixels).
- FRAMERATE: Maximum number of frames to be captured per second. Valid range: 2-100.
- FRAMETIME: Minimum time in seconds between capturing picture frames from the camera. Default: 0 = disabled - the capture rate is given by the camera framerate. This option is used when you want to capture images at a rate lower than 2 per second.
- THRESHOLD: Threshold for number of changed pixels in an image that triggers motion detection (default: 1500)
- NOISELEVEL: Noise threshold for the motion detection (default: 32)
- MASKFILE: PGM file to use as a sensitivity mask. Either full path name to file or URL (http*) to download file from on startup. (Default: not defined)
- SMARTMASKSPEED: Dynamically create a mask file during operation (default: 5) Adjust speed of mask changes from 0 (off) to 10 (fast)
- LIGHTSWITCH: Ignore sudden massive light intensity changes given as a percentage of the picture area that changed intensity. Valid range: 0 - 100 , default: 0 = disabled
- MINMOTIONFRAMES: Picture frames must contain motion at least the specified number of frames in a row before they are detected as true motion. At the default of 1, all motion is detected. Valid range: 1 to thousands, recommended 1-5
- EVENTGAP: Event Gap is the seconds of no motion detection that triggers the end of an event. An event is defined as a series of motion images taken within a short timeframe. Recommended value is 60 seconds (Default).
- OUTPUTPICTURES: Output 'normal' pictures when motion is detected. Valid values: on, off, first, best, center (default: on)
- OUTPUTMOVIES: Use ffmpeg to encode movies in realtime (default: off)
 
## License

This container definition is licensed under [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0).

[1]: https://resinos.io/
[2]: https://github.com/Motion-Project/motion
[3]: https://nginx.org/en/
[4]: https://pushover.net/