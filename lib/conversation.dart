import 'package:flutter/material.dart';
import 'storylist.dart';
import 'conversationlist.dart';

class Conversation extends StatefulWidget {
  const Conversation({Key? key}) : super(key: key);

  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  TextEditingController _searchController = new TextEditingController();

  stories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFe9eaec)),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      size: 33,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  width: 75,
                  child: Align(
                    child: Text(
                      "Your Story",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
              children: List.generate(storyList.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    child: Stack(
                      children: [
                        storyList[index]['hasStory']
                            ? Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.blueAccent, width: 3),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Container(
                                    height: 75,
                                    width: 75,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          storyList[index]['imageUrl'],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      storyList[index]['imageUrl'],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                        storyList[index]['isOnline']
                            ? Positioned(
                                top: 38,
                                left: 42,
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF66BB6A),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: const Color(0xFFFFFFFF),
                                        width: 3),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
                    child: Align(
                      child: Text(
                        storyList[index]['name'],
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ],
              ),
            );
          })),
        ],
      ),
    );
  }

  conversations(BuildContext context) {
    return Column(
      children: List.generate(conversationList.length, (index) {
        return InkWell(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  child: Stack(
                    children: [
                      conversationList[index]['hasStory']
                          ? Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.blueAccent,
                                  width: 3,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                  height: 75,
                                  width: 75,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            conversationList[index]
                                                ['imageUrl']),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    conversationList[index]['imageUrl'],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      conversationList[index]['isOnline']
                          ? Positioned(
                              left: 42,
                              top: 38,
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: const Color(0xFF66BB6A),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xFFFFFFFF),
                                      width: 3,
                                    )),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      conversationList[index]['name'],
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 135,
                      child: Text(
                        conversationList[index]['message'] +
                            " - " +
                            conversationList[index]['time'],
                        style: TextStyle(
                            fontSize: 15,
                            color: const Color(0xFF000000).withOpacity(0.7)),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://randomuser.me/api/portraits/men/11.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const Text(
                    "Chats",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(Icons.info)
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFe9eaec),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  cursorColor: const Color(0xFF000000),
                  controller: _searchController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: const Color(0xFF000000).withOpacity(0.5),
                    ),
                    hintText: "Search",
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              stories(),
              const SizedBox(
                height: 20,
              ),
              conversations(context),
            ],
          ),
        ),
      ),
    );
  }
}
