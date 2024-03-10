PGDMP  ,            	        |            db_evaluacion    16.1    16.1 -    (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            )           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            *           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            +           1262    26173    db_evaluacion    DATABASE     �   CREATE DATABASE db_evaluacion WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE db_evaluacion;
                postgres    false            �            1255    26251    eliminar_venta(integer) 	   PROCEDURE     �   CREATE PROCEDURE public.eliminar_venta(IN p_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM ventas
    WHERE id = p_id;
END;
$$;
 7   DROP PROCEDURE public.eliminar_venta(IN p_id integer);
       public          postgres    false            �            1255    26249 2   insertar_venta(integer, numeric, integer, integer) 	   PROCEDURE       CREATE PROCEDURE public.insertar_venta(IN p_id integer, IN p_total numeric, IN p_id_local integer, IN p_id_cliente integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO ventas (id, total, id_local, id_cliente)
    VALUES (p_id, p_total, p_id_local, p_id_cliente);
END;
$$;
 {   DROP PROCEDURE public.insertar_venta(IN p_id integer, IN p_total numeric, IN p_id_local integer, IN p_id_cliente integer);
       public          postgres    false            �            1255    26250 3   modificar_venta(integer, numeric, integer, integer) 	   PROCEDURE     ,  CREATE PROCEDURE public.modificar_venta(IN p_id integer, IN p_total numeric, IN p_id_local integer, IN p_id_cliente integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE ventas
    SET total = p_total,
        id_local = p_id_local,
        id_cliente = p_id_cliente
    WHERE id = p_id;
END;
$$;
 |   DROP PROCEDURE public.modificar_venta(IN p_id integer, IN p_total numeric, IN p_id_local integer, IN p_id_cliente integer);
       public          postgres    false            �            1255    26257    registrar_auditoria_delete()    FUNCTION     �   CREATE FUNCTION public.registrar_auditoria_delete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO auditoria_ventas (usuario, procedimiento, fecha)
    VALUES ('ELIMINACIÓN', current_user, now());
    RETURN OLD;
END;
$$;
 3   DROP FUNCTION public.registrar_auditoria_delete();
       public          postgres    false            �            1255    26253    registrar_auditoria_insert()    FUNCTION     �   CREATE FUNCTION public.registrar_auditoria_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO auditoria_ventas (usuario, procedimiento, fecha)
    VALUES ('INSERCIÓN', current_user, now());
    RETURN NEW;
END;
$$;
 3   DROP FUNCTION public.registrar_auditoria_insert();
       public          postgres    false            �            1255    26255    registrar_auditoria_update()    FUNCTION     �   CREATE FUNCTION public.registrar_auditoria_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO auditoria_ventas (usuario, procedimiento, fecha)
    VALUES ('MODIFICACIÓN', current_user, now());
    RETURN NEW;
END;
$$;
 3   DROP FUNCTION public.registrar_auditoria_update();
       public          postgres    false            �            1259    26246    auditoria_ventas    TABLE     �   CREATE TABLE public.auditoria_ventas (
    usuario character varying(50),
    procedimiento character varying(50),
    fecha timestamp with time zone
);
 $   DROP TABLE public.auditoria_ventas;
       public         heap    postgres    false            �            1259    26176    clientes    TABLE     �   CREATE TABLE public.clientes (
    id smallint NOT NULL,
    nombre character varying(70),
    id_genero smallint,
    telefono character(12),
    monto_vendido numeric(20,2)
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    26179    generos    TABLE     a   CREATE TABLE public.generos (
    id smallint NOT NULL,
    descripcion character varying(50)
);
    DROP TABLE public.generos;
       public         heap    postgres    false            �            1259    26182    lineas_venta    TABLE     �   CREATE TABLE public.lineas_venta (
    id smallint NOT NULL,
    id_venta smallint,
    id_producto smallint,
    cantidad smallint,
    subtotal numeric(20,4)
);
     DROP TABLE public.lineas_venta;
       public         heap    postgres    false            �            1259    26185    locales    TABLE     \   CREATE TABLE public.locales (
    id smallint NOT NULL,
    nombre character varying(70)
);
    DROP TABLE public.locales;
       public         heap    postgres    false            �            1259    26188    persona    TABLE     ~   CREATE TABLE public.persona (
    id smallint NOT NULL,
    nombre character varying(50),
    estado character varying(50)
);
    DROP TABLE public.persona;
       public         heap    postgres    false            �            1259    26191 	   productos    TABLE     �   CREATE TABLE public.productos (
    id smallint NOT NULL,
    nombre character varying(70),
    precio numeric(20,4),
    id_tipo_producto smallint
);
    DROP TABLE public.productos;
       public         heap    postgres    false            �            1259    26194    tipos_productos    TABLE     d   CREATE TABLE public.tipos_productos (
    id smallint NOT NULL,
    nombre character varying(50)
);
 #   DROP TABLE public.tipos_productos;
       public         heap    postgres    false            �            1259    26197    ventas    TABLE     �   CREATE TABLE public.ventas (
    id smallint NOT NULL,
    total numeric(15,5),
    id_local smallint NOT NULL,
    id_cliente smallint
);
    DROP TABLE public.ventas;
       public         heap    postgres    false            %          0    26246    auditoria_ventas 
   TABLE DATA           I   COPY public.auditoria_ventas (usuario, procedimiento, fecha) FROM stdin;
    public          postgres    false    223   �7                 0    26176    clientes 
   TABLE DATA           R   COPY public.clientes (id, nombre, id_genero, telefono, monto_vendido) FROM stdin;
    public          postgres    false    215   08                 0    26179    generos 
   TABLE DATA           2   COPY public.generos (id, descripcion) FROM stdin;
    public          postgres    false    216   �8                 0    26182    lineas_venta 
   TABLE DATA           U   COPY public.lineas_venta (id, id_venta, id_producto, cantidad, subtotal) FROM stdin;
    public          postgres    false    217   9                  0    26185    locales 
   TABLE DATA           -   COPY public.locales (id, nombre) FROM stdin;
    public          postgres    false    218   �9       !          0    26188    persona 
   TABLE DATA           5   COPY public.persona (id, nombre, estado) FROM stdin;
    public          postgres    false    219   �9       "          0    26191 	   productos 
   TABLE DATA           I   COPY public.productos (id, nombre, precio, id_tipo_producto) FROM stdin;
    public          postgres    false    220   �9       #          0    26194    tipos_productos 
   TABLE DATA           5   COPY public.tipos_productos (id, nombre) FROM stdin;
    public          postgres    false    221   s:       $          0    26197    ventas 
   TABLE DATA           A   COPY public.ventas (id, total, id_local, id_cliente) FROM stdin;
    public          postgres    false    222   �:       v           2606    26201    clientes clientes_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    215            x           2606    26203    generos generos_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.generos
    ADD CONSTRAINT generos_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.generos DROP CONSTRAINT generos_pkey;
       public            postgres    false    216            z           2606    26205    lineas_venta lineas_venta_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.lineas_venta
    ADD CONSTRAINT lineas_venta_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.lineas_venta DROP CONSTRAINT lineas_venta_pkey;
       public            postgres    false    217            |           2606    26207    locales locales_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.locales
    ADD CONSTRAINT locales_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.locales DROP CONSTRAINT locales_pkey;
       public            postgres    false    218            ~           2606    26209    persona persona_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.persona DROP CONSTRAINT persona_pkey;
       public            postgres    false    219            �           2606    26211    productos productos_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_pkey;
       public            postgres    false    220            �           2606    26213 $   tipos_productos tipos_productos_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.tipos_productos
    ADD CONSTRAINT tipos_productos_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.tipos_productos DROP CONSTRAINT tipos_productos_pkey;
       public            postgres    false    221            �           2606    26215    ventas ventas_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_pkey;
       public            postgres    false    222            �           2620    26258    ventas trigger_auditoria_delete    TRIGGER     �   CREATE TRIGGER trigger_auditoria_delete AFTER DELETE ON public.ventas FOR EACH ROW EXECUTE FUNCTION public.registrar_auditoria_delete();
 8   DROP TRIGGER trigger_auditoria_delete ON public.ventas;
       public          postgres    false    222    226            �           2620    26254    ventas trigger_auditoria_insert    TRIGGER     �   CREATE TRIGGER trigger_auditoria_insert AFTER INSERT ON public.ventas FOR EACH ROW EXECUTE FUNCTION public.registrar_auditoria_insert();
 8   DROP TRIGGER trigger_auditoria_insert ON public.ventas;
       public          postgres    false    222    224            �           2620    26256    ventas trigger_auditoria_update    TRIGGER     �   CREATE TRIGGER trigger_auditoria_update AFTER UPDATE ON public.ventas FOR EACH ROW EXECUTE FUNCTION public.registrar_auditoria_update();
 8   DROP TRIGGER trigger_auditoria_update ON public.ventas;
       public          postgres    false    222    225            �           2606    26216    clientes cliente_genero_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT cliente_genero_fk FOREIGN KEY (id_genero) REFERENCES public.generos(id) NOT VALID;
 D   ALTER TABLE ONLY public.clientes DROP CONSTRAINT cliente_genero_fk;
       public          postgres    false    215    216    4728            �           2606    26221    ventas clientes_ventas_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT clientes_ventas_fk FOREIGN KEY (id_cliente) REFERENCES public.clientes(id) NOT VALID;
 C   ALTER TABLE ONLY public.ventas DROP CONSTRAINT clientes_ventas_fk;
       public          postgres    false    4726    215    222            �           2606    26226 #   lineas_venta lineaventa_producto_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.lineas_venta
    ADD CONSTRAINT lineaventa_producto_fk FOREIGN KEY (id_producto) REFERENCES public.productos(id) NOT VALID;
 M   ALTER TABLE ONLY public.lineas_venta DROP CONSTRAINT lineaventa_producto_fk;
       public          postgres    false    220    4736    217            �           2606    26231     lineas_venta lineaventa_venta_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.lineas_venta
    ADD CONSTRAINT lineaventa_venta_fk FOREIGN KEY (id_venta) REFERENCES public.ventas(id) NOT VALID;
 J   ALTER TABLE ONLY public.lineas_venta DROP CONSTRAINT lineaventa_venta_fk;
       public          postgres    false    222    217    4740            �           2606    26236 $   productos productos_tipo_producto_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_tipo_producto_fk FOREIGN KEY (id_tipo_producto) REFERENCES public.tipos_productos(id) NOT VALID;
 N   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_tipo_producto_fk;
       public          postgres    false    220    221    4738            �           2606    26241    ventas ventas_locales_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_locales_fk FOREIGN KEY (id_local) REFERENCES public.locales(id) NOT VALID;
 B   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_locales_fk;
       public          postgres    false    218    222    4732            %   �   x����	�@��s�
�0~��7��
z�*#�N,��t�ݤ��W˥?w�y��1N���65`��m�i�2!E	-�N{=h��ob��,'�RQ�A˂ILާJt1��#`���0��2�5e�݀�l�E5W2�|�ZPo         �   x�U��
�0�s�y�ѦIX�w�K�c��C��v�!�_�$!h�6ԁUXU��.���qE��5�g�����$h�	\��o9a��)�-��K7�T<y���Ц��$�"��F��ʤB���8O8�)��p�[���)�S�{��+��{��1��3p         !   x�3��M,N.�����2�tK�M�1c���� ~�         ^   x�E���0г&
��v��?G�NOF��c�0Z�ȉ�"WQ;�>V:hk�6��ʱ��EK�f�ߵ��iossf�W������l0�㫉��I�          !   x�340���ON�Q0�240���b�b���� y7      !      x�3��*M��tN,NL������ 5�      "   �   x�E�1�0D�z����=EJ���dyњ*5G�Űb!�|��~��k8Ӕ���1߽
�Uiѳ����p����(�;�����a�S�I��[G;���|RWe�A8F�k�K�m�rt1D��)�      #   *   x�3�H,H�I-:�6�ˈ�#3=35/�˘3--�+F��� Č	�      $   F   x�]��	�0��0Ʋ���t�9�B	I�;���ͿA.e��@2��^����w���i��]�����\ =     