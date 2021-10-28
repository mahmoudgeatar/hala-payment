import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hala/statics/color.dart';
import 'package:hala/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';
import '../provider/login_provider.dart';
import '../widgets/leading_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ExpandableController controller=ExpandableController();
  @override
  void initState() {
    final loginProvider = Provider.of<LogInProvider>(context, listen: false);
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    homeProvider.fetchAmountFunction(loginProvider.token);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cardLightBackground,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: CustomText(
          text: "مدفوعات هلا",
          color: darkGray,
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.arrow_forward,
                color: darkGray,
              ),
              onPressed: () {
                print("back");
              })
        ],
      ),
      body: Consumer<HomeProvider>(
        builder: (context,state,_){
          return state.getAmount? LoadingWidget():ListView(
            children: [
              totalCount(context,state.userInfo.totalAmount),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ListView.builder(
                    itemCount: state.userInfo.result.dateSet.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var data=state.userInfo.result.dateSet[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Card(
                          child: ExpandablePanel(

                            //header
                            header: Padding(
                              padding: const EdgeInsets.only(
                                  top: 12,
                                  right: 12,
                                  left: 12
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: data.amount.toString(),
                                        color: orange,
                                        align: TextAlign.right,
                                        size: 20,
                                      ),
                                      CustomText(
                                        text: "ريال سعودي",
                                        color: lightGray,
                                        align: TextAlign.center,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CustomText(
                                        text: data.fullNameAr,
                                        color: purple,
                                        align: TextAlign.right,
                                        size: 16,
                                      ),
                                      CustomText(
                                        text: data.mobileNumber,
                                        color: darkGray,
                                        align: TextAlign.right,
                                        size: 12,
                                      ),
                                      SizedBox(height: 20),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            //body
                            collapsed: Container(
                              color: cardLightBackground,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CustomText(
                                          text: "${data.trxRef}  :  ",
                                          color: darkGray,
                                          align: TextAlign.right,
                                          size: 14,
                                        ),
                                        CustomText(
                                          text: "رقم التحويل  ",
                                          color: lightTextGray,
                                          align: TextAlign.right,
                                          size: 12,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 6),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CustomText(
                                          text: "${data.trxDate}  : ",
                                          color: darkGray,
                                          align: TextAlign.right,
                                          size: 14,
                                        ),
                                        CustomText(
                                          text: "تاريخ التحويل  ",
                                          color: lightTextGray,
                                          align: TextAlign.right,
                                          size: 12,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 6),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CustomText(
                                          text: "${data.corporateFullNameAr}  :  ",
                                          color: purple,
                                          align: TextAlign.right,
                                          size: 14,
                                        ),
                                        CustomText(
                                          text: "اسم المنشأة  ",
                                          color: lightTextGray,
                                          align: TextAlign.right,
                                          size: 12,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            hasIcon: false,
                            tapHeaderToExpand: true,
                          ),
                        ),
                      );
                    }),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _dialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(15),
            child: Container(
              padding: EdgeInsets.all(10),
              height: 210,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: CustomText(
                        text: "من تاريخ",
                        color: purple,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DatePickerButton(
                          text: "سنه",
                        ),
                        SizedBox(width: 10),
                        DatePickerButton(
                          text: "شهر",
                        ),
                        SizedBox(width: 10),
                        DatePickerButton(
                          text: "يوم",
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      alignment: Alignment.centerRight,
                      child: CustomText(
                        text: "الى تاريخ",
                        color: purple,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DatePickerButton(
                          text: "سنه",
                        ),
                        SizedBox(width: 10),
                        DatePickerButton(
                          text: "شهر",
                        ),
                        SizedBox(width: 10),
                        DatePickerButton(
                          text: "يوم",
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            'بحث',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Padding totalCount(BuildContext context,totalamount) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                _dialog(context);
              },
              child: Card(
                color: white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.filter_alt,
                    color: purple,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Card(
              color: yellow,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomText(
                          text: "ريال سعودي",
                          color: green,
                          size: 10,
                        ),
                        SizedBox(width: 4),
                        CustomText(
                          text: totalamount.toString(),
                          color: green,
                          size: 16,
                          wight: FontWeight.bold,
                        ),
                      ],
                    ),
                    CustomText(
                      text: "إجمالي المدفوعات",
                      color: green,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DatePickerButton extends StatefulWidget {
  var text;
  DateTime date;
  DatePickerButton({this.text, this.date});

  @override
  _DatePickerButtonState createState() => _DatePickerButtonState();
}

class _DatePickerButtonState extends State<DatePickerButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          child: Row(
            children: [
              Icon(
                Icons.arrow_drop_down,
                color: lightTextGray,
              ),
              CustomText(
                text: widget.text,
                color: lightTextGray,
                size: 18,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                //                    <--- top side
                color: lightTextGray,
                width: 1.0,
              ),
            ),
          ),
          padding: EdgeInsets.only(right: 8),
        ),
        onTap: () {
          showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2001),
                  lastDate: DateTime(2022),
          )
              .then((date) {
                widget.date=date;
            setState(() {});
          });
        },
      ),
    );
  }
}
