import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> dropDownOptions = ['Data modified', 'Date created'];
  late String dropDownValue = dropDownOptions.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Write it 📒"),
        actions: [
          //=====logout button=======
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          )
        ],
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
                border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_downward),
                ),

                //=====Dropdown (short datemodified, datecreated)=======
                DropdownButton(
                  value: dropDownValue,
                  items: dropDownOptions
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      dropDownValue = newValue!;
                    });
                  },
                ),
                const Spacer(),
                //======Menu Button (list or Grid mode)=========
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                ),
              ],
            ),

            //Gride View
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemBuilder: (context, int index) {
                    return Container(
                      child: Column(
                        children: [
                          const Text("This is going to be the title"),
                          Row(
                            children: [
                              Container(
                                child: const Text("lable"),
                              )
                            ],
                          ),
                          const Text("this is going to be the content"),
                          const Row(
                            children: [
                              Text("16 Feb, 2002"),
                              Icon(Icons.delete)
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
