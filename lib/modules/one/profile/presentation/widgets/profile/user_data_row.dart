part of 'authorized_profile_tile.dart';

class _UserDataRow extends StatelessWidget {
  const _UserDataRow({
    this.subtitle,
    this.title,
  });

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title ?? '',
          style: context.text.s14w500.copyWith(
            color: context.color.grey900,
          ),
        ),
        Text(
          subtitle ?? '',
          style: context.text.s14w500,
        ),
      ],
    );
  }
}
