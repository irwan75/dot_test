extension ExtensionFormatter on int {
  String toMoneyIdrFormat() {
    switch (this.toString().length) {
      case 4:
        return this.toString().substring(0, 1) +
            "." +
            this.toString().substring(1, 4);
      case 5:
        return this.toString().substring(0, 2) +
            "." +
            this.toString().substring(2, 5);
      case 6:
        return this.toString().substring(0, 3) +
            "." +
            this.toString().substring(3, 6);
      case 7:
        return this.toString().substring(0, 1) +
            "." +
            this.toString().substring(1, 4) +
            "." +
            this.toString().substring(4, 7);
      case 8:
        return this.toString().substring(0, 2) +
            "." +
            this.toString().substring(2, 5) +
            "." +
            this.toString().substring(5, 8);
      case 9:
        return this.toString().substring(0, 3) +
            "." +
            this.toString().substring(4, 6) +
            "." +
            this.toString().substring(6, 9);
      default:
        this.toString();
    }
    return this.toString();
  }
}
