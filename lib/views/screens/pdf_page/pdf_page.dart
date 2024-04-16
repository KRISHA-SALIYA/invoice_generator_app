import 'dart:async';
import 'package:d_mart_bill/utils/product_page.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';

import 'package:printing/printing.dart';

class InvoicePage extends StatefulWidget {
  const InvoicePage({super.key});

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  FutureOr<Uint8List> generatePDF({required Size s}) async {
    double total = 0.0;
    double payAble = 0.0;
    for (var e in AllData.cartProduct) {
      total += e['price'] * e['qty'];
    }
    ByteData byteData = await rootBundle.load('assets/image/d_mart.jpg');
    pw.Document pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        margin: pw.EdgeInsets.zero,
        build: (pw.Context context) => pw.Stack(
          children: [
            pw.Container(
              height: double.infinity,
              width: double.infinity,
              decoration: pw.BoxDecoration(
                image: pw.DecorationImage(
                  image: pw.MemoryImage(byteData.buffer.asUint8List()),
                  fit: pw.BoxFit.fill,
                ),
                border: pw.Border.all(
                  color: PdfColors.amber,
                  width: 1,
                ),
              ),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(25),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.SizedBox(
                    height: s.height * 0.05,
                  ),
                  pw.Row(
                    children: [
                      pw.Container(
                        height: s.height * 0.15,
                        width: s.width * 0.35,
                        decoration: pw.BoxDecoration(
                          shape: pw.BoxShape.circle,
                          image: pw.DecorationImage(
                            image: pw.MemoryImage(
                              byteData.buffer.asUint8List(),
                            ),
                            fit: pw.BoxFit.cover,
                          ),
                        ),
                      ),
                      pw.SizedBox(
                        width: s.width * 0.09,
                      ),
                      pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            "D Mart",
                            style: pw.TextStyle(
                              color: PdfColors.black,
                              fontSize: 35,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "Address : Vesu",
                            maxLines: 3,
                            style: pw.TextStyle(
                              color: PdfColors.black,
                              fontSize: 18,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  pw.SizedBox(
                    height: s.height * 0.03,
                  ),
                  pw.Divider(
                    color: PdfColors.black,
                    thickness: 2,
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                    children: [
                      pw.Text(
                        "Sr No.",
                        style: pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 18,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "Product Name",
                        style: pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 18,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "Qty",
                        style: pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 18,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "Price",
                        style: pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 18,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "Total Price",
                        style: pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 18,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  pw.Divider(
                    color: PdfColors.black,
                    thickness: 2,
                  ),
                  pw.SizedBox(
                    height: s.height * 0.005,
                  ),
                  ...List.generate(
                    AllData.cartProduct.length,
                    (index) => pw.Container(
                      height: s.height * 0.04,
                      width: double.infinity,
                      color:
                          index % 2 != 0 ? PdfColors.white : PdfColors.green300,
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                        children: [
                          pw.Text(
                            "${index + 1}",
                            style: const pw.TextStyle(
                              color: PdfColors.black,
                              fontSize: 16,
                            ),
                          ),
                          pw.Text(
                            AllData.cartProduct[index]['title'],
                            style: const pw.TextStyle(
                              color: PdfColors.black,
                              fontSize: 16,
                            ),
                          ),
                          pw.SizedBox(width: s.width * 0.03),
                          pw.Text(
                            "${AllData.cartProduct[index]['qty']}",
                            style: const pw.TextStyle(
                              color: PdfColors.black,
                              fontSize: 16,
                            ),
                          ),
                          pw.Text(
                            "${AllData.cartProduct[index]['price']}",
                            style: const pw.TextStyle(
                              color: PdfColors.black,
                              fontSize: 16,
                            ),
                          ),
                          pw.Text(
                            "${AllData.cartProduct[index]['price'] * AllData.cartProduct[index]['qty']}",
                            style: const pw.TextStyle(
                              color: PdfColors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  pw.SizedBox(
                    height: s.height * 0.05,
                  ),
                  pw.Divider(
                    color: PdfColors.black,
                    thickness: 2,
                  ),
                  pw.Row(
                    children: [
                      pw.SizedBox(
                        width: s.width * 0.05,
                      ),
                      pw.Text(
                        "Total",
                        style: pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 18,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.SizedBox(
                        width: s.width * 0.95,
                      ),
                      pw.Text(
                        total.toString(),
                        style: pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 18,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.SizedBox(
                        width: s.width * 0.05,
                      ),
                      pw.Text(
                        "Discount",
                        style: pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 18,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.SizedBox(
                        width: s.width * 0.87,
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.SizedBox(
                        width: s.width * 0.05,
                      ),
                      pw.Text(
                        "Total Amount ",
                        style: pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 18,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.SizedBox(
                        width: s.width * 0.76,
                      ),
                      pw.Text(
                        payAble.toString(),
                        style: pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 18,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  pw.Divider(
                    color: PdfColors.black,
                    thickness: 2,
                  ),
                  pw.SizedBox(
                    height: s.height * 0.03,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    int counter = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Invoice PDF"),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      body: PdfPreview(
        build: (format) => generatePDF(s: s),
      ),
    );
  }
}
