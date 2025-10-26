class Eventt {
  final String id;
  final String title;
  final String description;
  final String city;
  final String imageUrl;
  final double latitude;
  final double longitude;

  const Eventt({
    required this.id,
    required this.title,
    required this.description,
    required this.city,
    required this.imageUrl,
    required this.latitude,
    required this.longitude,
  });

  // 👇 Make this static so you can access it via Event.egyptEvents
  static final List<Eventt> egyptEvents = [
    Eventt(
      id: '1',
      title: 'Cairo International Film Festival',
      description:
      'One of the oldest film festivals in the Arab world, celebrating international cinema and Egyptian film heritage.',
      city: 'Cairo',
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/8/89/Cairo_Opera_House.jpg',
      latitude: 30.0428,
      longitude: 31.2243,
    ),
    Eventt(
      id: '2',
      title: 'RiseUp Summit',
      description:
      'The largest entrepreneurship and innovation event in the Middle East, bringing together startups, investors, and tech leaders.',
      city: 'Cairo',
      imageUrl:
      'https://riseupsummit.com/assets/images/home/riseup-crowd.jpg',
      latitude: 30.0330,
      longitude: 31.2336,
    ),
    Eventt(
      id: '3',
      title: 'Alexandria Music Festival',
      description:
      'A coastal celebration of local and international music featuring live performances along Alexandria’s Corniche.',
      city: 'Alexandria',
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/a/a8/Alexandria_Corniche.jpg',
      latitude: 31.2001,
      longitude: 29.9187,
    ),
    Eventt(
      id: '4',
      title: 'Luxor African Film Festival',
      description:
      'An annual event that highlights African cinema and supports cultural dialogue between Egypt and the continent.',
      city: 'Luxor',
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/1/1a/Luxor_Temple_at_Night.jpg',
      latitude: 25.6872,
      longitude: 32.6396,
    ),
    Eventt(
      id: '5',
      title: 'Sharm El Sheikh International Youth Forum',
      description:
      'A global platform for youth discussions hosted under the patronage of the Egyptian President, promoting peace and development.',
      city: 'Sharm El Sheikh',
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/b/bb/Sharm_El_Sheikh_coastline.jpg',
      latitude: 27.9158,
      longitude: 34.3299,
    ),
    Eventt(
      id: '6',
      title: 'Cairo ICT Exhibition',
      description:
      'Egypt’s top tech expo showcasing the latest in IT, AI, and digital transformation across Africa and the Middle East.',
      city: 'New Cairo',
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/d/d9/Egypt_International_Exhibition_Center.jpg',
      latitude: 30.0311,
      longitude: 31.4622,
    ),
    Eventt(
      id: '7',
      title: 'El Gouna Film Festival',
      description:
      'A glamorous Red Sea event blending cinema, art, and tourism in the beautiful town of El Gouna.',
      city: 'El Gouna',
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/d/d8/El_Gouna_Marina.jpg',
      latitude: 27.3951,
      longitude: 33.6783,
    ),
    Eventt(
      id: '8',
      title: 'Aswan Music and Culture Festival',
      description:
      'A vibrant cultural celebration highlighting Nubian music, dance, and art on the banks of the Nile.',
      city: 'Aswan',
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/0/0e/Aswan_Nile_View.jpg',
      latitude: 24.0889,
      longitude: 32.8998,
    ),
    Eventt(
      id: '9',
      title: 'Sphinx Marathon',
      description:
      'Run through the historic lands of the Giza Plateau in one of the most scenic marathons in the world.',
      city: 'Giza',
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/e/e3/Great_Sphinx_of_Giza_-_20080716a.jpg',
      latitude: 29.9753,
      longitude: 31.1376,
    ),
    Eventt(
      id: '10',
      title: 'Cairo Jazz Festival',
      description:
      'A dynamic music event uniting Egyptian and international jazz artists in iconic venues across Cairo.',
      city: 'Cairo',
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/0/0f/Cairo_Downtown_Night.jpg',
      latitude: 30.0464,
      longitude: 31.2240,
    ),
  ];
}
