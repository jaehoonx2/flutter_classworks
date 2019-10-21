import 'hotel.dart';

class HotelsRepository {
    static final List<Hotel> allHotelsList = [
      Hotel(
        false,
        '정재훈',
        '한동대학교 비전관 (Torrey College)'
      ),
      Hotel(
          false,
          '창조관',
          '한동대학교 창조관 (Silver Town)'
      ),
      Hotel(
          false,
          '벧엘관',
          '한동대학교 벧엘관 (손양원 College)'
      ),
      Hotel(
          false,
          '로뎀관',
          '한동대학교 로뎀관 (열송학사)'
      ),
      Hotel(
          false,
          '국제관',
          '한동대학교 국제관 (Camahicle College)'
      ),
      Hotel(
          false,
          '은혜관',
          '한동대학교 은혜관 (장기려 College)'
      ),
    ];

    List<Hotel> getAllHotelInfo(){
      return allHotelsList;
    }
}