//
//  input_dialog.dart
//  xiangyu_flutter
//
//  Created by allison on2020/9/17.
//  Copyright ©2020/9/17 xiangyu_flutter. All rights reserved.
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///输入框框
/// 返回值 输入框内容
typedef SubmitCallback = Function(String submitContent);
typedef ChangedCallback = Function(String changedContent);

class InputDialog extends StatefulWidget {
//  ChangedCallback changedCallBack
  static showInputDialog(BuildContext context,
      {SubmitCallback submitCallback,}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return AnimatedPadding(
            padding: MediaQuery.of(context).viewInsets,
            duration: const Duration(milliseconds: 10),
            child: Container(
              height: 60,
              child: InputDialog(
                // changedCallBack: changedCallBack,
                submitCallBack: submitCallback,
              ),
            ),
          );
        }
    );
  }

  final Widget child;
  ///提交回调
  final SubmitCallback submitCallBack;
  //  ///输入框内容改变回调
  //  final ChangedCallback changedCallBack;
  //  this.changedCallBack
  const InputDialog({Key key, this.child, this.submitCallBack, }) : super(key: key);

  @override
  _InputDialogState createState() => _InputDialogState();

}

class _InputDialogState extends State<InputDialog> {
  FocusNode _focusNode = FocusNode();
  bool isText = true;
  TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide(
        color: Theme.of(context).dividerColor,
      ),
    );

    return Container(
      height: 644,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          InkWell(
            onTap: () {
              print('语音文字切换');
              isText = !isText;
              setState(() {});

              if (!isText) {
                _focusNode.unfocus();
              } else {
                Future.delayed(Duration(milliseconds: 250), () {
                  FocusScope.of(context).requestFocus(_focusNode);
                });
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 5, right: 5),
              child:Icon(isText ? Icons.mic : Icons.keyboard,size: 30,color: Color(0xFF919191),),
            ),
          ),
          Expanded(
            child: isText
                ? TextField(
              minLines: 1,
              maxLines: 7,
              focusNode: _focusNode,
              autofocus: true,
              controller: _editingController,
              decoration: InputDecoration(
                hintText: '快来问我吧',
                contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                border: _outlineInputBorder,
                enabledBorder: _outlineInputBorder,
                focusedBorder: _outlineInputBorder,
              ),
              //  onChanged: (value) {
              //    if (widget.changedCallBack != null) {
              //        widget.changedCallBack(_editingController.text);
              //    }
              //  },
            ): GestureDetector(
              onLongPress: () {
                print('录制语音');
              },
              onLongPressEnd: (LongPressEndDetails details) {
                print('录制语音结束');
              },
              child: Container(
                height: 48,
                alignment: Alignment.center,
                child: Text(
                  '按住说话, 录制语音',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.grey, fontSize: 18),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: Theme.of(context).dividerColor),
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          InkWell(
            onTap: () {
              if (null != widget.submitCallBack){
                widget.submitCallBack(_editingController.text);
              }
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 5, right: 5),
              child:Icon(Icons.check_circle_outline,size: 30,color: Color(0xFFF8592E),),
            ),
          ),
        ],
      ),
    );
  }

}


