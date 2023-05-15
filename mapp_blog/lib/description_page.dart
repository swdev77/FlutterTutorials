import 'package:flutter/material.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({
    super.key,
    required this.title,
    required this.imagePath,
  });

  final String title;
  final String imagePath;

  final String description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus tempor posuere ex, vitae posuere ligula tempor eu. Suspendisse egestas tristique malesuada. Fusce ornare nunc eu tincidunt elementum. Sed fringilla ante commodo, elementum sem sit amet, blandit ex. Pellentesque pretium pretium enim ac congue. Sed posuere lacus pulvinar lorem ultrices viverra sed ac dolor. In hac habitasse platea dictumst. Proin accumsan elit felis, id sollicitudin urna suscipit id. Nam ut velit rutrum, dignissim justo sed, blandit tellus. Aenean nec lobortis neque, sit amet dictum urna. Donec vitae tincidunt mauris, non ultricies quam. In at nisi urna. Maecenas ut ultrices quam. Praesent tortor tellus, rhoncus id mi non, accumsan posuere nisl. Nam at aliquam diam. Aliquam et metus eu sapien lacinia ullamcorper vitae varius risus. Aenean aliquam vehicula suscipit. Duis vitae mi lectus. Vivamus molestie nisl quis luctus imperdiet. Aliquam fringilla tortor sit amet erat semper congue. Quisque tristique rhoncus dolor at commodo. Proin congue, magna ac ornare hendrerit, quam tortor sollicitudin elit, quis laoreet ante ante sit amet nunc. Phasellus ut est in ex feugiat lacinia. Etiam id nulla et leo ultricies mattis id et augue. Aliquam in nisl ornare, vulputate diam id, maximus est. Nunc eget fringilla nisl. Mauris pharetra nibh et ex auctor efficitur. Proin a augue ullamcorper justo iaculis cursus at sed nisl. Nunc non elit magna. Nam ante tortor, dapibus sed aliquet ac, commodo vitae lectus. Etiam id magna vestibulum, fermentum nulla at, tincidunt enim. Aliquam iaculis, dui at dictum dignissim, tortor massa porta est, a lacinia nisi mi a dui. Nulla facilisi. Etiam viverra, sapien in venenatis malesuada, eros nunc accumsan augue, sit amet lobortis velit dui non mauris. Aliquam eu sapien rutrum, mattis augue vel, vulputate tortor. Maecenas at rhoncus ex. Duis vehicula libero sed nisl malesuada feugiat.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(imagePath),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(description),
          ],
        ),
      ),
    );
  }
}
