import 'package:cached_network_image/cached_network_image.dart';
import 'package:deliveryapp/src/data/models/user.dart';
import 'package:deliveryapp/src/helpers/get.dart';
import 'package:deliveryapp/src/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Get.instance.find<User>();
    final size = MediaQuery.of(context).size;
    final width = size.width * 0.5;
    return Container(
      color: bgColor,
      child: ListView(
        children: [
          Align(
            child: ClipOval(
              child: CachedNetworkImage(
                  width: width,
                  height: width,
                  fit: BoxFit.cover,
                  imageUrl:
                      'https://www.nj.com/resizer/h8MrN0-Nw5dB5FOmMVGMmfVKFJo=/450x0/smart/cloudfront-us-east-1.images.arcpublishing.com/advancelocal/SJGKVE5UNVESVCW7BBOHKQCZVE.jpg'),
            ),
          ),
          CupertinoFormSection.insetGrouped(
            backgroundColor: bgColor,
            margin: EdgeInsets.all(15).copyWith(top: 0),
            header: Text('Tu información'),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            children: [
              CupertinoFormRow(
                prefix: Text(
                  'ID:  ',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                child: Text(user.id),
              ),
              CupertinoFormRow(
                prefix: Text(
                  'Nombre: ',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                child: Text('${user.name} ${user.lastName}'),
              ),
              CupertinoFormRow(
                prefix: Text(
                  'Email: ',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                child: Text('${user.email}'),
              ),
              CupertinoFormRow(
                prefix: Text(
                  'Fecha de Nacimiento: ',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                child: Text(user.birthday.toString()),
              ),
            ],
          ),
          CupertinoFormSection.insetGrouped(
            backgroundColor: bgColor,
            header: Text('Formas de pago'),
            children: [
              CupertinoFormRow(
                prefix: Text(
                  'Tarjetas de crédito',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: CupertinoButton(
                  onPressed: () {},
                  minSize: 20,
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: Text(
                    'Mostrar',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              CupertinoFormRow(
                prefix: Text(
                  'PayPal',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: CupertinoButton(
                  onPressed: () {},
                  minSize: 20,
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: Text(
                    'test@test.com',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          CupertinoFormSection.insetGrouped(
            backgroundColor: bgColor,
            header: Text('Cuenta'),
            children: [
              CupertinoFormRow(
                prefix: Text(
                  'Borrar cuenta',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: CupertinoButton(
                  onPressed: () {},
                  minSize: 20,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Borrar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              CupertinoFormRow(
                prefix: Text(
                  'Sesión Activa',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: CupertinoButton(
                  onPressed: () {},
                  minSize: 20,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Cerrar sesión',
                    style: TextStyle(
                        color: Colors.redAccent, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
