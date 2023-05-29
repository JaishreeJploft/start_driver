String indexToPosition(int index) {
  switch (index % 100) {
    case 11:
    case 12:
    case 13:
      return '${index}th';
    default:
      switch (index % 10) {
        case 1:
          return '${index}st';
        case 2:
          return '${index}nd';
        case 3:
          return '${index}rd';
        default:
          return '${index}th';
      }
  }
}
