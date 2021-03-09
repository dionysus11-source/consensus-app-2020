import 'package:flutter/material.dart';
import '../consensusItem.dart';

class FirstApp extends StatelessWidget {
  final List<Consensus> list;
  FirstApp({Key key, this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: ListView.builder(
          itemBuilder: (context, position) {
            return Card(
              child: Table(
                border: TableBorder.all(),
                children: <TableRow>[
                  TableRow(children: <Widget>[
                    TableCell(
                      child: Text(''),
                    ),
                    TableCell(
                      child: Text(''),
                    ),
                    TableCell(
                        child: Text(
                      list[position].date[0],
                      style: TextStyle(fontSize: 12),
                    )),
                    TableCell(
                        child: Text(
                      list[position].date[1],
                      style: TextStyle(fontSize: 12),
                    )),
                    TableCell(
                        child: Text(
                      list[position].date[2],
                      style: TextStyle(fontSize: 12),
                    )),
                    TableCell(
                        child: Text(
                      list[position].date[3],
                      style: TextStyle(fontSize: 12),
                    )),
                  ]),
                  TableRow(children: <Widget>[
                    TableCell(
                      child: Text(
                        list[position].companyName,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TableCell(
                      child: Text(
                        '영업이익',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TableCell(
                        child: Text(
                      list[position].profit[0],
                      style: TextStyle(fontSize: 12),
                    )),
                    TableCell(
                        child: Text(
                      list[position].profit[1],
                      style: TextStyle(fontSize: 12),
                    )),
                    TableCell(
                        child: Text(
                      list[position].profit[2],
                      style: TextStyle(fontSize: 12),
                    )),
                    TableCell(
                        child: Text(
                      list[position].profit[3],
                      style: TextStyle(fontSize: 12),
                    )),
                  ]),
                  TableRow(children: <Widget>[
                    TableCell(
                      child: Text(
                        list[position].companyId,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TableCell(
                      child: Text(
                        'EPS',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TableCell(
                        child: Text(
                      list[position].eps[0],
                      textAlign: TextAlign.center,
                    )),
                    TableCell(
                        child: Text(
                      list[position].eps[1],
                      textAlign: TextAlign.center,
                    )),
                    TableCell(
                        child: Text(
                      list[position].eps[2],
                      textAlign: TextAlign.center,
                    )),
                    TableCell(
                        child: Text(
                      list[position].eps[3],
                      textAlign: TextAlign.center,
                    )),
                  ]),
                  TableRow(children: <Widget>[
                    TableCell(
                      child: Text(''),
                    ),
                    TableCell(
                      child: Text(
                        'PEF',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TableCell(
                        child: Text(
                      list[position].per[0],
                      textAlign: TextAlign.center,
                    )),
                    TableCell(
                        child: Text(
                      list[position].per[1],
                      textAlign: TextAlign.center,
                    )),
                    TableCell(
                        child: Text(
                      list[position].per[2],
                      textAlign: TextAlign.center,
                    )),
                    TableCell(
                        child: Text(
                      list[position].per[3],
                      textAlign: TextAlign.center,
                    )),
                  ]),
                ],
              ),
            );
            /*           return Card(
              child: Row(children: [
                Column(
                  children: <Widget>[
                    Text(list[position].companyName),
                    Text(list[position].companyId)
                  ],
                ),
                Column(children: <Widget>[
                  Text('날짜'),
                  Text('영업이익'),
                  Text('EPS'),
                  Text('PER')
                ]),
                Column(
                  children: <Widget>[
                    Text(list[position].date[0]),
                    Text(list[position].profit[0]),
                    Text(list[position].eps[0]),
                    Text(list[position].per[0]),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(list[position].date[1]),
                    Text(list[position].profit[1]),
                    Text(list[position].eps[1]),
                    Text(list[position].per[1]),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(list[position].date[2]),
                    Text(list[position].profit[2]),
                    Text(list[position].eps[2]),
                    Text(list[position].per[2]),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(list[position].date[3]),
                    Text(list[position].profit[3]),
                    Text(list[position].eps[3]),
                    Text(list[position].per[3]),
                  ],
                ),
              ]),
            );*/
          },
          itemCount: list.length,
        )),
      ),
    );
  }
}
