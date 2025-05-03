import 'package:flutter/material.dart';
import 'package:learen_3/features/more/view/App_lang.dart';
import 'package:learen_3/features/more/widgets/MyListTile.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("المزيد")),
      body: ListView(
        children: [
          MyListTile(
              title: "تعديل ملفي الشخصي",
              subtitle: "اسم المستخدم,كلمة المرور,رقم الهاتف",
              icon: Icons.person),
          MyListTile(title: "إنجازاتي", icon: Icons.stop_circle_rounded),
          MyListTile(
              title: "الأذكار",
              subtitle: "أذكار يومية",
              icon: Icons.waving_hand_rounded),
          MyListTile(
              title: "اتجاه القبلة",
              subtitle: "تحديد اتجاه القبلة بدقة",
              icon: Icons.crop_square),
          MyListTile(
              title: "اوقات الصلاة",
              subtitle: "مواقيت الصلاة اليومية",
              icon: Icons.accessibility_new_rounded),
          MyListTile(
              title: "تحميل المصحف",
              subtitle: "تحميل مصاحف بروايات اخرى",
              icon: Icons.download_for_offline_rounded),
          MyListTile(
              title: "رأيك",
              subtitle: "شاركنا رايك الشخصي",
              icon: Icons.textsms_rounded),
          MyListTile(
              title: "سياسة الخصوصية",
              subtitle: "سياسة الخصوصية",
              icon: Icons.gpp_maybe_outlined),
          MyListTile(
              title: "عن التطبيق",
              subtitle: "التعريف بهدف التطبيق",
              icon: Icons.report_gmailerrorred_outlined),
          MyListTile(
              title: "مشاركة التطبيق",
              subtitle: "مشاركة رابط التطبيق مع الاصدقاء",
              icon: Icons.share),
          MyListTile(
            title: "لغة التطبيق",
            icon: Icons.translate_rounded,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppLang(),
                  ));
            },
          ),
          MaterialButton(
            onPressed: () {},
            child: Center(
                child: Row(
              children: [Text("تسجيل الخروج"), Icon(Icons.outbox_sharp)],
            )),
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
