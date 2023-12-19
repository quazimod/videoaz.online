create table video_online.t_domains
(
    id   serial
        constraint t_domains_pk
            primary key,
    name text not null
);

create unique index t_domains_name_uindex
    on video_online.t_domains (name);

alter table video_online.t_domains
    owner to videoman;

create table video_online.t_domains_videos_assoc_settings
(
    id        serial
        constraint t_domains_videos_assoc_settings_pk
            primary key,
    domain_id int                   not null
        constraint t_domains_videos_assoc_settings_t_domains_id_fk
            references video_online.t_domains (id)
            on delete cascade,
    video_id  int                   not null
        constraint t_domains_videos_assoc_settings_t_videos_id_fk
            references video_online.t_videos
            on delete cascade,
    show      boolean default false not null
);

alter table video_online.t_domains
    owner to videoman;

comment on table video_online.t_domains_videos_assoc_settings is 'individual video settings for domains';

create index t_domains_videos_assoc_settings__index
    on video_online.t_domains_videos_assoc_settings (domain_id, video_id);

create unique index t_domains_videos_assoc_settings_domain_id_video_id_uindex
    on video_online.t_domains_videos_assoc_settings (domain_id, video_id);

INSERT INTO video_online.t_domains (name) VALUES ('new24video.com');
INSERT INTO video_online.t_domains (name) VALUES ('videoaz.online');
INSERT INTO video_online.t_domains (name) VALUES ('videouz.online');

INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110002, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110005, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110006, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110007, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110008, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110009, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110010, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110011, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110012, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110013, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110014, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110015, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110016, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110017, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110018, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110019, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110020, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110021, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110022, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110023, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110024, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110026, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110027, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110028, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110029, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110030, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110031, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110033, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110034, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110035, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110036, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110037, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110038, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110040, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110041, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110042, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110043, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110044, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110046, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110047, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110048, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110049, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110050, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110051, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110052, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110053, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110054, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110055, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110056, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110057, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110058, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110059, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110060, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110061, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110062, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110063, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110064, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110065, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110066, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110067, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110069, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110070, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110071, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110072, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110073, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110074, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110075, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110076, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110077, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110078, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110079, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110080, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110081, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110082, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110083, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110084, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110085, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110086, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110087, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110088, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110089, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110090, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110091, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110092, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110093, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110094, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110095, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110096, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110097, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110098, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110099, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110100, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110101, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110102, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110103, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110104, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110105, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110106, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110107, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110108, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 1, 110109, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110002, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110005, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110006, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110007, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110008, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110009, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110010, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110011, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110012, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110013, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110014, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110015, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110016, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110017, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110018, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110019, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110020, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110021, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110022, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110023, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110024, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110026, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110027, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110028, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110029, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110030, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110031, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110033, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110034, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110035, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110036, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110037, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110038, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110040, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110041, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110042, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110043, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110044, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110046, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110047, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110048, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110049, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110050, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110051, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110052, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110053, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110054, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110055, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110056, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110057, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110058, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110059, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110060, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110061, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110062, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110063, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110064, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110065, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110066, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110067, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110069, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110070, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110071, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110072, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110073, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110074, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110075, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110076, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110077, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110078, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110079, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110080, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110081, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110082, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110083, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110084, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110085, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110086, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110087, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110088, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110089, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110090, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110091, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110092, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110093, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110094, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110095, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110096, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110097, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110098, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110099, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110100, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110101, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110102, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110103, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110104, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110105, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110106, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110107, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110108, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 2, 110109, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110002, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110005, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110006, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110007, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110008, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110009, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110010, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110011, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110012, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110013, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110014, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110015, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110016, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110017, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110018, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110019, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110020, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110021, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110022, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110023, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110024, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110026, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110027, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110028, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110029, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110030, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110031, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110033, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110034, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110035, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110036, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110037, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110038, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110040, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110041, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110042, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110043, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110044, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110046, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110047, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110048, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110049, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110050, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110051, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110052, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110053, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110054, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110055, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110056, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110057, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110058, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110059, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110060, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110061, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110062, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110063, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110064, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110065, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110066, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110067, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110069, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110070, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110071, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110072, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110073, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110074, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110075, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110076, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110077, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110078, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110079, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110080, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110081, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110082, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110083, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110084, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110085, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110086, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110087, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110088, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110089, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110090, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110091, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110092, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110093, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110094, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110095, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110096, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110097, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110098, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110099, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110100, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110101, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110102, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110103, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110104, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110105, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110106, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110107, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110108, true);
INSERT INTO video_online.t_domains_videos_assoc_settings (id, domain_id, video_id, show)
VALUES (DEFAULT, 3, 110109, true);