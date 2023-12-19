create table video_online.t_videos
(
    id          serial
        constraint t_videos_pk
            primary key,
    title       text not null,
    likes_count integer default 0
);

alter table video_online.t_videos
    owner to videoman;

create index t_videos_title_index
    on video_online.t_videos (title);

create table video_online.t_videos_tags_assoc
(
    video_id integer not null
        constraint t_videos_tags_assoc_pk
            primary key
        constraint t_videos_tags_assoc_t_videos_id_fk
            references video_online.t_videos
            on delete cascade,
    tags     text
);

alter table video_online.t_videos_tags_assoc
    owner to videoman;

INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110002, 'Амстердам во всей красе', 9349);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110005, 'Дубай - город небоскребов', 6971);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110006, 'Дубай - поездка на метро', 3431);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110007, 'Санторини - солнечный рай', 8770);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110008, 'Путешествие по Гонг-Конгу', 2536);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110009, 'Залитый солнцем Гонолулу', 1040);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110010, 'Лучшие места Японии', 7438);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110011, 'Достопримечательности города Канзас', 1093);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110012, 'Прогулка по Кракову', 3181);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110013, 'Яркие огни Лас-Вегаса', 880);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110014, 'Лучшие достопримечательности Лисбона', 354);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110015, 'Автобусный тур по Майами', 465);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110016, 'Красочные пейзажи Майами', 363);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110017, 'Миконос - красочный город в Греции', 9659);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110018, 'Нью-Йорк - Манхеттен во всей красе', 7150);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110019, 'Яркие улицы Рио-де-Жанейро', 6304);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110020, 'Лучшие виды Санторини', 5291);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110021, 'Великолепные виды Сингапура', 5991);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110022, 'Токио - съемки улиц', 175);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110023, '10 самых мощных космических ракет', 5153);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110024, 'Прыжок с высоты 39 километров', 8708);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110026, 'Путешествие по Солнечной системе', 7031);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110027, 'Путешествие по космосу', 9838);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110028, 'Столкновение галактик', 4451);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110029, 'Гигапиксельный снимок Андромеды', 7631);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110030, 'Хаббл - финальный рубеж', 5827);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110031, 'Хаббл - 22 года в картинках', 1474);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110033, 'Космос - удивительное путешествие', 7962);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110034, 'Запредельная скорость: путешествие по Вселенной', 3593);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110035, 'Космическая медитация: путешествие по космосу', 4109);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110036, 'Запуск космического шаттла', 4150);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110037, 'Путешествие к Урану', 9862);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110038, 'Хаббл: приближение дальних уголков Вселенной', 3709);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110040, 'Подборка 100 забавных детишек', 2469);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110041, 'Самые смешные фэйлы 2018', 5818);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110042, 'Подборка лучших смешных провалов', 4356);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110043, 'Забавные провалы родителей', 482);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110044, 'Самые смешные зимние приколы', 4919);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110046, 'Лошади смешнее, чем котики', 1658);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110047, 'Топ смешных видео 2018 года', 1277);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110048, 'Самые смешные видео ролики 2018', 7076);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110049, 'Смешная подборка развеселит любого', 8189);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110050, 'Самые смешные видео', 6226);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110051, 'Лучшие смешные видео', 6322);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110052, 'Смешные видео из деревни', 1084);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110053, 'Подборка самых смешных фэйлов', 1470);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110054, 'Лучшая подборка приколов', 4988);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110055, 'Смешная подборка провалов 2019', 9179);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110056, 'Компиляция лучших фейлов', 1319);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110057, 'Компиляция самых смешных пранков', 6582);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110058, 'Прикол на свадьбе', 3363);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110059, 'Лучшие провалы 2018 года', 3242);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110060, 'Смешные провалы в воде', 1252);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110061, 'Топ смешных видео', 8450);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110062, 'Зимнее путешествие в Южную Корею', 6502);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110063, 'Природа Коста-Рики', 1955);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110064, 'Красивые пейзажи Доминиканы', 8815);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110065, 'Чарующий и манящий Вьетнам', 1433);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110066, 'Путешествие по Филиппинам', 4611);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110067, 'Филиппины - райские острова', 1760);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110069, 'Ямайка - лучшее место для отдыха', 6045);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110070, 'Контрастная и яркая Мексика', 6192);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110071, 'Жаркий и солнечный Лансароте', 6419);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110072, 'Фиджи - залитые солнцем острова', 6858);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110073, 'Удивительная и контрастная Индия', 8767);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110074, 'Лучшие пляжи Испании', 3963);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110075, 'Красивая аутентичная Мьянма', 4016);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110076, 'ОАЭ - туристическая жемчужина', 7720);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110077, 'Жаркая и солнечная Куба', 8978);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110078, 'Радушная и солнечная Каталония', 9663);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110079, 'Индонезия - рай для путешественника', 6068);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110080, 'Путешествие вокруг света', 8254);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110081, 'Аляска - уникальное место в США', 502);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110082, 'За 200 дней вокруг света', 1409);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110083, 'Впечатляющее путешествие по Китаю', 7651);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110084, 'Прекрасные Лофотенские острова', 5321);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110085, 'Таиланд: съемки с дрона', 5980);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110086, 'Бразилия - лучшие пейзажи', 940);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110087, 'Шотландия - потрясающие кадры', 273);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110088, 'Самые красивые пляжи Мальдив', 211);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110089, 'Бора-Бора - остров Французской Полинезии', 3863);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110090, 'Холидей - лучший остров Мальдив', 4693);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110091, 'Топ-10 экстремальных авто-прыжков', 4296);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110092, 'Тони Бу - 20-кратный чемпион мира', 8511);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110093, 'Свободное падение: экстремальная подборка', 7010);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110094, 'Катание на скейте в горах', 2954);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110095, 'Лучшая подборка экстремальных видео', 5131);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110096, 'Мотоциклетный фристайл', 2883);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110097, 'Безумные трюки на пого стик', 4563);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110098, 'Мотоцикл против авто - дрифт батл', 6051);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110099, 'Экстремальная езда на мотоциклах', 3661);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110100, 'Городской паркур - подборка года', 2666);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110101, 'Мото-фристайл Дилана Лонга', 7102);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110102, 'Ред Булл: экстремальная подборка', 9162);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110103, 'Трюки на сноуборде', 7825);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110104, 'Сноубординг - крутые спуски', 6014);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110105, 'Потрясающие трюки на лыжах', 8855);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110106, 'Фристайл с футбольным мячом', 7656);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110107, 'Компиляция аварий на ралли', 5486);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110108, 'Спринт через лес на мотоцикле', 786);
INSERT INTO video_online.t_videos (id, title, likes_count) VALUES (110109, 'Прыжки с высоты - свободное падение', 2843);

INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110002, 'амстердам, город, городской пейзаж, туризм, архитектура');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110005, 'дубай, архитектура, туризм, город, небоскребы');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110006, 'дубай, город, метро, городской пейзаж, туризм');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110007, 'город, туризм, городской пейзаж, архитектура, путешествия');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110008, 'путешествия, туризм, архитектура, городской пейзаж, город');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110009, 'лучи солнца, туризм, город, путешествия, архитектура');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110010, 'путешествия, туризм, город, городской пейзаж, видео');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110011, 'город, городской пейзаж, туризм, архитектура, море');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110012, 'город, городской пейзаж, краков, путешествия, польша');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110013, 'город, городской пейзаж, путешествия, туризм, архитектура');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110014, 'город, городской пейзаж, архитектура, туризм, путешествия');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110015, 'город, городской пейзаж, архитектура, туризм, путешествия');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110016, 'городской пейзаж, пляж, море, путешествия, город');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110017, 'город, море, пляж, путешествия, туризм');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110018, 'город, городской пейзаж, архитектура, туризм, путешествия');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110019, 'город, городской пейзаж, прогулка, архитектура, путешествия');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110020, 'город, пейзаж, пляж, море, путешествия');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110021, 'город, путешествия, туризм, прогулка, городской пейзаж');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110022, 'город, городской пейзаж, путешествия, туризм, архитектура');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110023, 'ракета, запуск ракеты, космические путешествия, спутник, небо');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110024, 'небо, солнце, космические путешествия, звездное небо, земля');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110026, 'путешествия, космические путешествия, солнце, звезда, небо');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110027, 'космические путешествия, звездное небо, небо, солнце, звезда');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110028, 'космические путешествия, звездное небо, небо, звезда, пространство');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110029, 'звезда, звездное небо, небо, космические путешествия, туман');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110030, 'спутник, небо, звезда, звездное небо, пространство');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110031, 'звездное небо, звезда, космические путешествия, спутник, солнце');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110033, 'космические путешествия, солнце, звездное небо, звезда, пространство');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110034, 'космические путешествия, пространство, звездное небо, звезда, туман');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110035, 'космические путешествия, звезда, звездное небо, музыкальное видео, солнце');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110036, 'запуск, запуск ракеты, космические путешествия, космический корабль, небо');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110037, 'небо, космические путешествия, спутник, пространство, звездное небо');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110038, 'звездное небо, небо, звезда, подборка, пространство');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110040, 'юмор, приколы, дети, видео, подборка');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110041, 'приколы, юмор, видео, подборка, провалы');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110042, 'приколы, видео, юмор, провалы, смешное');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110043, 'провалы, приколы, юмор, дети, видео');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110044, 'приколы, видео, юмор, зима, подборка');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110046, 'забавные животные, животные, приколы, видео, подборка');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110047, 'видео, юмор, приколы, подборка, смешное');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110048, 'видео, юмор, приколы, подборка, смешное');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110049, 'видео, приколы, подборка, юмор, смешное');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110050, 'видео, подборка, приколы, смешное, юмор');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110051, 'видео, приколы, юмор, подборка, смешное');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110052, 'приколы, юмор, видео, подборка, берег');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110053, 'приколы, видео, смешное, подборка, провалы');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110054, 'приколы, видео, подборка, юмор, провалы');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110055, 'провалы, приколы, юмор, видео, подборка');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110056, 'приколы, видео, смешное, подборка, провалы');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110057, 'приколы, видео, смешное, юмор, подборка');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110058, 'приколы, видео, смешное, юмор, девушки');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110059, 'приколы, юмор, видео, смешное, провалы');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110060, 'провалы, приколы, юмор, смешное, видео');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110061, 'приколы, видео, подборка, смешное, юмор');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110062, 'путешествия, туризм, архитектура, город, городской пейзаж');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110063, 'путешествия, живая природа, красивая природа, берег, туризм');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110064, 'путешествия, живая природа, красивая природа, туризм, остров');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110065, 'живая природа, красивая природа, путешествия, туризм, пейзаж');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110066, 'берег, море, живая природа, красивая природа, путешествия');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110067, 'море, берег, путешествия, туризм, пейзаж');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110069, 'море, пейзаж, живая природа, красивая природа, путешествия');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110070, 'путешествия, туризм, живая природа, пейзаж, городской пейзаж');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110071, 'путешествия, туризм, остров, пейзаж, живая природа');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110072, 'остров, путешествия, туризм, живая природа, красивая природа');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110073, 'путешествия, туризм, природа, городской пейзаж, пейзаж');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110074, 'путешествия, туризм, остров, живая природа, берег');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110075, 'путешествия, туризм, пейзаж, городской пейзаж, природа');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110076, 'путешествия, туризм, берег, красивая природа, пейзаж');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110077, 'путешествия, туризм, остров, пейзаж, природа');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110078, 'путешествия, туризм, природа, пейзаж, городской пейзаж');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110079, 'остров, путешествия, пейзаж, живая природа, красивая природа');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110080, 'путешествия, туризм, природа, красивая природа, пейзаж');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110081, 'путешествия, туризм, живая природа, красивая природа, пейзаж');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110082, 'путешествия, туризм, красивая природа, природа, пейзаж');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110083, 'путешествия, туризм, вид с воздуха, архитектура, природа');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110084, 'остров, живая природа, красивая природа, путешествия, туризм');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110085, 'остров, путешествия, вид с воздуха, туризм, природа');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110086, 'путешествия, туризм, вид с воздуха, пейзаж, природа');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110087, 'путешествия, пейзаж, вид с воздуха, туризм, природа');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110088, 'остров, путешествия, туризм, природа, берег');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110089, 'остров, путешествия, туризм, природа, берег');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110090, 'остров, берег, туризм, путешествия, природа');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110091, 'экстремальный спорт, подборка, спорт, автомобиль, мотоцикл, экстрим');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110092, 'спорт, экстремальный спорт, мотоцикл, подборка, гонки');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110093, 'спорт, экстремальный спорт, подборка, вингсьют, прыжок, полет');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110094, 'экстремальный спорт, спорт, скейт, скорость, катание, экстрим');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110095, 'экстремальный спорт, подборка, парашют, вингсьют, bmx, самокат, соревнование');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110096, 'мотоцикл, экстремальный спорт, транспорт, спорт, фристайл, трюки');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110097, 'спорт, экстремальный спорт, подборка, пого стик, прыжки, трюки');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110098, 'мотоцикл, автомобиль, спорт, транспорт, экстремальный спорт, гонки, дрифт');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110099, 'экстремальный спорт, спорт, мотоцикл, транспорт, гонки, трюки');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110100, 'экстремальный спорт, спорт, паркур, трюки, прыжки');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110101, 'экстремальный спорт, спорт, транспорт, мотоцикл, фристайл, трюки');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110102, 'экстремальный спорт, спорт, подборка, трюки, соревнования, транспорт');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110103, 'экстремальный спорт, спорт, сноуборд, трюки, скорость');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110104, 'спорт, экстремальный спорт, сноуборд, трюки, скорость');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110105, 'спорт, экстремальный спорт, лыжи, трюки, скорость');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110106, 'спорт, подборка, футбол, мяч, фристайл');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110107, 'экстремальный спорт, подборка, транспорт, автомобиль, авария, ралли');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110108, 'спорт, транспорт, экстремальный спорт, мотоцикл, спринт');
INSERT INTO video_online.t_videos_tags_assoc (video_id, tags) VALUES (110109, 'спорт, экстремальный спорт, подборка, вингсьют, свободное падение, трюки');