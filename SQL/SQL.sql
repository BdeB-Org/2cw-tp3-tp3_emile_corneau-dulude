-- Création de la table sandwichs
CREATE TABLE sandwichs (
    nom_sandwich     VARCHAR2(30) NOT NULL,
    prix    NUMBER NOT NULL,
    review  VARCHAR2(4) NOT NULL
);

ALTER TABLE sandwichs ADD CONSTRAINT sandwichs_pk PRIMARY KEY ( nom_sandwich );

-- Insertion des données dans la table sandwichs
INSERT INTO sandwichs (nom_sandwich,prix,review) VALUES ('Poulet', 7.99, '73%');
INSERT INTO sandwichs (nom_sandwich,prix,review) VALUES ('Jambon Fromage', 7.99, '64%');
INSERT INTO sandwichs (nom_sandwich,prix,review) VALUES ('Club', 12.50, '30%');
INSERT INTO sandwichs (nom_sandwich,prix,review) VALUES ('Bagel Saumon', 11.99, '93%');
COMMIT;

SELECT *
FROM SANDWICHS;


-- Création de la table desserts
CREATE TABLE desserts (
    nom_dessert     VARCHAR2(30) NOT NULL,
    prix    NUMBER NOT NULL,
    review  VARCHAR2(4) NOT NULL
);

ALTER TABLE desserts ADD CONSTRAINT desserts_pk PRIMARY KEY ( nom_dessert );

-- Insertion des données dans la table desserts
INSERT INTO desserts (nom_dessert,prix,review) VALUES ('Tartelette', 3.40, '92%');
INSERT INTO desserts (nom_dessert,prix,review) VALUES ('Mille Feuille', 4.20, '52%');
INSERT INTO desserts (nom_dessert,prix,review) VALUES ('Brownies', 2.00, '74%');
INSERT INTO desserts (nom_dessert,prix,review) VALUES ('Eclair', 4.10, '66%');
COMMIT;

SELECT *
FROM DESSERTS;


-- Création de la table congeles
CREATE TABLE congeles (
    nom_congele     VARCHAR2(30) NOT NULL,
    prix    NUMBER NOT NULL,
    review  VARCHAR2(4) NOT NULL
);

ALTER TABLE congeles ADD CONSTRAINT congeles_pk PRIMARY KEY ( nom_congele );

-- Insertion des données dans la table congeles
INSERT INTO congeles (nom_congele,prix,review) VALUES ('Croissant', 3.40, '81%');
INSERT INTO congeles (nom_congele,prix,review) VALUES ('Chocolatine', 4.20, '79%');
INSERT INTO congeles (nom_congele,prix,review) VALUES ('Pate Feuilletee', 2.00, '85%');
COMMIT;

SELECT *
FROM CONGELES;


-- Création de la table commandes
CREATE TABLE commandes (
    nom_item     VARCHAR2(30) NOT NULL,
    prix    NUMBER NOT NULL
);

ALTER TABLE commandes ADD CONSTRAINT commandes_pk PRIMARY KEY ( nom_item );

-- Insertion des données dans la table commandes
INSERT INTO commandes (nom_item,prix) VALUES ('Croissant', 3.40);
INSERT INTO commandes (nom_item,prix) VALUES ('Mille Feuille', 4.20);
INSERT INTO commandes (nom_item,prix) VALUES ('Bagel Saumon', 11.99);
COMMIT;

SELECT *
FROM COMMANDES;


BEGIN
  ORDS.enable_schema(
    p_enabled             => TRUE,
    p_schema              => 'RESTSCOTT',
    p_url_mapping_type    => 'BASE_PATH',
    p_url_mapping_pattern => 'hr2',
    p_auto_rest_auth      => FALSE
  );
    
  COMMIT;
END;
/

-- Activation de la table hotel pour acces REST
BEGIN
  ORDS.enable_object (
    p_enabled      => TRUE, -- Default  { TRUE | FALSE }
    p_schema       => 'RESTSCOTT',
    p_object       => 'SANDWICHS',
    p_object_type  => 'TABLE', -- Default  { TABLE | VIEW }
    p_object_alias => 'sandwichs'
  );
    
  COMMIT;
END;
/

-- Activation de la table personnel hotel pour acces REST
BEGIN
  ORDS.enable_object (
    p_enabled      => TRUE, -- Default  { TRUE | FALSE }
    p_schema       => 'RESTSCOTT',
    p_object       => 'DESSERTS',
    p_object_type  => 'TABLE', -- Default  { TABLE | VIEW }
    p_object_alias => 'desserts'
  );
    
  COMMIT;
END;
/

-- Activation de la table client pour acces REST
BEGIN
  ORDS.enable_object (
    p_enabled      => TRUE, -- Default  { TRUE | FALSE }
    p_schema       => 'RESTSCOTT',
    p_object       => 'CONGELES',
    p_object_type  => 'TABLE', -- Default  { TABLE | VIEW }
    p_object_alias => 'congeles'
  );
    
  COMMIT;
END;
/

-- Activation de la table reservation pour acces REST
BEGIN
  ORDS.enable_object (
    p_enabled      => TRUE, -- Default  { TRUE | FALSE }
    p_schema       => 'RESTSCOTT',
    p_object       => 'COMMANDES',
    p_object_type  => 'TABLE', -- Default  { TABLE | VIEW }
    p_object_alias => 'commandes'
  );
    
  COMMIT;
END;
/

-- Confirmation de l'activation du schema
SELECT *
FROM user_ords_schemas;

-- Confirmation de l'activation des tables pour REST
SELECT *
FROM   user_ords_enabled_objects;