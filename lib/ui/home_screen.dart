import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hala/statics/color.dart';
import 'package:hala/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
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
      body: ListView(
        children: [
          totalCount(context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
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
                                    text: "2500.00",
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
                                    text: "خالد محمد أبو داوود",
                                    color: purple,
                                    align: TextAlign.right,
                                    size: 16,
                                  ),
                                  CustomText(
                                    text: "0566777417",
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
                                      text: "12345678901234  :  ",
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
                                      text: "20-09-2021 11:15:12.047  : ",
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
                                      text: "ركن الأضواء  :  ",
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

  Padding totalCount(BuildContext context) {
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
                          text: "350,000",
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
