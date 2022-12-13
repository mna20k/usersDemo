import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void feedbackDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (ctx, a1, a2) {
      return Container();
    },
    transitionBuilder: (ctx, a1, a2, child) {
      var curve = Curves.easeInOut.transform(a1.value);
      return Transform.scale(
        scale: curve,
        child: Center(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(20),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: SingleChildScrollView(
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        alignment: Alignment.topRight,
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close, size: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
                            child: Text('Thanks for availing service from'),
                          ),
                          const CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.grey,
                            child: FlutterLogo(
                              size: 40,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 5.0, bottom: 20.0),
                            child: Text(
                              'Dr. Nupur Garg',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Text('Rate you experience'),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 20.0),
                            child: RatingBar.builder(
                              initialRating: 5,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemCount: 5,
                              itemSize: 25,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 1.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star_border,
                                color: Colors.green,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text("Leave your comments"),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5, bottom: 15),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const TextField(
                              textAlignVertical: TextAlignVertical.top,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              maxLength: 250,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: SizedBox(
                                        height: 162,
                                        child: Column(
                                          children: [
                                            const Icon(
                                              Icons.check_circle_outlined,
                                              color: Colors.green,
                                              size: 75,
                                            ),
                                            const Text(
                                              "Your feedback submitted successfully",
                                              textAlign: TextAlign.center,
                                            ),
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text(
                                                'Close',
                                                style: TextStyle(
                                                    color: Colors.green),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: const Text('Submit'),
                          ),
                          const SizedBox(height: 10)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
