import 'package:chat/core/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class ResultadoWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool? venceu;
  final Function()? onReiniciar;

  const ResultadoWidget({
    required this.venceu,
    required this.onReiniciar,
    super.key,
  });

  Color _getCor() {
    if (venceu == null) {
      return Colors.yellow;
    } else if (venceu!) {
      return Colors.green[300]!;
    } else {
      return Colors.red[300]!;
    }
  }

  IconData _getIcon() {
    if (venceu == null) {
      return Icons.sentiment_satisfied;
    } else if (venceu!) {
      return Icons.sentiment_very_satisfied;
    } else {
      return Icons.sentiment_very_dissatisfied;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Row(
            //padding: const EdgeInsets.all(10),
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: _getCor(),
                child: IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: Icon(
                    _getIcon(),
                    color: Colors.black,
                    size: 35,
                  ),
                  onPressed: onReiniciar,
                ),
              ),
              DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryIconTheme.color,
              ),
              items: [
                DropdownMenuItem(
                  value: 'logout',
                  child: Row(
                    children: const [
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.black87,
                      ),
                      SizedBox(width: 10),
                      Text('Sair'),
                    ],
                  ),
                ),
              ],
              onChanged: (value) {
                if (value == 'logout') {
                  AuthService().logout();
                }
              },
            ),
          ),
            ]),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
