import 'package:flutter/material.dart';
import 'package:write_it/widget/widget_support.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> dropDownOptions = ['Data modified', 'Date created'];
  late String dropDownValue = dropDownOptions.first;

  bool isDecending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Write it 📒",
          style: AppWidget.headlineTextFeildStyle(),
        ),
        actions: [
          //=====logout button=======
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person_2_outlined,
              ),
              style: IconButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 211, 240, 209),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  )))
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            ////=====Search bar=========
            TextField(
              decoration: InputDecoration(
                hintText: 'Search your notes',
                prefixIcon: const Icon(Icons.search),
                fillColor: Colors.white,
                filled: true,
                border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isDecending = !isDecending;
                    });
                  },
                  icon: Icon(
                      isDecending ? Icons.arrow_downward : Icons.arrow_upward),
                ),

                //=====Dropdown (short datemodified, datecreated)=======
                DropdownButton(
                  value: dropDownValue,
                  borderRadius: BorderRadius.circular(16),
                  items: dropDownOptions
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Row(
                              children: [
                                Text(e),

                                // ...[] -> this helps to combine two widgets
                                if (e == dropDownValue) ...[
                                  const SizedBox(width: 5),
                                  const Icon(Icons.check)
                                ],
                              ],
                            ),
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      dropDownValue = newValue!;
                    });
                  },
                ),
              ],
            ),

            //Gride View
            const Expanded(
              child: NotesGrid(),
            ),
          ],
        ),
      ),
    );
  }
}

class NotesGrid extends StatelessWidget {
  const NotesGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 7,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, int index) {
          return Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "This is going to be the title",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey[900]),
                  ),
                  const SizedBox(height: 5),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        4,
                        (index) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color.fromARGB(255, 211, 240, 209),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 7),
                          margin: const EdgeInsets.only(right: 3),
                          child: Text(
                            "lable",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[700]),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Expanded(
                      child: Text("this is going to be the content")),
                  Row(
                    children: [
                      Text(
                        "16 Feb, 2002",
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                      Spacer(),
                      Icon(
                        Icons.delete,
                        size: 18,
                        color: Colors.grey[600],
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
