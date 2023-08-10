part of 'helpers.dart';

showLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const AlertDialog(
      title: Text('Espera...'),
      content: LinearProgressIndicator(),
    ),
  );
}

showWarning(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(message),
      actions: [
        MaterialButton(
            child: Text('Pagar'), onPressed: () => Navigator.of(context).pop())
      ],
    ),
  );
}
