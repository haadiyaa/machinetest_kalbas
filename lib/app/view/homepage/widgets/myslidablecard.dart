
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:machinetest_kalbas/app/resources/constants.dart';
import 'package:machinetest_kalbas/app/view/detailspage/view/detailspage.dart';

class MySlidableCard extends StatelessWidget {
  const MySlidableCard({
    super.key,
    required this.size,
    required this.index,
  });

  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            key: ValueKey(index),
            flex: 1,
            onPressed: (_) {},
            backgroundColor: Colors.red.shade100,
            foregroundColor: Constants.red,
            icon: Icons.favorite,
            label: 'Add to Favourites',
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DetailsPage()));
          },
          child: Card(
            elevation: 10,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size.width * 0.25,
                    width: size.width * 0.2,
                    decoration: BoxDecoration(
                      color: Constants.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  Constants.width10,
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'data scshbwdw djwhdwgdwydg wgdfwtfdutwdf gwdwvduwdgy',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'fghjkkkjhgfg sbhdwyguwy bdhwdwhd wdbwhbdwyd wdwygduy',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month),
                            Text(
                              'data',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
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
        ),
      ),
    );
  }
}
