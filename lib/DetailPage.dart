import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Map detail;
  DetailPage({Key key, this.detail}) : super(key: key);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    List ad = widget.detail['address'].toString().split(" ");
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.green,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20),)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_back_ios_outlined),
                      SizedBox(width: 8),
                      Text('GST Profile',style: TextStyle(color: Colors.white,fontSize: 20,decoration: TextDecoration.none))
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text('GSTIN of Tax Payer',style: TextStyle(color: Colors.white,fontSize: 17,decoration: TextDecoration.none)),
                  Text('*********'+widget.detail['id'],style: TextStyle(color: Colors.white,fontSize: 20,decoration: TextDecoration.none)),
                  SizedBox(height: 10,),
                  Text('Master India Private Limited',style: TextStyle(color: Colors.white,fontSize: 18,decoration: TextDecoration.none)),
                  SizedBox(height: 6,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: widget.detail['status'] ?
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Active',style: TextStyle(color: Colors.green,fontSize: 10,decoration: TextDecoration.none)),
                    ) : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('InActive',style: TextStyle(color: Colors.red,fontSize: 10,decoration: TextDecoration.none)),
                    )
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on,color: Colors.green),
                      SizedBox(width: 8,),
                      Text('Principal Place of Business',style: TextStyle(color: Colors.black,fontSize: 15,decoration: TextDecoration.none))
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text(widget.detail['address'].toString(),style: TextStyle(color: Colors.black,fontSize: 20,decoration: TextDecoration.none)),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.food_bank_rounded,color: Colors.green),
                      SizedBox(width: 8,),
                      Text('Additional Place of Business',style: TextStyle(color: Colors.black,fontSize: 15,decoration: TextDecoration.none))
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text(ad[1],style: TextStyle(color: Colors.black,fontSize: 20,decoration: TextDecoration.none)),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200]
                    ),
                    child: Column(
                      children: [
                        Text('Name',style: TextStyle(color: Colors.black,fontSize: 18,decoration: TextDecoration.none)),
                        SizedBox(height: 10,),
                        Text(widget.detail['name'].toString(),style: TextStyle(color: Colors.black,fontSize: 18,decoration: TextDecoration.none)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200]
                    ),
                    child: Column(
                      children: [
                        Text('Centre',style: TextStyle(color: Colors.black,fontSize: 18,decoration: TextDecoration.none)),
                        SizedBox(height: 10,),
                        Text('-----',style: TextStyle(color: Colors.black,fontSize: 18,decoration: TextDecoration.none)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200]
                    ),
                    child: Column(
                      children: [
                        Text('Taxpayer Type',style: TextStyle(color: Colors.black,fontSize: 18,decoration: TextDecoration.none)),
                        SizedBox(height: 10,),
                        Text(widget.detail['tax_payer_type'].toString(),style: TextStyle(color: Colors.black,fontSize: 18,decoration: TextDecoration.none)),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Business Type',style: TextStyle(color: Colors.black,fontSize: 18,decoration: TextDecoration.none)),
                  SizedBox(height: 10,),
                  Text(widget.detail['business_type'].toString(),style: TextStyle(color: Colors.black,fontSize: 18,decoration: TextDecoration.none)),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Date of Registration',style: TextStyle(color: Colors.black,fontSize: 18,decoration: TextDecoration.none)),
                  SizedBox(height: 10,),
                  Text(widget.detail['date_of_reg'],style: TextStyle(color: Colors.black,fontSize: 18,decoration: TextDecoration.none)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}