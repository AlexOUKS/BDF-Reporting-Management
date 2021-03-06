PGDMP     *    *                 w            bdf    10.5    10.5 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    24585    bdf    DATABASE     �   CREATE DATABASE bdf WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';
    DROP DATABASE bdf;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    24743    authBDF_user    TABLE     �  CREATE TABLE public."authBDF_user" (
    id integer NOT NULL,
    login character varying(30) NOT NULL,
    mdp character varying(100) NOT NULL,
    "dateCreation" timestamp with time zone NOT NULL,
    "dateDerniereConnexion" timestamp with time zone NOT NULL,
    "niveauAuth" character varying(30) NOT NULL,
    grainsel character varying(100) NOT NULL,
    token character varying(30) NOT NULL
);
 "   DROP TABLE public."authBDF_user";
       public         postgres    false    3            �            1259    24741    authBDF_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public."authBDF_user_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."authBDF_user_id_seq";
       public       postgres    false    3    215            �           0    0    authBDF_user_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."authBDF_user_id_seq" OWNED BY public."authBDF_user".id;
            public       postgres    false    214            �            1259    24617 
   auth_group    TABLE     e   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);
    DROP TABLE public.auth_group;
       public         postgres    false    3            �            1259    24615    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public       postgres    false    203    3            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
            public       postgres    false    202            �            1259    24627    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         postgres    false    3            �            1259    24625    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public       postgres    false    3    205            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
            public       postgres    false    204            �            1259    24609    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         postgres    false    3            �            1259    24607    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public       postgres    false    201    3            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
            public       postgres    false    200            �            1259    24635 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         postgres    false    3            �            1259    24645    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         postgres    false    3            �            1259    24643    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public       postgres    false    209    3            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
            public       postgres    false    208            �            1259    24633    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public       postgres    false    207    3            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
            public       postgres    false    206            �            1259    24653    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         postgres    false    3            �            1259    24651 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public       postgres    false    3    211            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
            public       postgres    false    210            �            1259    24713    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         postgres    false    3            �            1259    24711    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public       postgres    false    3    213            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
            public       postgres    false    212            �            1259    24599    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         postgres    false    3            �            1259    24597    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public       postgres    false    3    199            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
            public       postgres    false    198            �            1259    24588    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         postgres    false    3            �            1259    24586    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public       postgres    false    197    3            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
            public       postgres    false    196            �            1259    24749    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         postgres    false    3            �            1259    37696    stock_categorieproduit    TABLE     �   CREATE TABLE public.stock_categorieproduit (
    id integer NOT NULL,
    nom character varying(30) NOT NULL,
    alt character varying(30) NOT NULL,
    "colorGraph" character varying(30) NOT NULL
);
 *   DROP TABLE public.stock_categorieproduit;
       public         postgres    false    3            �            1259    37694    stock_categorieproduit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.stock_categorieproduit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.stock_categorieproduit_id_seq;
       public       postgres    false    3    226            �           0    0    stock_categorieproduit_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.stock_categorieproduit_id_seq OWNED BY public.stock_categorieproduit.id;
            public       postgres    false    225            �            1259    37704    stock_produit    TABLE     A  CREATE TABLE public.stock_produit (
    id integer NOT NULL,
    nom character varying(30) NOT NULL,
    alt character varying(30) NOT NULL,
    "prixAchat" integer NOT NULL,
    "prixVente" integer NOT NULL,
    disponible boolean NOT NULL,
    "idCategorieProduit_id" integer NOT NULL,
    quantite integer NOT NULL
);
 !   DROP TABLE public.stock_produit;
       public         postgres    false    3            �            1259    37702    stock_produit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.stock_produit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.stock_produit_id_seq;
       public       postgres    false    228    3            �           0    0    stock_produit_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.stock_produit_id_seq OWNED BY public.stock_produit.id;
            public       postgres    false    227            �            1259    37629    ventes_categorieproduit    TABLE     �   CREATE TABLE public.ventes_categorieproduit (
    id integer NOT NULL,
    nom character varying(30) NOT NULL,
    alt character varying(30) NOT NULL
);
 +   DROP TABLE public.ventes_categorieproduit;
       public         postgres    false    3            �            1259    37627    ventes_categorieproduit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ventes_categorieproduit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.ventes_categorieproduit_id_seq;
       public       postgres    false    3    218            �           0    0    ventes_categorieproduit_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.ventes_categorieproduit_id_seq OWNED BY public.ventes_categorieproduit.id;
            public       postgres    false    217            �            1259    37637    ventes_lieudevie    TABLE     �   CREATE TABLE public.ventes_lieudevie (
    id integer NOT NULL,
    alt character varying(30) NOT NULL,
    nom character varying(30) NOT NULL
);
 $   DROP TABLE public.ventes_lieudevie;
       public         postgres    false    3            �            1259    37635    ventes_lieudevie_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ventes_lieudevie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.ventes_lieudevie_id_seq;
       public       postgres    false    220    3            �           0    0    ventes_lieudevie_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.ventes_lieudevie_id_seq OWNED BY public.ventes_lieudevie.id;
            public       postgres    false    219            �            1259    37653    ventes_produit    TABLE     �   CREATE TABLE public.ventes_produit (
    id integer NOT NULL,
    nom character varying(300) NOT NULL,
    alt character varying(300) NOT NULL,
    "prixAchat" double precision NOT NULL,
    "prixVente" double precision NOT NULL
);
 "   DROP TABLE public.ventes_produit;
       public         postgres    false    3            �            1259    37651    ventes_produit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ventes_produit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.ventes_produit_id_seq;
       public       postgres    false    3    222            �           0    0    ventes_produit_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.ventes_produit_id_seq OWNED BY public.ventes_produit.id;
            public       postgres    false    221            �            1259    37661    ventes_vente    TABLE     �  CREATE TABLE public.ventes_vente (
    id integer NOT NULL,
    "dateVente" character varying(300) NOT NULL,
    alt character varying(30) NOT NULL,
    "selledBy" character varying(300) NOT NULL,
    "idLieuDeVie_id" integer NOT NULL,
    "idProduit_id" integer NOT NULL,
    amount double precision NOT NULL,
    "purchaseBy" character varying(300) NOT NULL,
    quantite integer NOT NULL
);
     DROP TABLE public.ventes_vente;
       public         postgres    false    3            �            1259    37659    ventes_vente_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ventes_vente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.ventes_vente_id_seq;
       public       postgres    false    3    224            �           0    0    ventes_vente_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.ventes_vente_id_seq OWNED BY public.ventes_vente.id;
            public       postgres    false    223            �
           2604    24746    authBDF_user id    DEFAULT     v   ALTER TABLE ONLY public."authBDF_user" ALTER COLUMN id SET DEFAULT nextval('public."authBDF_user_id_seq"'::regclass);
 @   ALTER TABLE public."authBDF_user" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    214    215    215            �
           2604    24620    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    203    203            �
           2604    24630    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    204    205    205            �
           2604    24612    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    200    201    201            �
           2604    24638    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    206    207    207            �
           2604    24648    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208    209            �
           2604    24656    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    211    210    211            �
           2604    24716    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    213    212    213            �
           2604    24602    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198    199            �
           2604    24591    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    196    197    197            �
           2604    37699    stock_categorieproduit id    DEFAULT     �   ALTER TABLE ONLY public.stock_categorieproduit ALTER COLUMN id SET DEFAULT nextval('public.stock_categorieproduit_id_seq'::regclass);
 H   ALTER TABLE public.stock_categorieproduit ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    226    225    226            �
           2604    37707    stock_produit id    DEFAULT     t   ALTER TABLE ONLY public.stock_produit ALTER COLUMN id SET DEFAULT nextval('public.stock_produit_id_seq'::regclass);
 ?   ALTER TABLE public.stock_produit ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    228    227    228            �
           2604    37632    ventes_categorieproduit id    DEFAULT     �   ALTER TABLE ONLY public.ventes_categorieproduit ALTER COLUMN id SET DEFAULT nextval('public.ventes_categorieproduit_id_seq'::regclass);
 I   ALTER TABLE public.ventes_categorieproduit ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    217    218    218            �
           2604    37640    ventes_lieudevie id    DEFAULT     z   ALTER TABLE ONLY public.ventes_lieudevie ALTER COLUMN id SET DEFAULT nextval('public.ventes_lieudevie_id_seq'::regclass);
 B   ALTER TABLE public.ventes_lieudevie ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    220    219    220            �
           2604    37656    ventes_produit id    DEFAULT     v   ALTER TABLE ONLY public.ventes_produit ALTER COLUMN id SET DEFAULT nextval('public.ventes_produit_id_seq'::regclass);
 @   ALTER TABLE public.ventes_produit ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    222    221    222            �
           2604    37664    ventes_vente id    DEFAULT     r   ALTER TABLE ONLY public.ventes_vente ALTER COLUMN id SET DEFAULT nextval('public.ventes_vente_id_seq'::regclass);
 >   ALTER TABLE public.ventes_vente ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    223    224    224            �          0    24743    authBDF_user 
   TABLE DATA               �   COPY public."authBDF_user" (id, login, mdp, "dateCreation", "dateDerniereConnexion", "niveauAuth", grainsel, token) FROM stdin;
    public       postgres    false    215   u�       �          0    24617 
   auth_group 
   TABLE DATA               .   COPY public.auth_group (id, name) FROM stdin;
    public       postgres    false    203   #�       �          0    24627    auth_group_permissions 
   TABLE DATA               M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public       postgres    false    205   @�       �          0    24609    auth_permission 
   TABLE DATA               N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public       postgres    false    201   ]�       �          0    24635 	   auth_user 
   TABLE DATA               �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public       postgres    false    207   ��       �          0    24645    auth_user_groups 
   TABLE DATA               A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public       postgres    false    209   N�       �          0    24653    auth_user_user_permissions 
   TABLE DATA               P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public       postgres    false    211   k�       �          0    24713    django_admin_log 
   TABLE DATA               �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public       postgres    false    213   ��       �          0    24599    django_content_type 
   TABLE DATA               C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public       postgres    false    199   ��       �          0    24588    django_migrations 
   TABLE DATA               C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public       postgres    false    197   R�       �          0    24749    django_session 
   TABLE DATA               P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public       postgres    false    216   ��       �          0    37696    stock_categorieproduit 
   TABLE DATA               L   COPY public.stock_categorieproduit (id, nom, alt, "colorGraph") FROM stdin;
    public       postgres    false    226   t�       �          0    37704    stock_produit 
   TABLE DATA               ~   COPY public.stock_produit (id, nom, alt, "prixAchat", "prixVente", disponible, "idCategorieProduit_id", quantite) FROM stdin;
    public       postgres    false    228   ��       �          0    37629    ventes_categorieproduit 
   TABLE DATA               ?   COPY public.ventes_categorieproduit (id, nom, alt) FROM stdin;
    public       postgres    false    218   �       �          0    37637    ventes_lieudevie 
   TABLE DATA               8   COPY public.ventes_lieudevie (id, alt, nom) FROM stdin;
    public       postgres    false    220   E�       �          0    37653    ventes_produit 
   TABLE DATA               P   COPY public.ventes_produit (id, nom, alt, "prixAchat", "prixVente") FROM stdin;
    public       postgres    false    222   k�       �          0    37661    ventes_vente 
   TABLE DATA               �   COPY public.ventes_vente (id, "dateVente", alt, "selledBy", "idLieuDeVie_id", "idProduit_id", amount, "purchaseBy", quantite) FROM stdin;
    public       postgres    false    224   ��       �           0    0    authBDF_user_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."authBDF_user_id_seq"', 9, true);
            public       postgres    false    214            �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
            public       postgres    false    202            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
            public       postgres    false    204            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 56, true);
            public       postgres    false    200            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
            public       postgres    false    208            �           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);
            public       postgres    false    206            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
            public       postgres    false    210            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 41, true);
            public       postgres    false    212            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 14, true);
            public       postgres    false    198            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 80, true);
            public       postgres    false    196            �           0    0    stock_categorieproduit_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.stock_categorieproduit_id_seq', 7, true);
            public       postgres    false    225            �           0    0    stock_produit_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.stock_produit_id_seq', 20, true);
            public       postgres    false    227            �           0    0    ventes_categorieproduit_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.ventes_categorieproduit_id_seq', 1, true);
            public       postgres    false    217            �           0    0    ventes_lieudevie_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.ventes_lieudevie_id_seq', 1, true);
            public       postgres    false    219            �           0    0    ventes_produit_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.ventes_produit_id_seq', 74, true);
            public       postgres    false    221            �           0    0    ventes_vente_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.ventes_vente_id_seq', 598, true);
            public       postgres    false    223                       2606    24748    authBDF_user authBDF_user_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."authBDF_user"
    ADD CONSTRAINT "authBDF_user_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."authBDF_user" DROP CONSTRAINT "authBDF_user_pkey";
       public         postgres    false    215            �
           2606    24624    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public         postgres    false    203            �
           2606    24679 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public         postgres    false    205    205            �
           2606    24632 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public         postgres    false    205            �
           2606    24622    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public         postgres    false    203            �
           2606    24665 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public         postgres    false    201    201            �
           2606    24614 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public         postgres    false    201                        2606    24650 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public         postgres    false    209                       2606    24694 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public         postgres    false    209    209            �
           2606    24640    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public         postgres    false    207                       2606    24658 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public         postgres    false    211            	           2606    24708 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public         postgres    false    211    211            �
           2606    24736     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public         postgres    false    207                       2606    24722 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public         postgres    false    213            �
           2606    24606 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public         postgres    false    199    199            �
           2606    24604 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public         postgres    false    199            �
           2606    24596 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public         postgres    false    197                       2606    24756 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public         postgres    false    216                       2606    37701 2   stock_categorieproduit stock_categorieproduit_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.stock_categorieproduit
    ADD CONSTRAINT stock_categorieproduit_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.stock_categorieproduit DROP CONSTRAINT stock_categorieproduit_pkey;
       public         postgres    false    226            "           2606    37709     stock_produit stock_produit_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.stock_produit
    ADD CONSTRAINT stock_produit_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.stock_produit DROP CONSTRAINT stock_produit_pkey;
       public         postgres    false    228                       2606    37634 4   ventes_categorieproduit ventes_categorieproduit_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.ventes_categorieproduit
    ADD CONSTRAINT ventes_categorieproduit_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.ventes_categorieproduit DROP CONSTRAINT ventes_categorieproduit_pkey;
       public         postgres    false    218                       2606    37642 &   ventes_lieudevie ventes_lieudevie_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.ventes_lieudevie
    ADD CONSTRAINT ventes_lieudevie_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.ventes_lieudevie DROP CONSTRAINT ventes_lieudevie_pkey;
       public         postgres    false    220                       2606    37658 "   ventes_produit ventes_produit_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.ventes_produit
    ADD CONSTRAINT ventes_produit_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.ventes_produit DROP CONSTRAINT ventes_produit_pkey;
       public         postgres    false    222                       2606    37666    ventes_vente ventes_vente_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.ventes_vente
    ADD CONSTRAINT ventes_vente_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.ventes_vente DROP CONSTRAINT ventes_vente_pkey;
       public         postgres    false    224            �
           1259    24667    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public         postgres    false    203            �
           1259    24680 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public         postgres    false    205            �
           1259    24681 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public         postgres    false    205            �
           1259    24666 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public         postgres    false    201            �
           1259    24696 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public         postgres    false    209                       1259    24695 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public         postgres    false    209                       1259    24710 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public         postgres    false    211                       1259    24709 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public         postgres    false    211            �
           1259    24737     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public         postgres    false    207            
           1259    24733 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public         postgres    false    213                       1259    24734 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public         postgres    false    213                       1259    24758 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public         postgres    false    216                       1259    24757 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public         postgres    false    216                        1259    37715 ,   stock_produit_idCategorieProduit_id_77f287fd    INDEX     {   CREATE INDEX "stock_produit_idCategorieProduit_id_77f287fd" ON public.stock_produit USING btree ("idCategorieProduit_id");
 B   DROP INDEX public."stock_produit_idCategorieProduit_id_77f287fd";
       public         postgres    false    228                       1259    37761 $   ventes_vente_idLieuDeVie_id_a0a4b194    INDEX     k   CREATE INDEX "ventes_vente_idLieuDeVie_id_a0a4b194" ON public.ventes_vente USING btree ("idLieuDeVie_id");
 :   DROP INDEX public."ventes_vente_idLieuDeVie_id_a0a4b194";
       public         postgres    false    224                       1259    37755 "   ventes_vente_idProduit_id_fd43f30f    INDEX     g   CREATE INDEX "ventes_vente_idProduit_id_fd43f30f" ON public.ventes_vente USING btree ("idProduit_id");
 8   DROP INDEX public."ventes_vente_idProduit_id_fd43f30f";
       public         postgres    false    224            %           2606    24673 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public       postgres    false    201    205    2797            $           2606    24668 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public       postgres    false    203    205    2802            #           2606    24659 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public       postgres    false    201    2792    199            '           2606    24688 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public       postgres    false    2802    209    203            &           2606    24683 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public       postgres    false    2810    207    209            )           2606    24702 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public       postgres    false    2797    211    201            (           2606    24697 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public       postgres    false    2810    211    207            *           2606    24723 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public       postgres    false    213    2792    199            +           2606    24728 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public       postgres    false    207    213    2810            .           2606    37710 F   stock_produit stock_produit_idCategorieProduit_i_77f287fd_fk_stock_cat    FK CONSTRAINT     �   ALTER TABLE ONLY public.stock_produit
    ADD CONSTRAINT "stock_produit_idCategorieProduit_i_77f287fd_fk_stock_cat" FOREIGN KEY ("idCategorieProduit_id") REFERENCES public.stock_categorieproduit(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.stock_produit DROP CONSTRAINT "stock_produit_idCategorieProduit_i_77f287fd_fk_stock_cat";
       public       postgres    false    2847    228    226            -           2606    37762 H   ventes_vente ventes_vente_idLieuDeVie_id_a0a4b194_fk_ventes_lieudevie_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventes_vente
    ADD CONSTRAINT "ventes_vente_idLieuDeVie_id_a0a4b194_fk_ventes_lieudevie_id" FOREIGN KEY ("idLieuDeVie_id") REFERENCES public.ventes_lieudevie(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.ventes_vente DROP CONSTRAINT "ventes_vente_idLieuDeVie_id_a0a4b194_fk_ventes_lieudevie_id";
       public       postgres    false    220    2839    224            ,           2606    37756 D   ventes_vente ventes_vente_idProduit_id_fd43f30f_fk_ventes_produit_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventes_vente
    ADD CONSTRAINT "ventes_vente_idProduit_id_fd43f30f_fk_ventes_produit_id" FOREIGN KEY ("idProduit_id") REFERENCES public.ventes_produit(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.ventes_vente DROP CONSTRAINT "ventes_vente_idProduit_id_fd43f30f_fk_ventes_produit_id";
       public       postgres    false    224    2841    222            �   �  x�}��jAE�=_����WwU�Ύ��G$ǲe�����I��τ^jU���b��חo�*WrnZ��L�$rV�M*�%t�2��$'@�5.�����+��<� ^����F��
'k}jM�������<�*�_����zͻ��v����^/_~��C{��&���s���j��Y�M�Ux�cc��������h���`�&�l%�(FN聶��������!$�1+B�L�M!��d��x|GK��H<BZ1+�?�9L�#�!��"ģ8���X&1�V��&fj��,������ц><J����^���v�S9{�A���!`�ZMZK�gs]}J�JB)�o�bI�p�\�\6��#Ϣ����p"]&��[b�4r�^�J���d�r]_���|���Ӵ��=\�V�0��(��      �      x������ � �      �      x������ � �      �   ,  x����n� ���)�U1����J++F��Ď�����afl���p�9�����v�G��Q������?����V�n�ޅk�s=�R�A�����<��ϧ^��.���8:�a���xN������ ������{�n��я�� �lh���	�q�p�F�n�J��Lڬ�2�ϻr ��q\�Q"��"!�/Z X>H���sܘ����=^��y_��3�4&�|�9Nn7߃ڃ�Zvt#\��Q����W<�<s����-��4�ƕn���:3&_0��1��������9\Ʃ�������^&�㶶���6z��N��Z'��M'E�/��MWIȵ�x���Ӆ��VdE�t�X�F�t���G���)`I�-̟c��mn�9*^5�^ܧmmE�j]�}�(�Wk���nt,��6�O���T�I���	e]�ĉd2��P�X"��ObJ��ʠL���B;��dD3�Z�a����O�3�?�K��}�?�K��}@�c �}�@o��wb��U������:}����W������i����      �   �   x�-��
�@F��S�p'��;��A� ��� ���a�h����[��8|@��jNx��%��������Q&�jEg^巰�f��f�_:�i��Y+��[��n(6�sN�B��(g�#�"x>)��@)�]�y�Wz*���.�`�DDC�G��޳,���/"      �      x������ � �      �      x������ � �      �     x���MO1���+V9�j�����z��'�!%)�BC8!�{Ǜ��.���E���μ��0� ��6H�5{t!:£�w�U���w~�n>�g���a2���In��<�Nl 2�ɑ���C�s~9��ؐ&�ٝ�{:���N�6���tqs7���=��c��A3�cUH&�{�<���FȞ�g�D�.��!"� z�h�>�Y���S��'�Jˬ��θ���2>�Q;2A�`h����z~�\-�?V���b��â1S���"')��e~��|5��ET�U0�a���Ҟ�+�h&�[���q��!*�Ts�&��O
Lz`�DtT�Z����P;3�
�)^;��E3[�� H�����m�*�3l�;H�?kK�]j�`T�1h�J��2�⩆���hmK|�0�3�Xz�Xh����a��p4�Y�,�1����|y�\}_Mo/��S�Jԣ]��}���g�Z)@��7��IG�f�8\t�[2,���P)/�
����;0�a��"^����>���ެ������"�.��kL��"�pI�sn����Rjз��U��ݝ���[j7��r��^�_���C[V���0���a-��.l�K:l��+!��,g�,AzX�t��+��M�c��c�b��o�2�������$N���U1�j~I(�~p���kM���0�^������9�]��?=_�s��u��t���=�T��"��{�k��4�tT.�y�{����q��GA�0�/w||��Ͱ|      �   �   x�e��
�0F���;�߭�O�MY�\�Ҧ����� x�|��#l��v@N��<O0JO���C��9%�	ۍ�Qr��J��L��t	�~�!Qi�����~�R/�)Dq��ՌL��̄f_�'�Q�L~%hL5�n�J�@s��ҽ���k*x����^4      �   l  x����n�6�����}���?]E����ƪW�meee�}��H�I�&@�I�#yx�p���2��q���^w���K7v�i����g����} G�3����}��yE�1x7UЮ9���J���O%�(���e���zh��������9
��7�&�}0�����y��R�sj��뷾{�,tƦC��\����/��7��9�e{0qB��~X7���v8w�봥��>7�է�r��*�,C>a���z�ʧ��t�O)΂%�)�)ӧ���mܐ�3;!��V3N�u����d�ҥ%DJ�S�������&��I�"&y��O�ʏ��������a���^��q���XtyOtǅ�:���1���J�/��n-6�~����zJ�l�l<p�
sM% P���pAN ���ɧ�FأXR�C���l�0])= �٘�P�v�7 j � � `��bj4���z� x��
�2�	�	A���/ x1��2�b���|���`� �{oM�4 � �Fi�2�1EJ ր� 8x @n�*�+{k��� �s`� _�d!���d�J��Sx� � 1r�FmD� k	ˀ8rh#� r�d\Y�|@f�C¬���"�p5Ѧ�'�>��U�x�����G��˹�c��������)0�\�n�h`�B�P!�Y��V����X�������e�ƶPL� 
�Tl�:�$� TO	�]�	03�����&	BHf!��
��B�}���-� l� 4��+����p��	f^��z(�{v>i�:�Ь\H*��a�;�%@g�� �"��Õ����f�6!��6 R��=\����b�3�۩X�g�'���7 ��!�.;���L �� ڄ�1q~4ӡ������S[�LVL^�0v�������ko?*���^f\T�Usn�"P���X�����~zJR=��Ugm�"�H9�-��Ugm�"����g�t+W0. ,�H�[�%WX��T/՗���ǡy�V�86e���s��t8L��/F��4���bA��65��1�3)1� ߔQ&��o2j-QB0O+�L=ᦥ�I2K�E,d�i�s�`,�5 ���I�%�m� �����$Z|~��h|J�s�x	���k 9�N��`�i �oH�tP���tG`��N$��-HG��pڈ����	��H�rڈ43��rW� VL mD~1�>�2��M�����ll��`�%z�C�5`C��(K��V �8Aʽ�����^���Pn%q9�Q�k�[�6@d M �C�k@��815��F��e�$]�_�k#r\b ��%�>�s�/$�����,�O����U)y��	�z���2��������	t��      �   �  x���Ɏ�0�s�)r�li.�Yjh������	��Y��MZ�y�K�U˧�m�~1K�6���V��i+Q�����_���D��%���v\g��,T��|N�=eў��+Y���D�����I�i�w�L�e��E�Ǿ�ʒ,�oID/N���؊�·����iN#��g����9>S?�'��]�p��:�o�n�;X��y������^����K�^jH�`\��^x����<�1{��r���F`n 6�� 61lli[��@�r�z���K�D�Wt�ER�*}�����^� i:��]�LKv��(��m���!�L;9<�v��ak�)�,����Թ���J����/=�"�����nxdtq��Vө��a�[[�V_�O�%      �   >   x�3�t��+���ML�I-�Lq8��L���-��9s2sS�J3�R�89�� -�+F��� �      �   E   x�34�t�<��(�3	B�a�1����%�BrFfA1��əppdVU%r�ICN#��9P"F��� ��+      �      x�3�t���M�+I�,J�LD��b���� �`	�      �      x�3��t˯L-����� x�      �   V  x��W�r�6<��؇�	�����<6�U�.'�\ �P�H$kQ�;�cP�%��Q٪�34�{�JizF� A8,M[�g��b�����`��A��ڽ��̥1����lkٿ|S �L�h�J0�:1,�BW�}/kZ)��lJE�Fu�n�3OR�%��E��~���1t'Y+�t,�9�U����6�cI�5��������@?b�@<K�g@xf�����h٬ke;����|F��Ϻ���'�\<��(si��ۤ",=�5�O�GoԖ.e��y�7@2�S��@�����Y��tQ���b���pC�p�>���M����U�͹0G�5!�1;�9��gu�,t�8�k��2�H#s�hP"���	,6Juj5��2va�A���>�~��K�H Ţ�[�ڜ���!g����8�����lTZ\��VM�j�V�n�:���ё���=}�����-�{1��`dS���(g���u󝡽�;~��b��	�ڡW��B߶؋��$�"Hx��*ۦ��Fћ�-�����{FV}`�G�x���mV�����S�DoW
�YuⲮ+����|h��,Y>��x�V�i�gv(`q
+�$����B�`U76"ވ�m&̗����,rm���H��vXYVMw�(��Y�ZH��=%	�IdO�SS��X� K�T�:z�׽�Y�����\�1�G>���a���u�!�dp��LGB,4DI��a�үJ?#)d���}�F���IqLzD����Q�]����|2m��ͬ��C���4re"X���(��xܭ���5W8
��Q�y6]nC^k"
�_t��9*�Y�,��O��1$�T��[�s��^�^�"$��<;2�}��a"�۴��� �C��yY����S�ڟ�Z��>���y�9�ba�Sc�+̺6R>�u�q������p��h�_Ѯ�+��ç����}�8��4�漱R��<�jw��{�gف��4�_tٚf|Z)mK�<�?p��U�{ҟ��_�v�c�|�1!#i1�0~��0$��0~pX�*���pb��w���b(RHI��=�	�,ן���.�ۭz�Mf�k��Ԫ��z�1zj/;F�9#����U�      �      x��}�rɱ�o�)��бal�/�^tS�Ԅ=�-�G�� 0��Γ�U�s�a�b�Y�$��U��v8l�G��U�嵲��`����?sSq���g�N�dB����3��n�}]~��͛�u=�_.����:z��t���h������C�Cϸ~&��Z-�y@���6ͼ:�\ϗ�����z��qv�'\�S�PR$�7�p��e��<��_�"��?�v�3��
�����%���r1[T/f�zs��K���3͞)��})|��>8_~�����ٛ�WgW�ѧz�Z��\�qA��p�L鉑B����1���~�r�qY�������D��=Sj"�qJ��hD�mZ����O��|����;������!��1��E!s��SL��Q;�z�#���g��g����+3���gތ�yГ>,zX�S�
�]��u�^�ΚMu2}=�[u��nsEd�P΄e���~���M��y�����Uut���rs}�\P9l¤1ۯ����/�}�P߯g͢z>�x��::��V�P��߾¿��u�'�L�g�N�֏�!�����5(�is��|�����Mq�3-��j��*Z��"��O�����훫v�����r �����Zq��C�Xe�9�+4�ᖒ��1\Gp�~�$�j_����N�i��즩��������f�?g� ���pjAU��p��m->���� ��Pc���Z���^���.g���TG�g�׷M�t�)�^���7 ����G���x��8��xXӲ%��.��S&�-�T
�z*��l
��e�Y̚Uu���2K�<��n��r/HJ2̽�hˍ*��� ��[�;!�g Sh Pg��.=8�7�f��^O/N޾���ǻ:`R�a�}����bF]��n l�����W?WG���2 RzD�L�`���	?���nv��嫳��{�f^/���W=Fa]B�A�����S=o�i[P�}�����>.�����M�������w��3�d�I1a�KiJ�,������ҡ��	��L��d�q����u�����!Z��>�b�#�Dh���hgxs���/�&�I���`�;<�聯W��.�|��؄o��[��T=�	�ʲ"��*��������W`�ְ�U��~���۝�@8�'�yA�`�4�_׫YS�kV��:�K�HC�X�8�8ŕ,�@��q������b�'�_��.�g�P\��x��ϖ\��8�Ƽ� �~�y�񥧈p���±غ[Y���2Q�bR=�p�V��#u�8=��{�.כ��=+���%jS�;6p��T�Flp���2�4����)����/���������/�.IR$�*�XQ�n!�����Q�`*�(�������C�C+�B�,�uF?b��?��������WWoA����<��,��IL��ܰ��:����^�]����ry�̃��@>T���hQ4��%�c��P�]�`�C�cL:��>������T ��z�x��`���������)����=�9'�SX�E�y֊�,.R()YZ$gzbu\�>ԜJŜ�D�X��M3�ܡD<�ϸ�4��Z��z���!�nNn�'��i����{�C��Y��'�K�R�󉲂i�$��%墩Λ���|ڳ�&P�c��{�F?�}�Q:�����%�n4�ZE܋���������ћ٧��}02�R<�*�,��di�=p����n�YTo�_�W�O�t%D��GW�[1�\�~(Xx\2Q�	@ڳ�-`���u]���
�+��� �П��i��ى릚���_f>������K����z�9faW�RnM������ۓ����v7��FMT��Aт�m�0������x(�]��6� |!!�m����M��N��_���e�YR��E��)ƽ�%P\,?`B|z�&����E��#�&��Cf�Z�mX�\q�I/�P :�=�c��b�u��tt����ͯ�)1��7�Ŷ����ζw4|\CH�@XbP�T�L��f��y�,l�7>�#��#���߮K���eQ(�]��=<�	�����Ns/�8q�q�m_�!���M�#���N��8�l���������|����n�XI�p��k�^�>`/�o_�.�����Wg�ы�l]���`a\�&�3cT+U7J��VS($��b�,T"�2�5�`��x㶥�(���*Y�'m�d0ؘ֐~{��eR��Q4 ��㑣hO�YO Y0�RX�G3��I�8���h�K���`�!�p-�ن��-#��s"
�,~�&e��l!B��'Nh�5�q�����r��@ $=�-����sI�|��sG�GC���a�cx�."�D��3K��H�����J|y-v6�ȕ��}����!�d.t�)DQJ�)������eS�Xz�!xF�b��M���Q�G0����,��u�<��3C�I�q����.}D1%�d�0�Z�mbitwFbB��p�8��.졤v~ׇ�v`����mQ�%��p�Y5��
οC��\�M�y�s��g!�H�Co)�²P;�e5�|'�&�+М�lf�M��kp�ZrBb�O[.{���y�n��T��r)�VE�
x~�(hv��1��^���4��y���eu�_�X|���Do�("�h�y$N�2	f�9&��6q�Չ�
/j�M���y���*8T�Q��LV4�߶KdOf��f:�}���_�{;��Z��Ю�	f)��s��ŗߺ��|��׿U��@�Y/���u ��>�]ߢ��~��j}�YU?����ͬ�o���(��PGra���N�HG����3�&BY�
�j�i1�לQ���L��h�Xm���%�9Sa����+��f�j�T�?�{�H��9���9�u��x��JI��;�#����&���|��������	�pX~�ի��5(�.�)�@�A�̮�˟�D䙈 8���!rg|�7��/�A��	l�	$p��6;�G���r�5q��a�����C K��*�PKe�U��"%�9�T���`����AU_U&@��LL^�	W����A�����9�Ea��;ُ,l"�����F���~�1//+�Sg��b�`���[����I/�I�-:I�[���z�8�[���?�`�e����M-;�D��&pң��Sv����ra(���E��^ȧ0x�-���I�+�\���<�`��!lf�_F��諏�J0P��&>�&$#��";�R��F&<DIi��^���^I�[�w����X�Q��/���<�%%��׉�����K�Y_KR��.vPh��޿ �bV~�FR�j��c����'�nש
7���i��M�_>�ڣ�Y/�����e��M�q@�=4�ƀ�)�=�I�3LW_����U�ab�U�~�
��Y�sԍ�������j�Cs��~�� v�֫�?%��e~���,#��c>m)�%�zV�X���������g��U}�	𻭩��TN��t�_�rRy֌��ۗ���6E��OP�P��+�!����G�ۚ��)�n[Tv�{C*
)��Y;�s����UC�ۋ��"5W���8�w�RF��e� l���ww�����;��ü��cK��r�q�\�.?�����x�M��,�/���q��#��c�����6Tģ7߾��&,�z��Caׂ0Vo��(H�]�+O�;��Z�v�F�h��Yͮ�n��$�(&\��Q��+e�N)�ۻ�c��T���!���|�Xn>_��wlaxF�2O?��Ḿ�ê�\&�M27~�<�ćC�2.\H�-+��Þ�a1$����ؼ�*��#���)೛��
~��Ӫ��n9_�\��T�co�N�:z������o^��b��_�-E���6
cƶ+���\}��0�GW��-����������]U�r����D(�De9����Pz  �j��2
�^�g>oVX܀�����B;����'G��?:C��2 7�5ъ��������Kk�"ɫ��u�%���h�a��嬒��  �D���lovw��@��    |�H���iJ1b*Uz�{o'�8͋6$��.=��Sr�zc��N9]
� �,c�C5���8/��8�)5}�Bp$�l�v�<s{��eJ���u�u�p,���z3���'/_�+[���Qhe��ek㶞YJ6|���[3�� &�`�L��D������-
-b�p�J�I!�HC�,v�!G t��q�J�N�Uö���Z��~�	���&��?��B�_���<yy���vݙ-k(BH�+_��[i�N�+qXK��+c�N�;��84� Gų�V��ʢ��#�i��w<�O�[���*/y�����m���]�ΙdG�ӹfb�[�6P��rT�E����.Џ�|G5_�u,�<]Q"��d�}��#%���)@�[�L�� 4��J9��TݼRIuT���0��v�t=���&{��%���d���L���
�C�����:�뀆� ��.���c.��Y����\�o��W�]z��cw��Ό�K�#�o��ӈE�_�$�Or��2w������K��I�����dga'G�`�g�Ou������lǑ���#��&e`�_�y�~��L����^��\ݝ��pp#<Ul.���Kit�b[��B�z��_�k�M�ߚ� {��a�؄Yk�x��OY �uN�����ׅ{�N<O9 ���W��"�c��<&]qt�zQ01�F�Gp�.e1C�X0��,���R܍��*�xu98��mrW#�\���֝`T�;0e�T�`�:.�Q`aؠ�Lm��I8�5ާ||�(�У�1o1~q����a����g�>���d�F�١h� ַ^�Q�qC��z���h���0��~�h��`��1�ފ�;�U���h�e���X�8ŒA���v���ݕ8\�ހ�@��*(9��0�MI�.	�r ���#Aq ]Q�6T�,��j� �%��RJ��Q��) ��z��2C�6�bO�8�!@��!8Uh�BK͌Ѕ�8�Dp��*x�8�X�'ˌ-8�fΧګ�eh�~YՋo���{�� ���c-�6K�iS%�N9&):>��������58]~iK�BP���(v�yV`|�Nb.) Um�m^U��-�A"�N/��u 9SE��� ��l���u+��ĉT˥���,��גֵ�ͪT�; ��7t{�䄠j�Si5�I�b|O:>?�ONȻ����TG��7�|���|��+�Ŝx���������d��:�`���tyt2��cӞ IY@`{8�2���F�ޔT�[a��G9�_�`���.�Ry�XJH���b[	������N77��K�<E�^����Z4��8j�V0���$���rNhSM�OY|����LX�E� )�}>乗� 2�G]����K�
ˢ|�ӿ�,+�J�[�~F&\�j(�������XF�#������{�_@s]%��D�|ā�A*e̬��������{��=����Y�I�*? �o��F=%��<�(J<L�1��V9���j'[YUj�SY.����=��VtA����Mu���6�x�Wb�U�lEA�~}^>Uk.DX�k/8H��SQ=�Dk�ӭ�/
:U�p�h�Ӽ����5�Q�޽<���;�"�帋�m����no�
Mu��ʉ�ڳq��[��ʺ��z�il�~���ͷ��i���e.'؆W`��Ud�%��5��4��]��(#��$4��V4���<c$��BS�f��ppD����<�\6LS�n�Ѧ<:���T#����<U�V��*[��3T��+'*!C.�O B����P��T�F��'��� �QA��H��ĵ�%򳱠B��c$~����k%�0b�C���9��� �9�q���_��� _1�fUA�wL◤�n;���8;�,œ�k����B̀JZPMI��?w�񭕎�'�ǋ�9������ �*;9�TQ�A�Vjg�)2��M���E�X���NJAֽm�J]O ޱT�A<N����5�T�U���c~�Z��H��� '��<9��b�ɗ�.D^G?n�E�L�@o������)!�@_�.q��5OM%�ݯ���YnV�����ͷ����u{T�@���o��+��9�ԑ���Un�3�Jl���arp�fa���� 7���~�@�q���|�^þt>�YX��8��tF>�������L�]����٫�)b9����(.�&p�l��<� ��N��Xf<{�ͤ�U9J���C�/���6�y~��짋���wR��t<T�0��)H��\jm
��a��Q�2�L]pH�P��T�ex�C3г�f�ގy�����YaEg�[)9��2��x;r�Z$ I��ju���ծ�'�[7�e�fJ[��x�*]' W��7OZ2���˗v)�7�X�9�q����������_��-7-��n����E{9U��@8�z��� gv^��E�+l{����fۢ��	T��=�T�EH�j�,/�+�"��T�[�ʪ��X*���?��0�%�Xk7��3E#O��\oKݣ�,rw0���Cu_��y�`���O�?�����4�<@�J�V��A6J �{�)+
��"g20���}'\@�W�%0h~͠�����`�>j�8m�c��(v+­��5�=�ƾ�	����#�8�l��|%ٶz2"��dT��]1��KW� 	v+Y2������U��E��dT�񞠞p��*��=26R2��
�b��1���#yXN��p3p"q����l���� ��c� G��3&9%�&0I.Y���t�0���r���+lN��^�6GrJ-� |[ex�͉����+:8.�+<$���)S0
����;u�,~�1���Y�-W�Ys�)E��UgZ��a?��uv���s|��^w�>$�l�dx����S��%���E=�ƘRl����(g�5Y$$v^�A�鲐�Z��z�J��DyH
���
N�*�O�|���b�8l=���tp"s��N)�J����a_S�0��4�#�0�Rd8����0��dU_�֮i�a���;��Kn�Ӟԫu(���oZ����~t�����$�7tHa� �Z�E��95K��yx&��"��(�'��0a�qB���{�N�dCP�'��� ����C��ܕ2��;B�<C(]�T���TGo���V���ýM����1"�[��gAJ
�Nń��������TE�G/�n��;�����A�;�9� ��g��B�	����t�_�9�h~+�ɝާ�TLO.�ށ�+l@��vL���m�C�%�#� D(�00磊z��T�(h�-4/�yR|@��%�w�UiLd�����Tq�l����4=y�c.1��@�:E��<��g^�����$��� ���K5�orcʕX��nbܘ��&��=��|R©:���<ǡ	ߥ�p�n���,���:z]��lZX��8��<��f�JE�]�	��Z�JY����T�;Dv�P��_���Ԕ��-6�Uz��}xq�ͬ٠Y�T�U��ό�JR�)��������w�����(1(��C4>WSx(��������2Ø�v��4Tˡ^	��b|6��(���t5��m�(�txJ؂=��K�ȅ��έ+L�r���he
��_��)RS���M;'
�^gAG*[�P~���<�ϖ&YSX>7��e=[\/7�u��D�bY%Y)��\��Ce��e�v��P2��V�6jg�-tsq��)�%2ޙ��h�")U�V,�(�:��\O,RC���cQT�V��������Ax����S5�U��\����W�xT�e��!�q�O��[��v�&X�i��uGiZ2�8=�4�в_r���e�y�
�&0��فV�ыc�4o�'2IYځR�����
�{I=$\�@�yw�@�������}���Nq��#���s�7W�UuKU]���2~�b�SLD�iOZ��8�	b���$�a��fq߄|��t�j���ފ�ƈ�{6�����w��V�[�i���.���Q�E��I/��K�zcG�p^    ���#����(|
S���;�F:�������Uq#@�yu;�Po���r>�sT�N�X��J˼�>�ʋ0�P���r�r���erg8�~Րʀ 8�ra��	�
z���B7���;�sV꒦��S:�>�v=�}�-`������r >l	�DV�-�����1�g�\�䁽�������,�1pc
�������j߁@<�J�<�Ӯ����G����;�񺎧�σ�+uZ"74���݉�J��'���.]��<<�m8��8cs�H�A��sH�*��l#A)6��0���.�����a���>�w։���Dm28P�P��QP׍g��`�d�$c=�]�F�ESl��!q�.i.�/�byWc������.�����m���3�s46���2�b�	��c�e���k���\U��381g��P	=�\���DX�J�rܗN�j@���>+�*��"?�ZqJL�s��� d�'A:��N�sj�->�[<H�+N)�j��m��F��=��F�� %T���Iũ�wҍ�%�P�K߿T|��X֙0�JF�J���嚉�xU�_U*>��ֹw�t�� ��
lgutu����K>Pu����3;����~��RV'��&L������f-�@���C�.� �],��J�:�Zʂ�2���4�ustK�D���O����{�%�(MF}�xu4�4�ql �`<؝73�62K��=Ɯ"�@�Q�'���H��#�{Q8�#;�O����ȇ�i�/8Pݠ�n"�q�iݬ���[*�(L�C�%]��H�ޣh�t��GW�Y/�Q�t�M�)��0Py���^L_�����@(!-�H�^ �oVrs\SypZ�>���ܬ6��6k�9��M7i�Ñ�ء�����hؕT=9PvD�ܗT�����ux��I'��i�4������M�:��P�\���Be�r��Z�B�)g���=���%cR�t���t�gr^0�"�T~���T�����`�q3D��`P�W6�A/�λ�c>6AI����^�DM<;_J)��8��ǂ_W\Enӥ�!�+E) Gn���K&��c�d�P)J-��d(�\EF:e�V�u�d M¹��Q~PG�����xݾ#]��$�T�Z:P܂Y O�USj@x��(������rU5a]7�};`�V�2���~��; �V,�����2�v_� �Ǆ((~��9�Rz@m��*S2�s��Ҕdrř6�4��4��V>3�>5�O���hJGQvps����ðao�'NҙI���������Y��!�v�)M�����ǖ�nд�4��N&��,lA�N��2���GX�L{>7!C
�a�"��[I5��*
��4��J-MC����0(v�R����r��3�{�@C �_3Pc���q��FY�y����؟ӷ�Q�?ݶ�(�
a�O� �F^�9n��ʗEvo��8�PeZ��;k#ۣJht+�ɝ��GnA&e4;�1�^��c)믛��M(�*3�n�3Tv�$>"Li���^6w���/7ڏ=��0gLA�Y`���<�!r�R��������j�F�v���B�*��fځN�\{Y0�?$����؁���k�y����B�
��K`R��T�ٜ	Ζ� �*m'��ӧP��"L��+�����:��j-h�K�OD���bÖ��r\ɕ\�I3�a^{���I��Y�Tg;�����h���h.t�X��%�b�1sT�i�)^��g��Qu*�t�������:�JQ�я���Z�єB�O_@��O]b���:|��V�86я[�f���a��8�d����t+��:{��̗�{��Z�=�%a��*�a�`�pؒ�x�|��C5a��'w���n��W�,���5������w��/&��&�)�*�	W��3hT���P!d	S"	��(Ou��m���S���{��\�E�������b��$��r���>��<U�N���=I��R��s�<�.��6��I��r����)���X�vMT�[���>E�Y	,U����/R�C<�|�1������D�P���qM	�Gߛ�D4�h �(mM��g�)p>��*$K'�/t�b���mc
�����=kF����
�`���ã:�ڋ��Lz���nt<�Ԍ*|�m��D�6E���bN���OI���,֜3� �	V�{	�W3�ѭt~�/tJ��9U��Mk�*Hxp����7u��
�;V�޶PT�q����<}��ɷ��&L�{Yl��SǁbxAV������&i>��P�� �<��/I�D��L��W�J0�?�A~_�������1%��qӗI�h���'��O�ڲx6�z�Ks%Y�o�U���b�O%zt���x,Yy�w�n&�����_��>7�WX괗��X)�ox{0P� ��1��D[}	��s<(���dO[.�����'�"�/6�`Q�l��TF���+�5�f���&@L�� �3[��Nx��e�xu�%!��T�ܾ����;/�a�Ջ�����vy���ԟLPH��w���CE)G)z�G��� �����|I�*���t�k�B_7Fn/����r�#�o�CP���lG����K���6��~_]�+�i�͌��&�j��+��~g����R�hWJ�
;xC��;���\�֪m�i�6y���x���yW m�i#��b^~��*��D|hه�"�v:^ђ�t$����<�Px<��(�}o3��Ó���}�Q]{�d�1~�
 #IoLD�׷Mu񶝞���m�X�;��`ˬ�Nn�L�%���n��F��	�_�>Ŵ/o��B�I�*c`J<1mx�������r)l��%61����pkwFo��@�w��J�d{? ��Q-ο}���a���|�������f�]6`0�W�M��q2��ۃ���C4�+9������}В�ʺ�ȇ�0:C�G�Y(+q�<����t��o͙���W���]��6
�,��O�A�!��xu�l-�>Й����,�`
����D��@岾�4��ts=_n>WG��Y���~O �<7�^ɂ�S;2��� �
W�$8V('�p}/��^^,��~@�NJ�=���{ɣ{'�^ _����^�:�:�ݧ�?P��yb���q{��n�?�������=��w��q�7A��8SAI�Op�#=��T'>�0�c)�
o�r�m^o{T���Gha<cyK�0�{@{
�m[8&ݻ�Ɍ��͉C��@�ẉ���/��Eb��NPpF������m)~�I2���P4�,�ӥ���c9��$�n����y[�
����-�^׳{te6��+��,��{��O���xJr��!L���Ü3����(��t��(�rg!��ٹ��?gٿ��;�U�k3����G	'.:5J��y��b��0�pLU����κߵ���ps.�1��&Hi����ᚼ�֏��q�pdr��w8�Ѝ�
ޗyÂi�a��~�c��d���
��<�}�o~�p��ڗ��g�XE`q���w��oh��|�#����q����E"��Ap�T�G?�@e����FID#�5r;�9Yn~`Ť�n)U�O�y�Ķ�7->��i4��㳴�ȝg��h30$'�~7��r��V�.7�xM6@:��Pj�<e(�a��T�Yd�����e�a�:�O@)g�6l��n�,L�R����v��~�-@#nf�}3oWH��+�`J�����9P�gDs��|rX���?0[ܥ��|��(����L3�3��'�ю2F��	�yΕ���^�0���9^d;���bQ
�^1���lsfa#g2�r6a�U�^o��3��)� e�0Ɲ3��=�à�x��([0�*11R
���p��������K	��Jw&y����̇�z�¡qE�`c�L�Q��ϘC'ZpfJH]�+�S�a�7c"�G��&����>�S��LXV��۲rH����{�'5�����u��iB�@�E���E���P�`}�d&�+ �P����%�|�
A�E3H�6Fp�T�'�;�#|�AA-*�c;(m�    ����W���aG�n��g�� ���������]     