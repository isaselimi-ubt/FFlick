String prettify(double d) =>
    d.toStringAsFixed(2).replaceFirst(RegExp(r'\.?0*$'), '');