/*: OnBoardingSlider(
          finishButtonText: "Register",
          onFinish: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AuthScreen(
                          isLogin: false,
                        )));
          },
          skipTextButton: const Text(
            'Skip',
            style: TextStyle(
              fontSize: 16,
              color: kDarkBlueColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: const Text(
            'Login',
            style: TextStyle(
              fontSize: 16,
              color: kDarkBlueColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailingFunction: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AuthScreen(
                          isLogin: true,
                        )));
          },
          controllerColor: kDarkBlueColor,
          totalPage: 2,
          headerBackgroundColor: const Color.fromARGB(255, 243, 232, 232),
          pageBackgroundColor: const Color.fromARGB(255, 235, 225, 225),
          background: [
            Image.network(
                height: 450,
                width: MediaQuery.of(context).size.width,
                "https://images.pexels.com/photos/22814539/pexels-photo-22814539/free-photo-of-person-walking-dog-in-forest.jpeg?auto=compress&cs=tinysrgb&w=600"),
            Image.network(
                height: 450,
                width: MediaQuery.of(context).size.width,
                "https://images.pexels.com/photos/22814539/pexels-photo-22814539/free-photo-of-person-walking-dog-in-forest.jpeg?auto=compress&cs=tinysrgb&w=600"),
          ],
          speed: 1.8,
          pageBodies: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 480,
                  ),
                  Text(
                    'You’ve reached your destination.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kDarkBlueColor,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Sliding with animation',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 480,
                  ),
                  Text(
                    'Start now!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kDarkBlueColor,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Where everything is possible and customize your onboarding.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),*/