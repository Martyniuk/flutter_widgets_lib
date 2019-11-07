// --> https://dribbble.com/shots/6162682-Travel-Guide-App-Concept

// Core
import 'package:flutter/material.dart';
/* Layout purpose only */

List data = [
  {
    'name': 'Antelope Canyon',
    'image':
        'https://images.unsplash.com/photo-1527498913931-c302284a62af?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
    'description':
        'Over the years, Lover Antelope Canyon has become a favorite gathering pace for photographers tourists, and visitors from the world.',
    'date': 'Mar 20, 2019',
    'rating': '4.7',
    'cost': '\$40.00'
  },
  {
    'name': 'Genteng Lembang',
    'image':
        'https://images.unsplash.com/photo-1548560781-a7a07d9d33db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=581&q=80',
    'description':
        'Over the years, Lover Antelope Canyon has become a favorite gathering pace for photographers tourists, and visitors from the world.',
    'date': 'Mar 24, 2019',
    'rating': '4.83',
    'cost': '\$50.00'
  },
  {
    'name': 'Kamchatka Peninsula',
    'image':
        'https://images.unsplash.com/photo-1542869781-a272dedbc93e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=983&q=80',
    'description':
        'Over the years, Lover Antelope Canyon has become a favorite gathering pace for photographers tourists, and visitors from the world.',
    'date': 'Apr 18, 2019',
    'rating': '4.7',
    'cost': '\$30.00'
  },
];

var profileImage =
    'https://www.imgmodels.com/sites/default/files/283adc16-7317-4189-bf7f-816367d68adf.jpg';

class Travel2App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Search for place',
                      style: TextStyle(color: Colors.black54),
                    ),
                    Text(
                      'Destination',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                        letterSpacing: .5,
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.circular(50.0),
                      elevation: 5.0,
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(profileImage),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5.0,
                      child: Container(
                        alignment: Alignment.topRight,
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          border: Border.all(
                            width: 1.0,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 28.0),
            Container(
              height: 235.0,
              width: double.infinity,
              child: PlacesSection(),
            ),
            SizedBox(height: 14.0),
            Text(
              'VIEW ALL -->',
              style: TextStyle(color: Colors.red[400], fontSize: 18.0),
            ),
            SizedBox(height: 14.0),
            Divider(),
            TabBarSection(),
          ],
        ),
      ),
    );
  }
}

class TabBarSection extends StatefulWidget {
  @override
  _TabBarSectionState createState() => _TabBarSectionState();
}

