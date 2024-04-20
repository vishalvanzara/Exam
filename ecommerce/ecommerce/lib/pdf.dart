import 'dart:typed_data';
import 'package:ecommerce/main.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfData extends StatefulWidget {
  final double proTotal;
  final double proPrice;
  const PdfData({super.key, required this.proTotal, required this.proPrice});

  @override
  State<PdfData> createState() => _PdfDataState();
}

class _PdfDataState extends State<PdfData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: PdfPreview(build: (PdfPageFormat Format) {
      return pdfDemo(widget.proTotal,widget.proPrice);
    }));
  }
}

Future<Uint8List> pdfDemo(proTotal,proPrice) async {
  final pdfDoc = pw.Document();
  pdfDoc.addPage(pw.Page(
    pageFormat: PdfPageFormat.a4,
    build: (pw.Context context){
      return  pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
           pw.Center(
             child: pw.Text('App Mania',style: pw.TextStyle(
               fontSize: 40,
               fontWeight: pw.FontWeight.bold,
             )),
           ),
          pw.SizedBox(height: 20),
          pw.Text('test,\ntest,\n',style: pw.TextStyle(
            fontSize: 24,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.SizedBox(height: 10),
          pw.Divider(),
          pw.SizedBox(height: 10),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Column(
                children: [
                  pw.Text('Product Name',style: pw.TextStyle(
                    fontSize: 26,
                    fontWeight: pw.FontWeight.bold,
                  )),
                  pw.SizedBox(height: 10),
                  ...cartData.map((e) =>
                      pw.Text(e['name'],style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 24
                      ),),).toList(),
                ]
              ),
              pw.Column(
                  children: [
                    pw.Text('Qty',style: pw.TextStyle(
                      fontSize: 26,
                      fontWeight: pw.FontWeight.bold,
                    )),
                    pw.SizedBox(height: 10),
                    ...cartData.map((e) =>
                        pw.Text(e['qty'].toString(),style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 24
                        ),),).toList(),
                  ]
              ),
              pw.Column(
                  children: [
                    pw.Text('Price',style: pw.TextStyle(
                      fontSize: 26,
                      fontWeight: pw.FontWeight.bold,
                    )),
                    pw.SizedBox(height: 10),
                    ...cartData.map((e) =>
                        pw.Text(e['total'].toString(),style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 24
                        ),),).toList(),
                  ]
              ),
            ]
          ),
          pw.SizedBox(height: 15),
          pw.Divider(),
          pw.SizedBox(height: 15),
          pw.Column(
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Subtotal', style: pw.TextStyle(fontSize: 24,fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(proPrice.toString(),style: pw.TextStyle(fontSize: 24,fontWeight: pw.FontWeight.bold)),
                  // Text(widget.Total as String),
                ],
              ),
              pw.SizedBox(height: 15),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Delivery', style: pw.TextStyle(fontSize: 24,fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text('\$5.00',style: pw.TextStyle(fontSize: 24,fontWeight: pw.FontWeight.bold)),
                  // Text(widget.Total as String),
                ],
              ),
              pw.SizedBox(height: 15),
              pw.Divider(),
              pw.SizedBox(height: 15),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Total', style: pw.TextStyle(fontSize:24,fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(proTotal.toString(),style: pw.TextStyle(fontSize: 24,fontWeight: pw.FontWeight.bold)),
                  // Text(widget.Total as String),
                ],
              ),
            ]
          ),
        ]
      );
    }
  ));

  await Printing.layoutPdf(onLayout:  (PdfPageFormat Format)  async => pdfDoc.save());

  return pdfDoc.save();
}
