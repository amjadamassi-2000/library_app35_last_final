import 'package:flutter/material.dart';






class Pdf {
  String title;
  String pdfUrl;
  bool isNew;

  Pdf(this.title , this.pdfUrl , this.isNew);

}



 List dataFiles = [

   Pdf(
       "مذكرة المراجعة النهائية في الرياضيات للصف الأول الثانوي الفصل الدراسي الأول من إعداد مستر عبدالله خالد- تدريبات بدون نموذج إجابة - نظام حديث - بابل شيت ",
       "http://www.africau.edu/images/default/sample.pdf",
       true,
   ),

   Pdf(
     "مذكرة المراجعة النهائية في الرياضيات للصف الأول الثانوي الفصل الدراسي الأول من إعداد مستر عبدالله خالد",
     "http://www.africau.edu/images/default/sample.pdf",
     false,
   ),


   Pdf(
     "مذكرة المراجعة النهائية في الرياضيات للصف الأول الثانوي الفصل الدراسي الأول ",
     "http://www.africau.edu/images/default/sample.pdf",
     false,
   ),


   Pdf(
     "مذكرة المراجعة النهائية في الرياضيات",
     "http://www.africau.edu/images/default/sample.pdf",
     true,
   ),
   Pdf(
     "مذكرة المراجعة النهائية في الرياضيات",
     "http://www.africau.edu/images/default/sample.pdf",
     true,
   ),
   Pdf(
     "مذكرة المراجعة النهائية في الرياضيات",
     "http://www.africau.edu/images/default/sample.pdf",
     true,
   ),



 ];