class _TabBarSectionState extends State<TabBarSection>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Popular'),
    Tab(text: 'New'),
    Tab(text: 'Recomended'),
    Tab(text: 'Privet'),
    Tab(text: 'Wo'),
    Tab(text: 'Ty'),
    Tab(text: 'Tam'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.0,
      width: double.infinity,
      child: Scaffold(
        appBar: TabBar(
          controller: _tabController,
          tabs: myTabs,
          labelColor: Colors.black,
          labelStyle: TextStyle(
            fontSize: 16.0,
            letterSpacing: .6,
            fontWeight: FontWeight.w500,
          ),
          labelPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
          indicatorWeight: 4.0,
          unselectedLabelStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.dashed,
          ),
          indicatorColor: Colors.brown[400],
          isScrollable: true,
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            TabItem(),
            TabItem(),
            TabItem(),
            TabItem(),
            TabItem(),
            TabItem(),
            TabItem(),
          ],
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  const TabItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.0,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  data[2]['image'],
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, bottom: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${data[2]['name']}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Text(
                                    '${data[2]['date']}',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  data[0]['image'],
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, bottom: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${data[0]['name']}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Text(
                                    '${data[0]['date']}',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            data[1]['image'],
                          ),
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20.0, bottom: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${data[1]['name']}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              '${data[1]['date']}',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      data[0]['image'],
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${data[0]['name']}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        '${data[0]['date']}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlacesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: data.map((item) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondScreen(item),
              ),
            );
          },
          child: Stack(
            children: <Widget>[
              Hero(
                tag: item['name'],
                child: Container(
                  width: 150,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        image: NetworkImage(
                          item['image'],
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 15.0),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            item['rating'],
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            item['name'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: .7,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            item['date'],
                            style: TextStyle(color: Colors.white54),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );

    // return ListView(
    //   scrollDirection: Axis.horizontal,
    //   children: data.map((item) {
    //     return GestureDetector(
    //       onTap: () {
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //             builder: (context) => SecondScreen(item),
    //           ),
    //         );
    //       },
    //       child: Hero(
    //         tag: item['name'],
    //         child: Container(
    //           height: 200.0,
    //           width: 150.0,
    //           margin: EdgeInsets.only(right: 15.0),
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(15.0),
    //             image: DecorationImage(
    //               colorFilter:
    //                   ColorFilter.mode(Colors.black54, BlendMode.colorDodge),
    //               image: NetworkImage(item['image']),
    //               fit: BoxFit.cover,
    //             ),
    //           ),
    //           child: Padding(
    //             padding: const EdgeInsets.all(15.0),
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: <Widget>[
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.end,
    //                   children: <Widget>[
    //                     Text(
    //                       item['rating'],
    //                       style: TextStyle(color: Colors.white, fontSize: 18.0),
    //                     )
    //                   ],
    //                 ),
    //                 Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: <Widget>[
    //                     Text(
    //                       item['name'],
    //                       style: TextStyle(
    //                         color: Colors.white,
    //                         fontSize: 22.0,
    //                         fontWeight: FontWeight.bold,
    //                         letterSpacing: .7,
    //                       ),
    //                     ),
    //                     SizedBox(height: 10.0),
    //                     Text(
    //                       item['date'],
    //                       style: TextStyle(color: Colors.white54),
    //                     ),
    //                   ],
    //                 )
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     );
    //   }).toList(),
    // );
  }
}

class SecondScreen extends StatelessWidget {
  final data;
  const SecondScreen(this.data);

  Widget _renderStars() {
    final number = data['rating'];
    double stars = double.parse(number); // from string to double
    int starsRounded = stars.floor();
    double rest = stars - starsRounded;
    List<Widget> result = [];

    for (var i = 0; i < starsRounded; i++) {
      Widget icon = Icon(Icons.star, size: 32.0, color: Colors.yellow);

      result.add(icon);
    }

    if (rest > 0.5) {
      Widget halfStar =
          Icon(Icons.star_half, size: 28.0, color: Colors.yellowAccent);
      result.add(halfStar);
    }

    return Row(
      children: result,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Hero(
            tag: data['name'],
            child: Image.network(
              data['image'],
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.darken,
              color: Colors.black54,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 55.0, horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      RichText(
                        text: TextSpan(
                          text: '02',
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: .9,
                          ),
                          children: <InlineSpan>[
                            TextSpan(
                              text: '/10',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 500.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${data['name']}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 48.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: .8),
                        ),
                        SizedBox(height: 30.0),
                        Row(
                          children: <Widget>[
                            _renderStars(),
                            SizedBox(width: 20.0),
                            Text(
                              '${data['rating']}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 30.0),
                        Text(
                          '${data['description']}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            letterSpacing: .8,
                            height: 2.0,
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Text(
                          'READ MORE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(
                              Icons.monetization_on,
                              size: 42.0,
                              color: Colors.white,
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  '${data['cost']}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: .7,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  '${data['date']}',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16.0),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    // return Scaffold(
    //   body: Container(
    //     height: MediaQuery.of(context).size.height,
    //     width: MediaQuery.of(context).size.width,
    //     decoration: BoxDecoration(
    //       image: DecorationImage(
    //         fit: BoxFit.cover,
    //         image: NetworkImage(data['image']),
    //       ),
    //     ),
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(vertical: 55.0, horizontal: 30.0),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: <Widget>[
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: <Widget>[
    //               IconButton(
    //                 icon: Icon(
    //                   Icons.arrow_back_ios,
    //                   color: Colors.white,
    //                   size: 24.0,
    //                 ),
    //                 onPressed: () {
    //                   Navigator.pop(context);
    //                 },
    //               ),
    //               RichText(
    //                 text: TextSpan(
    //                   text: '02',
    //                   style: TextStyle(
    //                     fontSize: 32.0,
    //                     fontWeight: FontWeight.bold,
    //                     letterSpacing: .9,
    //                   ),
    //                   children: <InlineSpan>[
    //                     TextSpan(
    //                       text: '/10',
    //                       style: TextStyle(
    //                         fontSize: 16.0,
    //                         fontWeight: FontWeight.w400,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //           Container(
    //             height: 500.0,
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: <Widget>[
    //                 Text(
    //                   '${data['name']}',
    //                   style: TextStyle(
    //                       color: Colors.white,
    //                       fontSize: 48.0,
    //                       fontWeight: FontWeight.w600,
    //                       letterSpacing: .8),
    //                 ),
    //                 SizedBox(height: 30.0),
    //                 Row(
    //                   children: <Widget>[
    //                     _renderStars(),
    //                     SizedBox(width: 20.0),
    //                     Text(
    //                       '${data['rating']}',
    //                       style: TextStyle(
    //                         color: Colors.white,
    //                         fontSize: 18.0,
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //                 SizedBox(height: 30.0),
    //                 Text(
    //                   '${data['description']}',
    //                   style: TextStyle(
    //                     color: Colors.grey,
    //                     fontSize: 18.0,
    //                     letterSpacing: .8,
    //                     height: 2.0,
    //                   ),
    //                 ),
    //                 SizedBox(height: 15.0),
    //                 Text(
    //                   'READ MORE',
    //                   style: TextStyle(
    //                     color: Colors.white,
    //                     fontSize: 22.0,
    //                   ),
    //                 ),
    //                 SizedBox(height: 15.0),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: <Widget>[
    //                     Icon(
    //                       Icons.monetization_on,
    //                       size: 42.0,
    //                       color: Colors.white,
    //                     ),
    //                     Column(
    //                       children: <Widget>[
    //                         Text(
    //                           '${data['cost']}',
    //                           style: TextStyle(
    //                             color: Colors.white,
    //                             fontSize: 28.0,
    //                             fontWeight: FontWeight.bold,
    //                             letterSpacing: .7,
    //                           ),
    //                         ),
    //                         SizedBox(height: 5.0),
    //                         Text(
    //                           '${data['date']}',
    //                           style:
    //                               TextStyle(color: Colors.grey, fontSize: 16.0),
    //                         ),
    //                       ],
    //                     )
    //                   ],
    //                 )
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
