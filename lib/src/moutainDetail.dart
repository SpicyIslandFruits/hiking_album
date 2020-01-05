var Region = {
  1 : '北海道',
  2 : '東北',
  3 : '北関東・尾瀬・日光',
  4 : '上信越',
  5 : '秩父・多摩・南関東',
  6 : '北アルプス',
  7 : '美ヶ原・八ヶ岳・中央アルプス',
  8 : '南アルプス',
  9 : '北陸・近畿中国・四国',
  10 : '九州',
};

class MountainDetail {
  final String name;
  final String elevation;
  final String region;

  const MountainDetail({this.name, this.elevation, this.region});
}

final firstMountainDetail = [
  MountainDetail(
    name : '利尻岳',
    elevation : '1719',
    region : Region[1],
  )
];