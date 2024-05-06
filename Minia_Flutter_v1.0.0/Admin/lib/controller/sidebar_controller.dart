// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:minia_web_project/view/Apps/Emails/emailview.dart';
import 'package:minia_web_project/view/Apps/contactList/contact_view.dart';
import 'package:minia_web_project/view/Apps/contactList/profile_view.dart';
import 'package:minia_web_project/view/Apps/invoices/invoice_details.dart';
import 'package:minia_web_project/view/Apps/invoices/invoice_view.dart';
// import 'package:minia_web_project/view/Forms/Editors_and_uploads/editor.dart';
import 'package:minia_web_project/view/Forms/Editors_and_uploads/uploads.dart';
import 'package:minia_web_project/view/Forms/advanced_plugins/advanced_plugin.dart';
import 'package:minia_web_project/view/Forms/form_validation/form_validation.dart';
import 'package:minia_web_project/view/Forms/mask/form_mask.dart';
import 'package:minia_web_project/view/Forms/wizard/wizard.dart';
import 'package:minia_web_project/view/Pages/Price/pricing.dart';
import 'package:minia_web_project/view/Pages/faq.dart';
import 'package:minia_web_project/view/Pages/starter_page.dart';
import 'package:minia_web_project/view/Pages/time_line.dart';
import 'package:minia_web_project/view/Tables/BootStraps/bootstrap_basic_view.dart';
import 'package:minia_web_project/view/Tables/DataTable/default_datatable.dart';
import 'package:minia_web_project/view/Tables/editable_tables.dart';
import '../view/Apps/blog/blog_details.dart';
import '../view/Apps/blog/blog_view.dart';
import '../view/Apps/calendar/calendar.dart';
import '../view/Apps/chats/chat.dart';
import '../view/Forms/basic_elements_container/basic_elements.dart';
import '../view/dashboard.dart';

class SideBarController extends GetxController {
  RxInt index = 0.obs;

  var page = [
    // Dashboard(), //0
    Calender(), //1
    ChatView(), //2
    EmailView(), //3
    EmailView(), //4
    InvoiceView(), //5
    InvoiceDetail(), //6
    ContactView(), //7
    ContactView(), //8
    ProfileView(), //9
    BlogView(), //10
    BlogView(), //11
    BlogDetailMain(), //12
    StarterPage(), //13
    TimelinePage(), //14
    FAQ(), //15
    Pricing(), //16
    BasicElements(), //17
    FormValidation(), //18
    AdvancedPlug(), //19
    Uploads(), //20
    FormWizard(), //21
    FormMask(), //22
    BootstrapBasic(), //23
    DataTableMain(), // 24
    EditableTable(), //25
  ];
}

// Editors(), //20