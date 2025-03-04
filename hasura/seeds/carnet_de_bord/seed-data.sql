DO language plpgsql $$
BEGIN
	RAISE NOTICE 'SEED %', now();
END
$$;

TRUNCATE public.admin_structure_structure CASCADE;
TRUNCATE public.beneficiary_structure CASCADE;
TRUNCATE public.structure CASCADE;

TRUNCATE public.notebook_focus CASCADE;
TRUNCATE public.notebook_target CASCADE;
TRUNCATE public.notebook_action CASCADE;
TRUNCATE public.notebook_event CASCADE;
TRUNCATE public.notebook_member CASCADE;
TRUNCATE public.notebook_appointment CASCADE;

TRUNCATE public.external_data_info CASCADE;
TRUNCATE public.external_data CASCADE;


TRUNCATE public.admin_cdb CASCADE;
TRUNCATE public.manager CASCADE;
TRUNCATE public.admin_structure CASCADE;
TRUNCATE public.orientation_manager CASCADE;
TRUNCATE public.professional CASCADE;
TRUNCATE public.beneficiary CASCADE;
TRUNCATE public.notebook CASCADE;
TRUNCATE public.wanted_job CASCADE;
TRUNCATE public.deployment CASCADE;

TRUNCATE public.account CASCADE;

SET check_function_bodies = false;

-- Admin account
INSERT INTO public.admin_cdb (id, email, firstname, lastname) VALUES ('a81bc81a-dead-4e5d-abff-90865d1e13b7', 'support.carnet-de-bord+admin@fabrique.social.gouv.fr', 'Carnet de Bord', 'Administrateur');
INSERT INTO public.account (id, username, type, access_key, access_key_date, last_login, beneficiary_id, professional_id, admin_id, confirmed, onboarding_done) VALUES ('9eee9fea-bf3e-4eb8-8f43-d9b7fd6fae76', 'admin', 'admin_cdb', NULL, NULL, '2021-09-21 12:25:55.822+00', NULL, NULL, 'a81bc81a-dead-4e5d-abff-90865d1e13b7', true, false);

-- Deployments
INSERT INTO public.deployment (id, label) VALUES ('4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', 'expérimentation 93');
INSERT INTO public.deployment (id, label, config) VALUES ('c5c3a933-6f4a-4b2b-aa49-7a816eaef16b', 'expérimentation 51', '{"url": "http://localhost:3000/api/test", "headers": {"token":"azerty"}, "callback": "/api/marne" }');

--Structures:
INSERT INTO public.structure (id, siret, name, short_desc, phone, email, postal_code, city, address1, address2, website, deployment_id)
VALUES ('a81bc81b-dead-4e5d-abff-90865d1e13b2', NULL, 'Pole Emploi Agence Livry-Gargnan', 'Pole Emploi Agence Livry-Gargnan', '09 72 72 39 49', 'contact@pole-emploi.fr', '93190', 'Livry Gargan', '33 Bd Robert Schuman', NULL, NULL, '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0');
INSERT INTO public.structure (id, siret, name, short_desc, phone, email, postal_code, city, address1, address2, website, deployment_id)
VALUES ('1c52e5ad-e0b9-48b9-a490-105a4effaaea', NULL, 'Centre Communal d''action social Livry-Gargan', '', '01 41 70 88 00', NULL, NULL, 'Saint Denis', '3 Pl. François Mitterrand', NULL, NULL, '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0');
INSERT INTO public.structure (id, siret, name, short_desc, phone, email, postal_code, city, address1, address2, website, deployment_id)
VALUES ('e578237f-6167-4012-b457-7c4f36fb079d', NULL, 'Service Social Départemental', NULL, '01 71 29 43 80', NULL, '93800', 'Épinay-sur-Seine', ' 38 Av. Salvador Allende', NULL, NULL, '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0');
INSERT INTO public.structure (id, siret, name, short_desc, phone, email, postal_code, city, address1, address2, website, deployment_id)
VALUES ('8b71184c-6479-4440-aa89-15da704cc792', NULL, 'Groupe NS', NULL, '01 87 97 36 45', NULL, '91300', 'Montreuil', '28 rue de Lorraine', NULL, NULL, '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0');
INSERT INTO public.structure (id, siret, name, short_desc, phone, email, postal_code, city, address1, address2, website, deployment_id)
VALUES ('58d09cad-ed8c-4278-b449-e6673ae0fad4', NULL, 'Amélie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0');
INSERT INTO public.structure (id, siret, name, short_desc, phone, email, postal_code, city, address1, address2, website, deployment_id)
VALUES ('e8d09cad-ed8c-4278-b449-e6673ae0fad4', NULL, 'Sécurité sociale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0');
INSERT INTO public.structure (id, siret, name, short_desc, phone, email, postal_code, city, address1, address2, website, deployment_id)
VALUES ('3b299bcb-445c-48db-bc61-e30cd52d65b6', NULL, 'AFPA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0');
INSERT INTO public.structure (id, siret, name, short_desc, phone, email, postal_code, city, address1, address2, website, deployment_id)
VALUES ('dfaaa6e1-4c5a-4079-a191-e8611d573acf', NULL, 'Plateforme - Ma demande de logement social', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0');
INSERT INTO public.structure (id, siret, name, short_desc, phone, email, postal_code, city, address1, address2, website, deployment_id)
VALUES ('dfaaa6e3-4c5a-4079-a191-e8611d573acf', NULL, 'Interlogement 93', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0');
INSERT INTO public.structure (id, siret, name, short_desc, phone, email, postal_code, city, address1, address2, website, deployment_id)
VALUES ('c0b8aee3-c061-4023-b57e-92880627d589', NULL, 'Interlogement 51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'c5c3a933-6f4a-4b2b-aa49-7a816eaef16b');
INSERT INTO public.structure (id, siret, name, short_desc, phone, email, postal_code, city, address1, address2, website, deployment_id)
VALUES ('0143a94b-5df5-425e-a023-f2b2517ad038', '13000548120281', 'CHARLEVILLE-MEZIERES VAL DE VENCE', 'Agence Pôle emploi CHARLEVILLE-MEZIERES VAL DE VENCE', '3949', 'contact@pole-emploi.fr', '08000', 'CHARLEVILLE MEZIERES', '6 RUE JEAN BAPTISTE LEFORT', NULL, NULL, NULL);


-- Insertion workers Accounts
-- Structure admins:
-- Vincent Timaitre
INSERT INTO public.admin_structure (id, email, firstname, lastname, phone_numbers, deployment_id) VALUES ('c2a346cd-b3dd-4892-a33d-7ada82654f97', 'vincent.timaitre@groupe-ns.fr', 'Vincent', 'Timaitre', '0102030405', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0');
INSERT INTO public.account (id, username, type, admin_structure_id, confirmed, onboarding_done) VALUES ('1a19d72c-7fb1-4cdb-aa47-853b83239c98', 'vincent.timaitre', 'admin_structure', 'c2a346cd-b3dd-4892-a33d-7ada82654f97', true, true);
INSERT INTO public.admin_structure_structure (id, admin_structure_id, structure_id) VALUES ('3b1082e7-7ccd-4857-a4ae-924b5314b2e4', 'c2a346cd-b3dd-4892-a33d-7ada82654f97', '8b71184c-6479-4440-aa89-15da704cc792');
-- Jacques Celaire
INSERT INTO public.admin_structure (id, email, firstname, lastname, phone_numbers, deployment_id) VALUES ('2b4b773a-a9e5-11ec-b909-0242ac120002', 'jacques.celaire@livry-gargan.fr', 'Jacques', 'Célaire', '0102030405', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0');
INSERT INTO public.account (id, username, type, admin_structure_id, confirmed, onboarding_done) VALUES ('18f06321-3c45-4490-9c67-36277d4a828d', 'jacques.celaire', 'admin_structure', '2b4b773a-a9e5-11ec-b909-0242ac120002', true, false);
INSERT INTO public.admin_structure_structure (id, admin_structure_id, structure_id) VALUES ('1e502686-0df9-48ac-85fc-909f464fc0d4', '2b4b773a-a9e5-11ec-b909-0242ac120002', '1c52e5ad-e0b9-48b9-a490-105a4effaaea');
-- Lara Pafromage
INSERT INTO public.admin_structure (id, email, firstname, lastname, phone_numbers, deployment_id) VALUES ('04e185b0-07b6-4dbf-a248-5f1d9989c133', 'lara.pafromage@cd93.fr', 'Lara', 'Pafromage', '0102030405', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0');
INSERT INTO public.account (id, username, type, admin_structure_id, confirmed, onboarding_done) VALUES ('ecc81586-12c0-46e9-bb65-e19ba419506d', 'lara.pafromage', 'admin_structure', '04e185b0-07b6-4dbf-a248-5f1d9989c133', true, true);
INSERT INTO public.admin_structure_structure (id, admin_structure_id, structure_id) VALUES ('d105193c-f4a8-470e-9575-91297edb9e6c', '04e185b0-07b6-4dbf-a248-5f1d9989c133', '1c52e5ad-e0b9-48b9-a490-105a4effaaea');
INSERT INTO public.admin_structure_structure (id, admin_structure_id, structure_id) VALUES ('7ca0d376-3b3e-472b-ad71-ef615d1313d5', '04e185b0-07b6-4dbf-a248-5f1d9989c133', '8b71184c-6479-4440-aa89-15da704cc792');

-- Deployment managers:
-- Manager cd93
INSERT INTO public.manager (id, email, firstname, lastname, deployment_id) VALUES ('01a3d906-70d9-42e6-9b61-2ccf030e5d8f', 'support.carnet-de-bord+cd93@fabrique.social.gouv.fr', 'Agathe', 'DeBlouze', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0');
INSERT INTO public.account (id, username, type, manager_id, confirmed, onboarding_done) VALUES ('96cb6e09-81fa-44e9-9b3f-75c93ad96f94', 'manager.cd93', 'manager', '01a3d906-70d9-42e6-9b61-2ccf030e5d8f', true, true);
-- Manager cd51
INSERT INTO public.manager (id, email, firstname, lastname, deployment_id) VALUES ('cc32124d-f810-4193-a855-db76915ae7e4', 'support.carnet-de-bord+cd51@fabrique.social.gouv.fr', 'Gérard', 'Manvol', 'c5c3a933-6f4a-4b2b-aa49-7a816eaef16b');
INSERT INTO public.account (id, username, type, manager_id, confirmed, onboarding_done) VALUES ('3f4c5d95-b25c-4e18-a2c6-b394b8221c8f', 'manager.cd51', 'manager', 'cc32124d-f810-4193-a855-db76915ae7e4', true, false);

-- Pros:
-- Pierre Chevalier
INSERT INTO public.professional (id, structure_id, email, lastname, firstname, "position", mobile_number) VALUES ('1a5b817b-6b81-4a4d-9953-26707a54e0e9', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pierre.chevalier@livry-gargan.fr', 'Chevalier', 'Pierre', 'Conseiller en insertion', '01 41 70 88 00');
INSERT INTO public.account (id, username, type, access_key, access_key_date, last_login, beneficiary_id, professional_id, admin_id, confirmed, onboarding_done) VALUES ('17434464-5f69-40cc-8172-40160958a33d', 'pierre.chevalier', 'professional', NULL, NULL, '2021-09-27 14:08:02.222+00', NULL, '1a5b817b-6b81-4a4d-9953-26707a54e0e9', NULL, true, true);
-- Paul Camara
INSERT INTO public.professional (id, structure_id, email, lastname, firstname, "position", mobile_number) VALUES ('e1fdb7a8-7d0e-4b2e-b28c-89a662d090a3', 'e578237f-6167-4012-b457-7c4f36fb079d', 'pcamara@seinesaintdenis.fr', 'Camara', 'Paul', 'Assistant de service social', '01 71 29 43 80');
INSERT INTO public.account (id, username, type, access_key, access_key_date, last_login, beneficiary_id, professional_id, admin_id, confirmed, onboarding_done) VALUES ('d0b8f314-5e83-4535-9360-60f29dcfb5c8', 'pcamara', 'professional', NULL, NULL, NULL, NULL, 'e1fdb7a8-7d0e-4b2e-b28c-89a662d090a3', NULL, true, true);
-- Simon Anka
INSERT INTO public.professional (id, structure_id, email, lastname, firstname, "position", mobile_number) VALUES ('74323049-eae6-4ccd-b596-e95514a32781', '8b71184c-6479-4440-aa89-15da704cc792', 'sanka@groupe-ns.fr', 'Anka', 'Simon', 'Conseiller en Insertion Professionnel', NULL);
INSERT INTO public.account (id, username, type, access_key, access_key_date, last_login, beneficiary_id, professional_id, admin_id, confirmed, onboarding_done) VALUES ('a501db53-1b79-4a60-860b-5972bd184f98', 'sanka', 'professional', NULL, NULL, NULL, NULL, '74323049-eae6-4ccd-b596-e95514a32781', NULL, true, true);
-- Thierry Dunord
INSERT INTO public.professional (id, structure_id, email, lastname, firstname, "position", mobile_number) VALUES ('a81bc81b-dead-4e5d-abff-90865d1e13b3', 'a81bc81b-dead-4e5d-abff-90865d1e13b2', 'dunord@pole-emploi.fr', 'Dunord', 'Thierry', 'Conseiller pôle emploi', '');
INSERT INTO public.account (id, username, type, access_key, access_key_date, last_login, beneficiary_id, professional_id, admin_id, confirmed, onboarding_done) VALUES ('17434464-5f69-40cc-8173-40160958a33d', 'thierry.dunord', 'professional', NULL, NULL, '2021-08-23 07:59:48.689+00', NULL, 'a81bc81b-dead-4e5d-abff-90865d1e13b3', NULL, true, true);
-- Jean Poiret
INSERT INTO public.professional (id, structure_id, email, lastname, firstname, "position", mobile_number) VALUES ('9b5f4863-dd2e-4680-af40-46258c457654', 'dfaaa6e3-4c5a-4079-a191-e8611d573acf', 'jeanpoiret@mission-locale.fr', 'Poiret', 'Jean', 'Conseiller Logement', '');
INSERT INTO public.account (id, username, type, professional_id, confirmed, onboarding_done) VALUES ('db78bfd9-aedb-4220-bf0a-f62b0528e5bf', 'jean.poiret', 'professional', '9b5f4863-dd2e-4680-af40-46258c457654', true, false);
-- Sandie Manchet
INSERT INTO public.professional (id, structure_id, email, lastname, firstname, "position", mobile_number) VALUES ('d211a3b8-346c-4f77-a570-bc1c9240e744', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'sandie.manchet@livry-gargan.fr', 'Manchet', 'Sandie', 'Conseillere sociale', '');
INSERT INTO public.account (id, username, type, professional_id, confirmed, onboarding_done) VALUES ('6338f969-c881-41d7-9af8-9f5c92f7ac67', 'sandie.manchet', 'professional', 'd211a3b8-346c-4f77-a570-bc1c9240e744', true, false);
-- Blaise Alaise
INSERT INTO public.professional (id, structure_id, email, lastname, firstname, "position", mobile_number) VALUES ('3de46574-311a-462c-88d4-e2e89d2bd136', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pro@pe.fr', 'Alaise', 'Blaise', 'Conseiller Logement', '');
INSERT INTO public.account (id, username, type, professional_id, confirmed, onboarding_done) VALUES ('1b45defb-d1d1-4c07-af47-b1062cb9b5f5', 'alaise.blaise', 'professional', '3de46574-311a-462c-88d4-e2e89d2bd136', true, false);
-- Lejeune Bienvenu
INSERT INTO public.professional (id, structure_id, email, lastname, firstname, "position", mobile_number) VALUES ('b7f75b75-8a3f-4143-a7fa-cefec88634a6', 'dfaaa6e3-4c5a-4079-a191-e8611d573acf', 'bienvenu.lejeune@mission-locale.fr', 'Bienvenu', 'Lejeune', '', '');
INSERT INTO public.account (id, username, type, professional_id, confirmed, onboarding_done) VALUES ('32609be3-2282-4303-9ebd-4f419cf558d9', 'bienvenu.lejeune', 'professional', 'b7f75b75-8a3f-4143-a7fa-cefec88634a6', false, false);
-- Orial Edith
INSERT INTO public.professional (id, structure_id, email, lastname, firstname, "position", mobile_number) VALUES ('db09d6b1-8891-4638-b483-5eb917e8098d', 'dfaaa6e3-4c5a-4079-a191-e8611d573acf', 'edith.orial@interlogement93.fr', 'Edith', 'Orial', '', '');
INSERT INTO public.account (id, username, type, professional_id, confirmed, onboarding_done) VALUES ('521a2983-17e2-43a9-abf6-7ed9f93cf7f9', 'edith.orial', 'professional', 'db09d6b1-8891-4638-b483-5eb917e8098d', false, false);

-- Orientation managers:
-- Giulia Diaby
INSERT INTO public.orientation_manager (id, email, lastname, firstname, phone_numbers, deployment_id) VALUES ('607cb6f8-9e33-4ce8-98b1-38e60c9dda99', 'giulia.diaby@cd93.fr', 'Diaby', 'Giulia', '0912345678, 0612345678', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0');
INSERT INTO public.account (id, username, type, orientation_manager_id, confirmed, onboarding_done) VALUES ('2addd10f-9bd3-4d37-b3c9-10a6e2c4be4f', 'giulia.diaby', 'orientation_manager', '607cb6f8-9e33-4ce8-98b1-38e60c9dda99', true, false);
-- Samy Rouate
INSERT INTO public.orientation_manager (id, email, lastname, firstname, phone_numbers, deployment_id) VALUES ('3f82fc22-12f0-4c0b-85d5-57ae054a2ee3', 'samy.rouate@cd93.fr', 'Rouate', 'Samy', '0912345678, 0612345678', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0');
INSERT INTO public.account (id, username, type, orientation_manager_id, confirmed, onboarding_done) VALUES ('23e910a6-0b3d-4147-ac6f-9efbcecaab70', 'samy.rouate', 'orientation_manager', '3f82fc22-12f0-4c0b-85d5-57ae054a2ee3', true, true);
-- Laure Loge
INSERT INTO public.orientation_manager (id, email, lastname, firstname, phone_numbers, deployment_id) VALUES ('3dbb610e-916f-49e0-8860-b5dc39decd49', 'laure.loge@cd51.fr', 'Loge', 'Laure', '0987654321, 0687654321', 'c5c3a933-6f4a-4b2b-aa49-7a816eaef16b');
INSERT INTO public.account (id, username, type, orientation_manager_id, confirmed, onboarding_done) VALUES ('f29ca78a-4719-4658-8d19-48d3df9178b5', 'laure.loge', 'orientation_manager', '3dbb610e-916f-49e0-8860-b5dc39decd49', true, false);


-- Beneficiaries:
--Sophie Tifour
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('c6e84ed6-eb31-47f0-bd71-9e4d7843cf0b', 'stifour93@yahoo.fr', 'Tifour', 'Sophie', '2055990', '300000L', '93190', 'Livry-Gargan', '7 chemin du soleil', NULL, '0606060606', '1982-02-01', 'Châlon en Champagne', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:02:50.597956+00', '2022-03-30 09:02:50.597956+00', '1234');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('5b7c51b1-b738-4805-bc06-a4119527f3f9', 'c6e84ed6-eb31-47f0-bd71-9e4d7843cf0b', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'done', '{}', '2022-03-24 17:22:38.219997+00', '2022-03-24 17:22:38.219997+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', 'c6e84ed6-eb31-47f0-bd71-9e4d7843cf0b', '2021-09-21 11:51:37.295647+00', 'rsa_droit_ouvert_et_suspendu', false, false, false, false, 'between_10_20', 'NV5', '2021-09-22', NULL, NULL, 'iae', '2022-03-30 09:17:52.320373+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('539675a3-ca5b-4fa7-8a34-1c988ac383f3', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Aide à domicile (K1304)'));
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('4e86e0dc-f6ae-4818-8649-e23248273145', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Conducteur / Conductrice d''engins d''exploitation agricole (A1101)'));
INSERT INTO public.notebook_member (id, notebook_id, account_id, last_visited_at, member_type, created_at, creator_id, invitation_sent_at) VALUES ('b712740e-74da-4b0b-96c8-d689be164807', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '2addd10f-9bd3-4d37-b3c9-10a6e2c4be4f', '2021-09-21 13:06:45.076+00', 'orientation_manager', '2021-09-21 11:51:37.295647+00', '9eee9fea-bf3e-4eb8-8f43-d9b7fd6fae76', NULL);
INSERT INTO public.notebook_member (id, notebook_id, account_id, last_visited_at, member_type, created_at, creator_id, invitation_sent_at) VALUES ('91dba199-109c-4312-93cb-bd99f579532b', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', 'a501db53-1b79-4a60-860b-5972bd184f98', NULL, 'no_referent', '2021-09-21 12:32:59.911757+00', NULL, NULL);
INSERT INTO public.notebook_member (id, notebook_id, account_id, last_visited_at, member_type, created_at, creator_id, invitation_sent_at) VALUES ('14c147d0-f94b-4708-be90-0227efc70db7', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '17434464-5f69-40cc-8172-40160958a33d', '2021-09-21 13:06:45.076+00', 'referent', '2021-09-21 11:51:37.295647+00', NULL, NULL);

INSERT INTO public.notebook_focus (id, theme, situations, creator_id, notebook_id, created_at, linked_to) VALUES ('a55d1dd2-2b09-4456-bcc5-1412695f684f', 'logement', '["Hébergé chez un tiers"]', '2addd10f-9bd3-4d37-b3c9-10a6e2c4be4f', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '2021-09-21 13:15:54.752334+00', 'cer');
INSERT INTO public.notebook_target (id, focus_id, target, creator_id, created_at) VALUES ('7bfa2130-fe72-418e-8486-000c171cb853', 'a55d1dd2-2b09-4456-bcc5-1412695f684f', 'Changer de logement', '2addd10f-9bd3-4d37-b3c9-10a6e2c4be4f', '2021-09-21 13:17:53.594417+00');
INSERT INTO public.notebook_action (id, action, target_id, status, creator_id, created_at) VALUES ('54c982ce-36f8-4124-a6eb-689f8f25a2e7', 'Demande SIAO', '7bfa2130-fe72-418e-8486-000c171cb853', 'in_progress', 'd0b8f314-5e83-4535-9360-60f29dcfb5c8', '2020-01-05 13:55:43.100609+00');
INSERT INTO public.notebook_action (id, action, target_id, status, creator_id, created_at) VALUES ('59c7f3b7-ca19-4408-bcb8-9b4fa8a07282', 'Demande de logement social', '7bfa2130-fe72-418e-8486-000c171cb853', 'in_progress', '17434464-5f69-40cc-8172-40160958a33d', '2020-07-01 15:13:59.820331+00');

INSERT INTO public.notebook_focus (id, theme, situations, creator_id, notebook_id, created_at, linked_to) VALUES ('19911b5c-e614-450d-bbeb-eba0d8ae1e18', 'difficulte_administrative', '["Besoin d''être guidé dans le cadre d''un accès aux droits"]', '17434464-5f69-40cc-8172-40160958a33d', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '2021-09-21 13:26:42.939011+00', 'cer');
INSERT INTO public.notebook_target (id, focus_id, target, creator_id, created_at) VALUES ('2ce91415-b3bb-404f-adec-bbc6ea5af464', '19911b5c-e614-450d-bbeb-eba0d8ae1e18', 'Travailler l’accès aux droits', '17434464-5f69-40cc-8172-40160958a33d', '2021-09-21 14:55:12.797276+00');
INSERT INTO public.notebook_action (id, action, target_id, status, creator_id, created_at) VALUES ('9f7289e2-8abd-4ef8-bc3c-6b90be77ca63', 'Demande de CSS', '2ce91415-b3bb-404f-adec-bbc6ea5af464', 'in_progress', '17434464-5f69-40cc-8172-40160958a33d', '2020-01-05 15:08:20.139704+00');

INSERT INTO public.notebook_focus (id, theme, situations, creator_id, notebook_id, created_at, linked_to) VALUES ('d4bf4811-bbce-4f99-8b57-358187653b59', 'emploi', '["Prêt  à suivre une formation"]', '17434464-5f69-40cc-8172-40160958a33d', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '2021-09-21 13:33:16.96523+00', 'cer');
INSERT INTO public.notebook_target (id, focus_id, target, creator_id, created_at) VALUES ('0dac08fa-c103-438d-bf98-6b725a892e2d', 'd4bf4811-bbce-4f99-8b57-358187653b59', 'Définir ou confirmer un projet professionnel', '17434464-5f69-40cc-8172-40160958a33d', '2021-09-21 13:34:17.493745+00');
INSERT INTO public.notebook_action (id, action, target_id, status, creator_id, created_at) VALUES ('9dec37fe-a454-4184-a8ee-ddd905d3f794', 'Prépa-Compétences', '0dac08fa-c103-438d-bf98-6b725a892e2d', 'in_progress', '17434464-5f69-40cc-8172-40160958a33d', '2020-09-01 15:11:37.55336+00');
INSERT INTO public.notebook_target (id, focus_id, target, creator_id, created_at) VALUES ('8445b9bc-e523-4ff3-91dd-fd11bb413ae5', 'd4bf4811-bbce-4f99-8b57-358187653b59', 'Accéder à l’emploi', '17434464-5f69-40cc-8172-40160958a33d', '2021-09-21 13:35:11.636378+00');
INSERT INTO public.notebook_action (id, action, target_id, status, creator_id, created_at) VALUES ('3d0dc2b5-3dc8-4f5d-9e82-661299b3d522', 'Avoir un pass IAE validé', '8445b9bc-e523-4ff3-91dd-fd11bb413ae5', 'in_progress', '17434464-5f69-40cc-8172-40160958a33d', '2021-06-08 13:42:53.239372+00');
INSERT INTO public.notebook_action (id, action, target_id, status, creator_id, created_at) VALUES ('3d0dc2b5-3dc8-4f5d-9e82-661299b3d533', 'Formation certifiante', '8445b9bc-e523-4ff3-91dd-fd11bb413ae5', 'in_progress', 'a501db53-1b79-4a60-860b-5972bd184f98', '2021-07-01 15:34:53.239372+00');
INSERT INTO public.notebook_action (id, action, target_id, status, creator_id, created_at) VALUES ('67063818-486f-4f95-9beb-53a5a916e74b', 'Orientation vers une SIAE', '8445b9bc-e523-4ff3-91dd-fd11bb413ae5', 'in_progress', '2addd10f-9bd3-4d37-b3c9-10a6e2c4be4f', '2020-11-01 13:40:07.137635+00');
INSERT INTO public.notebook_target (id, focus_id, target, creator_id, created_at) VALUES ('d93cbf83-74f0-4992-ac33-dd563558bc05', 'd4bf4811-bbce-4f99-8b57-358187653b59', 'Accéder à l’emploi 2', '17434464-5f69-40cc-8172-40160958a33d', '2021-09-21 13:35:11.636378+00');

INSERT INTO public.notebook_appointment (id, notebook_id, account_id, date, status, created_at, updated_at) VALUES ('cd17a20c-403c-4dba-9e5a-bc691dcd3735', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '17434464-5f69-40cc-8172-40160958a33d', '2021-09-21 13:15:00.000+00', 'present', '2021-09-21 13:15:00.000+00', '2021-09-21 13:06:45.076+00');
INSERT INTO public.notebook_appointment (id, notebook_id, account_id, date, status, created_at, updated_at) VALUES ('5ab6baed-fa1f-4bc2-ab93-be3c07f632f7', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', 'd0b8f314-5e83-4535-9360-60f29dcfb5c8', '2021-09-11 13:15:00.000+00', 'absent', '2021-09-11 13:15:00.000+00', '2021-09-11 13:06:45.076+00');
INSERT INTO public.notebook_appointment (id, notebook_id, account_id, date, status, created_at, updated_at) VALUES ('4d1fff01-463b-4c1b-94e2-f3588a6cbf88', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '17434464-5f69-40cc-8172-40160958a33d', '2021-08-11 13:15:00.000+00', 'pending', '2021-08-11 13:15:00.000+00', '2021-08-11 13:06:45.076+00');

-- Marc Saintpa
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('f3e4dd0f-7746-44f6-a5f1-29059a88aa5a', 'marc@yahoo.fr', 'Marc', 'Saintpa', NULL, NULL, NULL, NULL, NULL, NULL, '0600000000', '1982-02-01', 'Reims', 'c5c3a933-6f4a-4b2b-aa49-7a816eaef16b', '2022-03-30 09:02:50.597956+00', '2022-03-30 09:02:50.597956+00', NULL);
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('3fc2023c-fe66-46cc-8775-d70537436a0c', 'f3e4dd0f-7746-44f6-a5f1-29059a88aa5a', 'c0b8aee3-c061-4023-b57e-92880627d589', 'done', '{}', '2022-03-24 17:22:38.219997+00', '2022-03-24 17:22:38.219997+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('b7e43c7c-7c3e-464b-80de-f4926d4bb1e0', 'f3e4dd0f-7746-44f6-a5f1-29059a88aa5a', '2022-03-30 09:17:52.320373+00', NULL, false, false, false, false, 'between_10_20', 'NV4', '2021-09-22', 'cer', '2020-01-05', 'iae', '2022-03-30 09:17:52.320373+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('35b20f9d-f593-4062-8ceb-f97d5aba7c97', 'b7e43c7c-7c3e-464b-80de-f4926d4bb1e0', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Aide à domicile (K1304)'));

-- Etta Bullock
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('3c1a9fdf-a231-4659-9a91-630ff12c5774', 'etta.bullock@aute.com', 'Bullock', 'Etta', '2089564M', '7670083', '88619', 'Gila', '778 Tech Place', NULL, '0543607681', '1973-07-21', 'Gratton', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:36.22194+00', '2022-03-30 09:29:36.22194+00', 'de4ee6bf-2586-4831-9f22-484cda7b1b65');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('3ddbf920-20db-4a7c-8c6e-8ae080c5ce4e', '3c1a9fdf-a231-4659-9a91-630ff12c5774', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:29:36.22194+00', '2022-03-30 09:29:36.22194+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('24e335cb-4e2b-481b-84b7-617d77f60f56', '3c1a9fdf-a231-4659-9a91-630ff12c5774', '2022-03-30 09:29:36.22194+00', NULL, false, false, true, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:36.22194+00');
INSERT INTO public.notebook_member (id, notebook_id, account_id, last_visited_at, member_type, created_at, creator_id, invitation_sent_at) VALUES ('f96735c3-dcbd-4115-88e0-b1364ff193e3', '24e335cb-4e2b-481b-84b7-617d77f60f56', '2addd10f-9bd3-4d37-b3c9-10a6e2c4be4f', '2021-09-21 13:06:45.076+00', 'orientation_manager', '2021-09-21 11:51:37.295647+00', '9eee9fea-bf3e-4eb8-8f43-d9b7fd6fae76', NULL);
INSERT INTO public.orientation_request (id, beneficiary_id, requestor_account_id, requested_orientation_type_id, status, reason, created_at) values ('eabf6fda-26b5-4aeb-8179-6050a826cde6', '3c1a9fdf-a231-4659-9a91-630ff12c5774', '2addd10f-9bd3-4d37-b3c9-10a6e2c4be4f', 'social', 'pending', 'Ceci est la raison pour laquelle on souhaite changer l’orientation', '2022-09-01 14:00:00.0000+00');

-- Diane Rose
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('c0b14f09-9dab-425f-addc-2e4b44003632', 'diane.rose@labore.fr', 'Rose', 'Diane', '9551393K', '1698949', '68920', 'Martinsville', '291 Winthrop Street', NULL, '0793099148', '1980-09-25', 'Accoville', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:36.734947+00', '2022-03-30 09:29:36.734947+00', '2c058e83-8869-4f73-bd6c-1c9dd8061df8');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('f244fde3-7825-4548-a43e-5fa80c5a96b3', 'c0b14f09-9dab-425f-addc-2e4b44003632', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:29:36.734947+00', '2022-03-30 09:29:36.734947+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('879a25f0-e10c-4081-bde3-4aef77826d1a', 'c0b14f09-9dab-425f-addc-2e4b44003632', '2022-03-30 09:29:36.734947+00', NULL, true, false, true, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:36.734947+00');
INSERT INTO public.notebook_member (id, notebook_id, account_id, last_visited_at, member_type, created_at, creator_id, invitation_sent_at) VALUES ('1aad3d7a-dd76-4097-a02e-875fc2e6636f', '879a25f0-e10c-4081-bde3-4aef77826d1a', 'd0b8f314-5e83-4535-9360-60f29dcfb5c8', '2021-09-21 13:06:45.076+00', 'referent', '2021-09-21 11:51:37.295647+00', NULL, NULL);
INSERT INTO public.orientation_request (id, beneficiary_id, requestor_account_id, requested_orientation_type_id, status, reason, created_at, decided_orientation_type_id, decided_at) VALUES ('fbed211b-16fb-4315-8be6-a77208a6b210', 'c0b14f09-9dab-425f-addc-2e4b44003632', 'd0b8f314-5e83-4535-9360-60f29dcfb5c8', 'social', 'denied', 'La raison', '2022-09-01 14:00:00.0000+00', 'pro', '2022-09-03 16:00:00.0000+00');

-- Janie Herring
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('e2a8c7dc-054d-4ce3-9a78-0419642e5538', 'janie.herring@velit.net', 'Herring', 'Janie', '1250286B', '5625651', '75450', 'Groveville', '933 Broome Street', NULL, '0214793479', '2002-02-19', 'Staples', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:37.238863+00', '2022-03-30 09:29:37.238863+00', 'a88f6439-e5f9-4174-9e30-fd9902b4b07f');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('ae0832d4-4d80-4e83-a54b-91b8376b659a', 'e2a8c7dc-054d-4ce3-9a78-0419642e5538', '8b71184c-6479-4440-aa89-15da704cc792', 'pending', '{}', '2022-03-30 09:29:37.238863+00', '2022-03-30 09:29:37.238863+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('6df5ad80-6b22-4620-b6ea-137d5d74089e', 'e2a8c7dc-054d-4ce3-9a78-0419642e5538', '2022-03-30 09:29:37.238863+00', NULL, true, true, true, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:37.238863+00');
INSERT INTO public.notebook_member (id, notebook_id, account_id, last_visited_at, member_type, created_at, creator_id, invitation_sent_at) VALUES ('08fa32ed-e208-4d4c-aa5d-bc92b4c80173', '6df5ad80-6b22-4620-b6ea-137d5d74089e', 'd0b8f314-5e83-4535-9360-60f29dcfb5c8', '2021-09-21 13:06:45.076+00', 'referent', '2021-09-21 11:51:37.295647+00', NULL, NULL);
INSERT INTO public.orientation_request (id, beneficiary_id, requestor_account_id, requested_orientation_type_id, status, reason, created_at, decided_orientation_type_id, decided_at) VALUES ('84f40134-f2a2-45ae-993a-a9d0d1077f31', 'e2a8c7dc-054d-4ce3-9a78-0419642e5538', '2addd10f-9bd3-4d37-b3c9-10a6e2c4be4f', 'social', 'accepted', 'Une bonne raison', '2022-09-01 14:00:00.0000+00', 'social', '2022-09-03 15:00:00.0000+00');

-- Ross Bryant
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('3de52a60-c09f-43e4-ae2a-6fe82f0ce232', 'ross.bryant@est.net', 'Bryant', 'Ross', '7307652T', '4175519', '97987', 'Talpa', '372 Columbia Place', NULL, '0722109155', '1960-04-22', 'Winchester', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:37.734572+00', '2022-03-30 09:29:37.734572+00', 'cc7f8be9-e41d-4c5c-9ce3-c8d10671afa1');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('50e5785a-9c63-473a-b57f-bed22601016b', '3de52a60-c09f-43e4-ae2a-6fe82f0ce232', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:29:37.734572+00', '2022-03-30 09:29:37.734572+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('fb1c7e3b-a1ac-4b15-82cd-8306a405a3a1', '3de52a60-c09f-43e4-ae2a-6fe82f0ce232', '2022-03-30 09:29:37.734572+00', NULL, false, true, false, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:37.734572+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('3c311b20-98f5-4d7c-8394-a125cf1f0a1e', 'fb1c7e3b-a1ac-4b15-82cd-8306a405a3a1', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Formateur / Formatrice (K2111)'));

-- Audra Rush
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('c4353350-388c-422e-9722-a5adfb20b478', 'audra.rush@esse.com', 'Rush', 'Audra', '1559515L', '0389294', '33950', 'Lorraine', '809 Coffey Street', NULL, '0202232543', '1998-12-22', 'Loretto', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:38.247366+00', '2022-03-30 09:29:38.247366+00', '6dd8c68c-57cc-4b2e-a784-6e8edb71c715');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('b051bff8-00dc-48ac-9b65-dea696bae5e0', 'c4353350-388c-422e-9722-a5adfb20b478', '8b71184c-6479-4440-aa89-15da704cc792', 'pending', '{}', '2022-03-30 09:29:38.247366+00', '2022-03-30 09:29:38.247366+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('985abb14-c64e-4d17-b2be-3784d18fbc23', 'c4353350-388c-422e-9722-a5adfb20b478', '2022-03-30 09:29:38.247366+00', NULL, false, true, false, true, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:38.247366+00');

-- Lindsay Aguilar
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('5e4bb95d-3122-41d2-8476-64691968ffa6', 'lindsay.aguilar@nisi.fr', 'Aguilar', 'Lindsay', '7245198N', '4793290', '40181', 'Wiscon', '170 Division Place', NULL, '0752655960', '1996-06-22', 'Eggertsville', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:38.747557+00', '2022-03-30 09:29:38.747557+00', '38305a47-52b5-4e1a-8f24-5956b9859f96');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('12a69a95-e567-49be-937b-87b6846837be', '5e4bb95d-3122-41d2-8476-64691968ffa6', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:29:38.747557+00', '2022-03-30 09:29:38.747557+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('79bc73e3-45d7-467f-ae3e-d395e338386c', '5e4bb95d-3122-41d2-8476-64691968ffa6', '2022-03-30 09:29:38.747557+00', NULL, true, true, true, true, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:38.747557+00');
INSERT INTO public.notebook_focus (id, theme, situations, creator_id, notebook_id, created_at, linked_to) VALUES ('5179594a-ccc1-4f1d-90ce-3bd4eeed1160', 'formation', '["Prêt à suivre une formation"]', '2addd10f-9bd3-4d37-b3c9-10a6e2c4be4f', '79bc73e3-45d7-467f-ae3e-d395e338386c', '2021-09-21 13:15:54.752334+00', 'cer');
INSERT INTO public.notebook_target (id, focus_id, target, creator_id, created_at) VALUES ('fc92ff8a-c9db-4016-87b2-73095d463603', '5179594a-ccc1-4f1d-90ce-3bd4eeed1160', 'Se former', '2addd10f-9bd3-4d37-b3c9-10a6e2c4be4f', '2021-09-21 13:17:53.594417+00');

-- Dee Jennings
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('695b2792-93ad-4819-954f-b022006bd92e', 'dee.jennings@nostrud.net', 'Jennings', 'Dee', '7422916K', '9537092', '53910', 'Bedias', '378 Devon Avenue', NULL, '0252451391', '1974-01-08', 'Bradenville', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:39.257085+00', '2022-03-30 09:29:39.257085+00', 'a6941b81-382e-4fe9-9c1b-07aae326b445');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('9b5ebf66-1f53-4001-9720-ed826fceefa9', '695b2792-93ad-4819-954f-b022006bd92e', '8b71184c-6479-4440-aa89-15da704cc792', 'pending', '{}', '2022-03-30 09:29:39.257085+00', '2022-03-30 09:29:39.257085+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('798d152c-c812-4708-a2dc-5582f07c71d2', '695b2792-93ad-4819-954f-b022006bd92e', '2022-03-30 09:29:39.257085+00', NULL, true, true, false, true, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:39.257085+00');
INSERT INTO public.notebook_info (notebook_id, orientation, need_orientation) VALUES ('798d152c-c812-4708-a2dc-5582f07c71d2', 'sociopro', false);
INSERT INTO public.notebook_member (id, notebook_id, account_id, last_visited_at, member_type, active) VALUES ('7e44c14e-29de-47d3-aaf2-8fac7c281359', '798d152c-c812-4708-a2dc-5582f07c71d2', '521a2983-17e2-43a9-abf6-7ed9f93cf7f9', '2021-09-21 13:06:45.076+00', 'referent', true);
INSERT INTO public.orientation_request (id, beneficiary_id, requestor_account_id, requested_orientation_type_id, status, reason, created_at) values ('1f696530-984c-4f92-be13-c477097b02b7', '695b2792-93ad-4819-954f-b022006bd92e', '2addd10f-9bd3-4d37-b3c9-10a6e2c4be4f', 'social', 'pending', 'Ceci est la raison pour laquelle on souhaite changer l’orientation', '2022-09-01 14:00:00.0000+00');

-- Maricela Valenzuela
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('69719e18-36a0-4e93-8d85-c6e592161041', 'maricela.valenzuela@ut.net', 'Valenzuela', 'Maricela', '4212139G', '5639232', '35524', 'Finzel', '789 Apollo Street', NULL, '0216987660', '1987-10-07', 'Twilight', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:39.757345+00', '2022-03-30 09:29:39.757345+00', '3a1ccf62-490f-4341-a4c7-9ef96b62f7c9');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('b29147a2-e572-494f-8464-1202ee20549b', '69719e18-36a0-4e93-8d85-c6e592161041', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:29:39.757345+00', '2022-03-30 09:29:39.757345+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('d64a615e-6332-4c30-b3ac-341ff57a779b', '69719e18-36a0-4e93-8d85-c6e592161041', '2022-03-30 09:29:39.757345+00', NULL, true, false, false, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:39.757345+00');
INSERT INTO public.orientation_request (id, beneficiary_id, requestor_account_id, requested_orientation_type_id, status, reason, created_at)
values ('34cf537f-dbf2-4ffd-8adc-72bdebd65adf', '69719e18-36a0-4e93-8d85-c6e592161041', '2addd10f-9bd3-4d37-b3c9-10a6e2c4be4f', 'social', 'pending', NULL, '2022-09-01 14:00:00.0000+00');
INSERT INTO public.notebook_info (notebook_id, orientation, need_orientation) VALUES ('d64a615e-6332-4c30-b3ac-341ff57a779b', 'pro', false);

-- Bolton Gônzalez
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('2f5fdd18-823c-45c7-80de-a2419070fb15', 'bolton.gonzalez@deserunt.com', 'Gônzalez', 'Bolton', '2108141P', '5815707', '54212', 'Belva', '783 Huron Street', NULL, '0746341282', '1994-09-22', 'Nadine', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:40.261111+00', '2022-03-30 09:29:40.261111+00', '96bbd44c-ed58-448c-91ba-e58cc069ac82');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('bf1140e5-6ecc-4b03-a1b9-521ea286f380', '2f5fdd18-823c-45c7-80de-a2419070fb15', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:29:40.261111+00', '2022-03-30 09:29:40.261111+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('e8d908cd-a9ef-4003-9488-d268908b599d', '2f5fdd18-823c-45c7-80de-a2419070fb15', '2022-03-30 09:29:40.261111+00', NULL, false, false, true, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:40.261111+00');

-- Oconnor Carlson
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('df791447-246b-4370-aa32-4258393cd78e', 'oconnor.carlson@aliqua.fr', 'Carlson', 'Oconnor', '4491138N', '1531473', '50754', 'Dyckesville', '343 Carroll Street', NULL, '0532969525', '1988-03-08', 'Sexton', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:40.76801+00', '2022-03-30 09:29:40.76801+00', 'a94b41af-4d54-4173-b1c2-68ed7a2f25e3');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('7c21cfba-f8d5-4dfb-a6cc-1eca9176a6b0', 'df791447-246b-4370-aa32-4258393cd78e', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:29:40.76801+00', '2022-03-30 09:29:40.76801+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('fb0e54ce-5cb8-460c-952c-9256d4c6102e', 'df791447-246b-4370-aa32-4258393cd78e', '2022-03-30 09:29:40.76801+00', NULL, false, true, false, true, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:40.76801+00');
INSERT INTO public.orientation_request (id, beneficiary_id, requestor_account_id, requested_orientation_type_id, status, reason, created_at) values ('521c419c-d8a0-450d-941b-30bc3eb9909c', 'df791447-246b-4370-aa32-4258393cd78e', '2addd10f-9bd3-4d37-b3c9-10a6e2c4be4f', 'pro', 'pending', 'Un accompagnement pro sera plus adapté.', '2022-09-01 14:00:00.0000+00');
INSERT INTO public.notebook_info (notebook_id, orientation, need_orientation) VALUES ('fb0e54ce-5cb8-460c-952c-9256d4c6102e', 'social', false);

-- Laura Lindsay
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('db285eb8-ac5c-49fc-9daa-2d823738a392', 'laura.lindsay@id.com', 'Lindsay', 'Laura', '2777850A', '6059263', '74488', 'Brutus', '487 Bleecker Street', NULL, '0365333729', '1981-07-06', 'Weedville', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:41.274678+00', '2022-03-30 09:29:41.274678+00', 'd233c0d5-3e81-4e73-87d7-ee773346500c');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('8c23fe63-a39d-458e-944f-1e08fc557c19', 'db285eb8-ac5c-49fc-9daa-2d823738a392', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:29:41.274678+00', '2022-03-30 09:29:41.274678+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('b76fca49-ff9a-49b6-9a83-ee656730297a', 'db285eb8-ac5c-49fc-9daa-2d823738a392', '2022-03-30 09:29:41.274678+00', NULL, true, true, true, true, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:41.274678+00');
INSERT INTO public.orientation_request (id, beneficiary_id, requestor_account_id, requested_orientation_type_id, status, reason, created_at) values ('51c33ea2-c5cc-4dc0-92b6-639b837c11d6', 'db285eb8-ac5c-49fc-9daa-2d823738a392', '2addd10f-9bd3-4d37-b3c9-10a6e2c4be4f', 'sociopro', 'pending', NULL, '2022-09-01 14:00:00.0000+00');
INSERT INTO public.notebook_info (notebook_id, orientation, need_orientation) VALUES ('b76fca49-ff9a-49b6-9a83-ee656730297a', 'pro', false);

-- Winnie Gallegos
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('e5e6827e-21fb-4f0c-987c-b68052788846', 'winnie.gallegos@ut.com', 'Gallegos', 'Winnie', '5725997H', '0630728', '24659', 'Waterloo', '827 Ridgecrest Terrace', NULL, '0347347353', '1969-11-08', 'Lacomb', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:42.413856+00', '2022-03-30 09:29:42.413856+00', 'fdd942fd-bfb4-42cb-8742-20ff69aaab09');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('21030727-791f-4694-a69a-2e2ab08db0f1', 'e5e6827e-21fb-4f0c-987c-b68052788846', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:29:42.413856+00', '2022-03-30 09:29:42.413856+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('2faa4460-feaf-48dc-8adf-bcb224b1554f', 'e5e6827e-21fb-4f0c-987c-b68052788846', '2022-03-30 09:29:42.413856+00', NULL, false, true, false, true, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:42.413856+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('f8d3141a-fb87-4076-8e48-dbb93f4e3ccf', '2faa4460-feaf-48dc-8adf-bcb224b1554f', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Aide à domicile (K1304)'));

-- Dominique Dunlap
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('0efeda64-b8f1-4c2e-b261-50be5cd39dcb', 'dominique.dunlap@proident.fr', 'Dunlap', 'Dominique', '6830929M', '5733084', '00564', 'Allensworth', '996 Surf Avenue', NULL, '0602531370', '1976-03-24', 'Draper', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:43.414755+00', '2022-03-30 09:29:43.414755+00', '7aeedc53-2aeb-45fa-a517-f8d562dd5f4b');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('46ac3e72-ffc8-40f1-a6a5-5038c58a5098', '0efeda64-b8f1-4c2e-b261-50be5cd39dcb', '8b71184c-6479-4440-aa89-15da704cc792', 'pending', '{}', '2022-03-30 09:29:43.414755+00', '2022-03-30 09:29:43.414755+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('0462d5bc-ae09-4320-972e-6e00f6fa5373', '0efeda64-b8f1-4c2e-b261-50be5cd39dcb', '2022-03-30 09:29:43.414755+00', NULL, true, false, true, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:43.414755+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('965401db-6bf8-468e-bbfb-7fc3d0e0fdd7', '0462d5bc-ae09-4320-972e-6e00f6fa5373', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Conducteur / Conductrice d''engins d''exploitation agricole (A1101)'));

-- Hilary Townsend
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('2603e9a7-f31d-4a57-a15c-4f2cbd7af82a', 'hilary.townsend@ad.net', 'Townsend', 'Hilary', '0663052W', '9139889', '31231', 'Wescosville', '596 Seacoast Terrace', NULL, '0528496351', '1977-03-12', 'Cecilia', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:44.419056+00', '2022-03-30 09:29:44.419056+00', '91e54184-1564-4e6a-8cb3-ff10e8b97c45');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('0d706d35-2159-4b39-8c6a-cf176127423f', '2603e9a7-f31d-4a57-a15c-4f2cbd7af82a', '8b71184c-6479-4440-aa89-15da704cc792', 'pending', '{}', '2022-03-30 09:29:44.419056+00', '2022-03-30 09:29:44.419056+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('3ec9f403-0bf8-4612-a3c6-70c7d013dbc4', '2603e9a7-f31d-4a57-a15c-4f2cbd7af82a', '2022-03-30 09:29:44.419056+00', NULL, true, false, true, true, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:44.419056+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('c3b97766-7fbc-4139-ac59-ee7127db1d9b', '3ec9f403-0bf8-4612-a3c6-70c7d013dbc4', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Pontier élingueur / Pontière élingueuse (N1104)'));

-- Shaw Crawford
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('a3592348-f1ff-4092-b3bb-1ec06440b64e', 'shaw.crawford@occaecat.com', 'Crawford', 'Shaw', '8762973F', '1141040', '54191', 'Defiance', '209 Williams Court', NULL, '0356688847', '1969-11-26', 'Bainbridge', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:45.419791+00', '2022-03-30 09:29:45.419791+00', '46b81160-485c-4f69-8c45-fb26dafef1d6');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('2f062f42-4299-497c-95b8-81236e8fef97', 'a3592348-f1ff-4092-b3bb-1ec06440b64e', '8b71184c-6479-4440-aa89-15da704cc792', 'pending', '{}', '2022-03-30 09:29:45.419791+00', '2022-03-30 09:29:45.419791+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('b43c7487-f420-4f39-874d-7febbd934933', 'a3592348-f1ff-4092-b3bb-1ec06440b64e', '2022-03-30 09:29:45.419791+00', NULL, false, true, true, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:45.419791+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('299d9bd4-603a-4997-874b-ed6e268296d9', 'b43c7487-f420-4f39-874d-7febbd934933', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Aide à domicile (K1304)'));

-- Katrina Beach
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('0dca2451-0ca3-448c-a320-0e822511fa7a', 'katrina.beach@magna.com', 'Beach', 'Katrina', '8459267A', '3884245', '56336', 'Riegelwood', '513 Hemlock Street', NULL, '0514678546', '2002-03-01', 'Maplewood', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:46.425676+00', '2022-03-30 09:29:46.425676+00', '330713b6-54bc-4d70-a92d-3e905dc507ea');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('5c411967-9d8b-4480-b8d4-2c3e15470117', '0dca2451-0ca3-448c-a320-0e822511fa7a', '8b71184c-6479-4440-aa89-15da704cc792', 'pending', '{}', '2022-03-30 09:29:46.425676+00', '2022-03-30 09:29:46.425676+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('7262db31-bd98-436c-a690-f2a717085c86', '0dca2451-0ca3-448c-a320-0e822511fa7a', '2022-03-30 09:29:46.425676+00', NULL, false, true, false, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:46.425676+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('d495bac1-4780-4abf-a4f8-41d9c6a9354c', '7262db31-bd98-436c-a690-f2a717085c86', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Formateur / Formatrice (K2111)'));
INSERT INTO public.notebook_member (id, notebook_id, account_id, last_visited_at, member_type, active) VALUES ('d68fa53a-2241-42a4-95a0-a26901924741', '7262db31-bd98-436c-a690-f2a717085c86', 'a501db53-1b79-4a60-860b-5972bd184f98', '2021-09-21 13:06:45.076+00', 'referent', false);
INSERT INTO public.notebook_member (id, notebook_id, account_id, last_visited_at, member_type, active) VALUES ('1b1c7007-6300-42ec-bb62-230eb59fabaa', '7262db31-bd98-436c-a690-f2a717085c86', 'd0b8f314-5e83-4535-9360-60f29dcfb5c8', '2021-09-21 13:06:45.076+00', 'no_referent', true);

-- Reilly Craig
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('da7da91b-f31d-4e70-867e-d4b0d3b794af', 'reilly.craig@id.fr', 'Craig', 'Reilly', '9384511A', '6057176', '70798', 'Singer', '841 Beayer Place', NULL, '0226179387', '1984-03-04', 'Deseret', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:47.416592+00', '2022-03-30 09:29:47.416592+00', '42949a08-ce5f-4463-90ca-0c7d83a4ae32');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('385881d0-29df-4b7a-96ef-b8a725f6fac2', 'da7da91b-f31d-4e70-867e-d4b0d3b794af', 'c0b8aee3-c061-4023-b57e-92880627d589', 'pending', '{}', '2022-03-30 09:29:47.416592+00', '2022-03-30 09:29:47.416592+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('c87a9380-6b94-409d-9e0d-14ce5c46047e', 'da7da91b-f31d-4e70-867e-d4b0d3b794af', '2022-03-30 09:29:47.416592+00', NULL, true, true, false, true, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:47.416592+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('107aab8e-0bde-45f9-86f1-12b23874849a', 'c87a9380-6b94-409d-9e0d-14ce5c46047e', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Pontier élingueur / Pontière élingueuse (N1104)'));

-- Serrano Reese
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('c727865f-749a-44f5-969a-bac4b5971a58', 'serrano.reese@veniam.net', 'Reese', 'Serrano', '1819502C', '4726437', '90660', 'Wattsville', '613 Java Street', NULL, '0427643584', '1976-12-10', 'Belvoir', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:48.424798+00', '2022-03-30 09:29:48.424798+00', '197fc0b1-6905-422d-830f-e9d920bd6bd1');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('36e17d36-e6a2-4503-a3ac-219746d21981', 'c727865f-749a-44f5-969a-bac4b5971a58', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:29:48.424798+00', '2022-03-30 09:29:48.424798+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('357cc369-6a65-42c1-a4ea-82f240ab5228', 'c727865f-749a-44f5-969a-bac4b5971a58', '2022-03-30 09:29:48.424798+00', NULL, false, false, false, true, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:48.424798+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('0d3a7efd-0e3b-4ca1-b9f3-073efbbcd43d', '357cc369-6a65-42c1-a4ea-82f240ab5228', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Conducteur / Conductrice d''engins d''exploitation agricole (A1101)'));

-- Cherie Matthews
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('68e96d69-c84c-4226-8a48-763f3917f5ea', 'cherie.mathews@quis.fr', 'Mathews', 'Cherie', '6924088B', '6332214', '22485', 'Celeryville', '146 Crystal Street', NULL, '0181156804', '1970-01-22', 'Faxon', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:49.426152+00', '2022-03-30 09:29:49.426152+00', 'ed7677e0-fb0a-4def-8afc-2d55e4780e00');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('5c9a3e07-5257-4b32-9b36-92785abf3a74', '68e96d69-c84c-4226-8a48-763f3917f5ea', '8b71184c-6479-4440-aa89-15da704cc792', 'pending', '{}', '2022-03-30 09:29:49.426152+00', '2022-03-30 09:29:49.426152+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('ce0c6957-dbe2-4232-a2b6-afa5e3a9e503', '68e96d69-c84c-4226-8a48-763f3917f5ea', '2022-03-30 09:29:49.426152+00', NULL, true, true, true, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:49.426152+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('f6817b3e-2874-44e7-87b5-9fbae4e52db3', 'ce0c6957-dbe2-4232-a2b6-afa5e3a9e503', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Aide à domicile (K1304)'));

-- Hendrix Dorsey
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('c09d2326-c37c-40ee-8b49-71eeb67c1871', 'hendrix.dorsey@nulla.com', 'Dorsey', 'Hendrix', '5086718E', '5765900', '97799', 'Bellfountain', '772 Linden Street', NULL, '0486491164', '1976-12-18', 'Lookingglass', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:50.430904+00', '2022-03-30 09:29:50.430904+00', '56a02598-2349-4e71-b38d-95b3ed392399');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('89985440-84a5-43e6-bc8c-0a3da818fabc', 'c09d2326-c37c-40ee-8b49-71eeb67c1871', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:29:50.430904+00', '2022-03-30 09:29:50.430904+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('223a560c-f711-4a8e-b47f-d6a66b0aef61', 'c09d2326-c37c-40ee-8b49-71eeb67c1871', '2022-03-30 09:29:50.430904+00', NULL, false, false, false, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:50.430904+00');

-- Gilbert Stevenson
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('0ab904b0-b3c2-46dd-be66-07248a09cc14', 'gilbert.stevenson@ad.com', 'Stevenson', 'Gilbert', '4380699F', '5951491', '20026', 'Ogema', '740 Hampton Place', NULL, '0510803558', '2000-04-17', 'Crawfordsville', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:51.432478+00', '2022-03-30 09:29:51.432478+00', 'cd4f4aac-7441-4f4d-a527-02ed7b88c4c5');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('29ce3fc8-bea2-435d-bdc5-db1eb835568a', '0ab904b0-b3c2-46dd-be66-07248a09cc14', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:29:51.432478+00', '2022-03-30 09:29:51.432478+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('d0e9e2e3-2ef8-4dd4-8196-7f847d17ea72', '0ab904b0-b3c2-46dd-be66-07248a09cc14', '2022-03-30 09:29:51.432478+00', NULL, true, false, true, true, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:51.432478+00');

-- Rhonda Nieves
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('33864a98-0365-4d34-bf39-d3f2cb29cad3', 'rhonda.nieves@sunt.fr', 'Nieves', 'Rhonda', '1965191H', '2416762', '91891', 'Haena', '265 Coleman Street', NULL, '0570421456', '1988-10-14', 'Day', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:52.437378+00', '2022-03-30 09:29:52.437378+00', 'f2c712f8-c793-4ae6-8bdd-d7848fabb7d8');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('ce21ffea-a4d3-41b6-b684-144945dac08a', '33864a98-0365-4d34-bf39-d3f2cb29cad3', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:29:52.437378+00', '2022-03-30 09:29:52.437378+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('4917b807-55d2-45f0-9031-6ce17a0cb999', '33864a98-0365-4d34-bf39-d3f2cb29cad3', '2022-03-30 09:29:52.437378+00', NULL, false, true, false, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:52.437378+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('3c52a4ed-5a8a-4f2c-96c9-488c9682c5aa', '4917b807-55d2-45f0-9031-6ce17a0cb999', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Formateur / Formatrice (K2111)'));

-- Marquez Deleon
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('55e4eb44-9623-49e6-8c57-f0ee67418c75', 'marquez.deleon@ullamco.com', 'Deleon', 'Marquez', '8667836O', '8383523', '33751', 'Leroy', '913 Seton Place', NULL, '0652485541', '1979-02-13', 'Klagetoh', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:53.437511+00', '2022-03-30 09:29:53.437511+00', '078739b7-237e-4cb0-9242-f5b9d5396cb0');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('20336d49-21be-4a08-a41b-00d954d28b08', '55e4eb44-9623-49e6-8c57-f0ee67418c75', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:29:53.437511+00', '2022-03-30 09:29:53.437511+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('29aa64b0-74cd-4f4e-a522-d1b420a2215e', '55e4eb44-9623-49e6-8c57-f0ee67418c75', '2022-03-30 09:29:53.437511+00', NULL, true, true, false, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:53.437511+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('7a5044b8-ac61-43b2-b212-8aaadad7d9cf', '29aa64b0-74cd-4f4e-a522-d1b420a2215e', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Pontier élingueur / Pontière élingueuse (N1104)'));

-- Hugues Solis
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('608376dc-43fe-41c4-a722-44600a063904', 'hughes.solis@dolor.net', 'Solis', 'Hughes', '6699304E', '0775236', '43000', 'Mansfield', '814 Beard Street', NULL, '0183158645', '1984-05-03', 'Dyckesville', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:54.442278+00', '2022-03-30 09:29:54.442278+00', 'f41cd093-f114-4e69-b8c5-126ae2f5f795');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('279754e3-c6a2-498d-a631-9d9ebaf3909c', '608376dc-43fe-41c4-a722-44600a063904', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:29:54.442278+00', '2022-03-30 09:29:54.442278+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('09108842-482e-4fea-9791-dafa7b2f9a17', '608376dc-43fe-41c4-a722-44600a063904', '2022-03-30 09:29:54.442278+00', NULL, true, true, false, true, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:54.442278+00');

-- Corinne Cash
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('3772d3a2-538b-4132-9884-ef40ccec8c51', 'corinne.cash@incididunt.com', 'Cash', 'Corinne', '5620750W', '4036536', '36479', 'Northchase', '658 Meserole Street', NULL, '0223857341', '1970-10-13', 'Cashtown', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:55.439331+00', '2022-03-30 09:29:55.439331+00', '172afacf-30ab-4934-b7e4-a6e0d496eac8');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('c98f8617-cfc3-4dc9-996c-2a0e582536c2', '3772d3a2-538b-4132-9884-ef40ccec8c51', '8b71184c-6479-4440-aa89-15da704cc792', 'pending', '{}', '2022-03-30 09:29:55.439331+00', '2022-03-30 09:29:55.439331+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('fb1f9810-f219-4555-9025-4126cb0684d6', '3772d3a2-538b-4132-9884-ef40ccec8c51', '2022-03-30 09:29:55.439331+00', NULL, false, true, false, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:55.439331+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('f54260de-e804-4985-98e0-27598618389f', 'fb1f9810-f219-4555-9025-4126cb0684d6', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Aide à domicile (K1304)'));

-- Mcclain Guy
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('3a0a49ea-7588-4db0-b109-00cee3d8f072', 'mcclain.guy@ut.fr', 'Guy', 'Mcclain', '7743265R', '7869945', '84979', 'Delshire', '213 Overbaugh Place', NULL, '0310499132', '1976-08-15', 'Blackgum', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:56.443532+00', '2022-03-30 09:29:56.443532+00', '881cbd4f-c03b-455a-aa03-fc99ac3b016b');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('be20525a-b949-4d45-b7de-6b92f31d39ca', '3a0a49ea-7588-4db0-b109-00cee3d8f072', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:29:56.443532+00', '2022-03-30 09:29:56.443532+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('ec7f3e94-fea2-4e4f-b4a0-05b3adc1aad7', '3a0a49ea-7588-4db0-b109-00cee3d8f072', '2022-03-30 09:29:56.443532+00', NULL, false, true, true, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:56.443532+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('de2cb598-669f-4af3-9359-0aeb69b4f53f', 'ec7f3e94-fea2-4e4f-b4a0-05b3adc1aad7', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Formateur / Formatrice (K2111)'));

--Katharine Chandler
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('136f0e72-bf4f-4a60-b902-e04979c4b384', 'katharine.chandler@aliqua.com', 'Chandler', 'Katharine', '7596831N', '1588771', '86640', 'Bergoo', '448 Downing Street', NULL, '0626767039', '1997-07-11', 'Stockdale', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:57.447762+00', '2022-03-30 09:29:57.447762+00', '6eef89c5-95a3-43b2-baf4-f6b717a8f511');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('77e130af-6e8d-4ff0-a7b4-3757ec4b0645', '136f0e72-bf4f-4a60-b902-e04979c4b384', '8b71184c-6479-4440-aa89-15da704cc792', 'pending', '{}', '2022-03-30 09:29:57.447762+00', '2022-03-30 09:29:57.447762+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('9d16f06c-531f-41c1-99c7-486c51a13b8d', '136f0e72-bf4f-4a60-b902-e04979c4b384', '2022-03-30 09:29:57.447762+00', NULL, true, true, false, true, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:57.447762+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('29a0e234-4db3-4abd-9fb1-9f62b2f24dcf', '9d16f06c-531f-41c1-99c7-486c51a13b8d', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Aide à domicile (K1304)'));

-- King Rosales
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('939e2ffb-1919-46ef-9b59-7ff7494c0b06', 'king.rosales@do.net', 'Rosales', 'King', '9242326K', '8500324', '31286', 'Tolu', '766 Elizabeth Place', NULL, '0133680927', '1975-01-25', 'Calvary', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:58.469144+00', '2022-03-30 09:29:58.469144+00', 'bd25c729-7759-453a-af4d-7a0179a7ee0c');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('dc332bbd-2b89-40d0-adb8-273be35263f9', '939e2ffb-1919-46ef-9b59-7ff7494c0b06', '8b71184c-6479-4440-aa89-15da704cc792', 'pending', '{}', '2022-03-30 09:29:58.469144+00', '2022-03-30 09:29:58.469144+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('ba91b8a9-fd4e-41ea-b78d-775af9d7a1d6', '939e2ffb-1919-46ef-9b59-7ff7494c0b06', '2022-03-30 09:29:58.469144+00', NULL, false, true, true, true, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:58.469144+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('3dde5382-5958-4606-9e19-354c3ee0c21d', 'ba91b8a9-fd4e-41ea-b78d-775af9d7a1d6', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Pontier élingueur / Pontière élingueuse (N1104)'));

-- Chasity Gentry
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('e001c505-71f6-49d8-8087-4600d7666513', 'chasity.gentry@esse.net', 'Gentry', 'Chasity', '2611912U', '4897557', '37953', 'Hollins', '257 Bay Street', NULL, '0205775959', '1972-01-26', 'Woodburn', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:29:59.466481+00', '2022-03-30 09:29:59.466481+00', 'bd2fef51-38d4-4b0d-9367-5c08346005ef');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('6158c033-68da-4475-8ab6-a1479ae7aeed', 'e001c505-71f6-49d8-8087-4600d7666513', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:29:59.466481+00', '2022-03-30 09:29:59.466481+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('abf512d3-3054-4d8c-aa17-1bf4b8e34356', 'e001c505-71f6-49d8-8087-4600d7666513', '2022-03-30 09:29:59.466481+00', NULL, false, false, false, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:29:59.466481+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('a4179c22-8477-4ad9-8a39-3cb863106461', 'abf512d3-3054-4d8c-aa17-1bf4b8e34356', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Conducteur / Conductrice d''engins d''exploitation agricole (A1101)'));

-- Bridges Kerr
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('edddcd87-fcb1-42a3-8dcd-91468629d54d', 'bridges.kerr@consequat.fr', 'Kerr', 'Bridges', '6030459A', '7980361', '65882', 'Sardis', '968 Cox Place', NULL, '0643079453', '1975-03-03', 'Salvo', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:30:00.460727+00', '2022-03-30 09:30:00.460727+00', '683b2f18-3a79-4a7b-885c-851a8e692ca1');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('4de288dd-9004-4a30-8056-44ca31dc2c60', 'edddcd87-fcb1-42a3-8dcd-91468629d54d', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:30:00.460727+00', '2022-03-30 09:30:00.460727+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('1c1cbb45-eae0-4d1d-a391-fe0577da122c', 'edddcd87-fcb1-42a3-8dcd-91468629d54d', '2022-03-30 09:30:00.460727+00', NULL, false, true, true, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:30:00.460727+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('bc121ba4-4271-4519-a660-686bba8c955f', '1c1cbb45-eae0-4d1d-a391-fe0577da122c', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Aide à domicile (K1304)'));

-- Steele Malone
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('c76514da-32ac-4c0c-8b22-2cb61d581bff', 'steele.malone@officia.fr', 'Malone', 'Steele', '7916849Q', '5068494', '73741', 'Wadsworth', '683 Saratoga Avenue', NULL, '0603897268', '2002-06-16', 'Hebron', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:30:01.462909+00', '2022-03-30 09:30:01.462909+00', '7be969c7-692d-4612-a1cd-702da885f117');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('9ecf3942-6967-4bd8-b847-c3dcc35d8f4c', 'c76514da-32ac-4c0c-8b22-2cb61d581bff', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:30:01.462909+00', '2022-03-30 09:30:01.462909+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('769febca-4886-4183-9e0d-bff7bd189c4f', 'c76514da-32ac-4c0c-8b22-2cb61d581bff', '2022-03-30 09:30:01.462909+00', NULL, true, false, true, true, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:30:01.462909+00');

-- Violet Kaufman
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('f1d83860-6410-48cf-9082-2d82a43ed29a', 'violet.kaufman@sint.fr', 'Kaufman', 'Violet', '3147641G', '7245234', '30854', 'Trexlertown', '766 Ditmars Street', NULL, '0510351792', '1983-04-20', 'Faywood', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:30:02.461584+00', '2022-03-30 09:30:02.461584+00', 'a747129c-155c-42ec-b303-beae769232a7');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('f15fe9a9-5744-4c1d-9232-94ad040406d3', 'f1d83860-6410-48cf-9082-2d82a43ed29a', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:30:02.461584+00', '2022-03-30 09:30:02.461584+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('9339fbd5-bc2f-4386-a6a4-a777a99f5e60', 'f1d83860-6410-48cf-9082-2d82a43ed29a', '2022-03-30 09:30:02.461584+00', NULL, true, true, false, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:30:02.461584+00');

-- Sara Kane
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('3f07d0f3-401a-4ba3-a7d0-9eb1f7167517', 'sara.kane@eu.net', 'Kane', 'Sara', '7538927Q', '6721815', '18320', 'Lookingglass', '949 Holt Court', NULL, '0181839381', '1986-03-19', 'Robinette', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:30:03.466169+00', '2022-03-30 09:30:03.466169+00', 'd5b2cead-b3c4-42f4-ae5d-ee0d70c99bf2');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('5e1e9b3a-5b16-4ccd-8713-5ac9aba22013', '3f07d0f3-401a-4ba3-a7d0-9eb1f7167517', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:30:03.466169+00', '2022-03-30 09:30:03.466169+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('aa4cecd7-21ad-4d31-beb2-8e2a7954ce10', '3f07d0f3-401a-4ba3-a7d0-9eb1f7167517', '2022-03-30 09:30:03.466169+00', NULL, false, true, true, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:30:03.466169+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('5c75edd7-44bd-4b9c-9685-a61c824fb996', 'aa4cecd7-21ad-4d31-beb2-8e2a7954ce10', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Aide à domicile (K1304)'));

-- Della Lynch
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('dfb059fb-faff-4cad-9706-284b2590d05c', 'della.lynch@officia.net', 'Lynch', 'Della', '7641702I', '1361990', '10692', 'Barstow', '865 Vanderveer Street', NULL, '0188995138', '1996-06-08', 'Cherokee', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:30:04.466813+00', '2022-03-30 09:30:04.466813+00', '0242e420-26c5-47a6-945e-4f15eaa3bad8');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('e35bd68f-b25f-498d-a0e4-0280788349ae', 'dfb059fb-faff-4cad-9706-284b2590d05c', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:30:04.466813+00', '2022-03-30 09:30:04.466813+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('79470217-45e1-4a8d-a762-46bca43ec5dc', 'dfb059fb-faff-4cad-9706-284b2590d05c', '2022-03-30 09:30:04.466813+00', NULL, false, true, false, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:30:04.466813+00');
INSERT INTO public.notebook_info (notebook_id, orientation, need_orientation) VALUES ('79470217-45e1-4a8d-a762-46bca43ec5dc', NULL, true);
INSERT INTO public.notebook_member (id, notebook_id, account_id, last_visited_at, member_type, created_at, creator_id, invitation_sent_at) VALUES ('bff79f25-271c-4f98-877a-8c306b9627d7', '79470217-45e1-4a8d-a762-46bca43ec5dc', '2addd10f-9bd3-4d37-b3c9-10a6e2c4be4f', '2021-09-21 13:06:45.076+00', 'orientation_manager', '2021-09-21 11:51:37.295647+00', '9eee9fea-bf3e-4eb8-8f43-d9b7fd6fae76', NULL);

-- Myrna Henderson
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('c9cd9629-c963-4586-a667-d9fd14b68b06', 'myrna.henderson@mollit.com', 'Henderson', 'Myrna', '0887349Y', '5623934', '73180', 'Stewart', '614 Cumberland Street', NULL, '0574259799', '1999-12-08', 'Gerton', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:30:05.499406+00', '2022-03-30 09:30:05.499406+00', '8c8faea6-286b-4abe-9690-d4600b0227fd');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('5b8dbeaa-33c4-4c59-b6b4-dc85fe20b07d', 'c9cd9629-c963-4586-a667-d9fd14b68b06', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:30:05.499406+00', '2022-03-30 09:30:05.499406+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('4e6157e1-c2ef-48a6-a05c-8d3bda831169', 'c9cd9629-c963-4586-a667-d9fd14b68b06', '2022-03-30 09:30:05.499406+00', NULL, true, true, true, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:30:05.499406+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('924ba7f0-0812-4081-af27-57f4b3441ebf', '4e6157e1-c2ef-48a6-a05c-8d3bda831169', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Aide à domicile (K1304)'));
INSERT INTO public.notebook_info (notebook_id, orientation, need_orientation) VALUES ('4e6157e1-c2ef-48a6-a05c-8d3bda831169', NULL, true);
INSERT INTO public.notebook_member (id, notebook_id, account_id, last_visited_at, member_type, created_at, creator_id, invitation_sent_at) VALUES ('7941efa3-8cb8-4368-a472-c5fccb1e662e', '4e6157e1-c2ef-48a6-a05c-8d3bda831169', '2addd10f-9bd3-4d37-b3c9-10a6e2c4be4f', '2021-09-21 13:06:45.076+00', 'orientation_manager', '2021-09-21 11:51:37.295647+00', '9eee9fea-bf3e-4eb8-8f43-d9b7fd6fae76', NULL);

-- Whitley Benjamin
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('882513bc-a89d-4f2e-97df-d05b53861923', 'whitley.benjamin@sit.com', 'Benjamin', 'Whitley', '0628822Q', '5649641', '99319', 'Nutrioso', '642 Nassau Avenue', NULL, '0233628111', '1984-08-10', 'Cleary', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:30:06.477413+00', '2022-03-30 09:30:06.477413+00', 'b575883d-2eaa-4a01-a27a-a48e4568cf61');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('217c032f-d9b7-46c7-9c7f-453bd7efd023', '882513bc-a89d-4f2e-97df-d05b53861923', '8b71184c-6479-4440-aa89-15da704cc792', 'pending', '{}', '2022-03-30 09:30:06.477413+00', '2022-03-30 09:30:06.477413+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('f82fa38e-547a-49cd-b061-4ec9c6f2e1b9', '882513bc-a89d-4f2e-97df-d05b53861923', '2022-03-30 09:30:06.477413+00', NULL, false, true, true, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:30:06.477413+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('bc4cb352-74bd-4e16-aee7-c2b41838e26f', 'f82fa38e-547a-49cd-b061-4ec9c6f2e1b9', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Formateur / Formatrice (K2111)'));
INSERT INTO public.notebook_info (notebook_id, orientation, need_orientation) VALUES ('f82fa38e-547a-49cd-b061-4ec9c6f2e1b9', NULL, true);
INSERT INTO public.notebook_member (id, notebook_id, account_id, last_visited_at, member_type, created_at, creator_id, invitation_sent_at) VALUES ('8ee0d4c4-26c7-4c8a-98e0-a65b1d864f84', 'f82fa38e-547a-49cd-b061-4ec9c6f2e1b9', '2addd10f-9bd3-4d37-b3c9-10a6e2c4be4f', '2021-09-21 13:06:45.076+00', 'orientation_manager', '2021-09-21 11:51:37.295647+00', '9eee9fea-bf3e-4eb8-8f43-d9b7fd6fae76', NULL);

-- Sherman Mcleod
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('f04e077b-b638-4f2a-9623-525292a905d9', 'sherman.mcleod@consequat.fr', 'Mcleod', 'Sherman', '9580997W', '8381249', '66026', 'Bladensburg', '510 Elton Street', NULL, '0428358856', '1998-10-16', 'Longoria', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:30:07.478508+00', '2022-03-30 09:30:07.478508+00', 'f6692b9a-4248-45b3-b919-2a5343f0fd33');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('7f8208ba-d418-4067-b244-c4d9b3f6ed24', 'f04e077b-b638-4f2a-9623-525292a905d9', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:30:07.478508+00', '2022-03-30 09:30:07.478508+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('4067f34d-7321-4400-a5a2-a06a59538983', 'f04e077b-b638-4f2a-9623-525292a905d9', '2022-03-30 09:30:07.478508+00', NULL, false, false, false, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:30:07.478508+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('5088a73c-506c-41bd-8028-0d2cc0115ffc', '4067f34d-7321-4400-a5a2-a06a59538983', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Aide à domicile (K1304)'));
INSERT INTO public.notebook_info (notebook_id, orientation, need_orientation) VALUES ('4067f34d-7321-4400-a5a2-a06a59538983', NULL, true);
INSERT INTO public.notebook_member (id, notebook_id, account_id, last_visited_at, member_type, created_at, creator_id, invitation_sent_at) VALUES ('d3ebbda7-7e71-4fbb-afb6-00f031e9c86a', '4067f34d-7321-4400-a5a2-a06a59538983', '23e910a6-0b3d-4147-ac6f-9efbcecaab70', '2021-09-21 13:06:45.076+00', 'orientation_manager', '2021-09-21 11:51:37.295647+00', '9eee9fea-bf3e-4eb8-8f43-d9b7fd6fae76', NULL);

-- Horn Terry
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('7799a55f-e4a5-4897-8bea-ea985c4bd84b', 'horn.terry@exercitation.fr', 'Terry', 'Horn', '6316989D', '6699117', '18436', 'Otranto', '403 Herkimer Court', NULL, '0241321000', '1967-01-18', 'Watchtower', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:30:08.480263+00', '2022-03-30 09:30:08.480263+00', 'dd15b116-0222-45d2-9e85-cf5528ea2fb4');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('983ef6c7-c9cb-4ceb-977a-a13ed0777ffc', '7799a55f-e4a5-4897-8bea-ea985c4bd84b', '8b71184c-6479-4440-aa89-15da704cc792', 'pending', '{}', '2022-03-30 09:30:08.480263+00', '2022-03-30 09:30:08.480263+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('5eef857d-f99b-4b2c-a45b-e493175ff52a', '7799a55f-e4a5-4897-8bea-ea985c4bd84b', '2022-03-30 09:30:08.480263+00', NULL, false, false, true, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:30:08.480263+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('baf9cdb4-777d-4046-9b3f-e32f8353a583', '5eef857d-f99b-4b2c-a45b-e493175ff52a', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Pontier élingueur / Pontière élingueuse (N1104)'));
INSERT INTO public.notebook_info (notebook_id, orientation, need_orientation) VALUES ('5eef857d-f99b-4b2c-a45b-e493175ff52a', NULL, true);
INSERT INTO public.notebook_member (id, notebook_id, account_id, last_visited_at, member_type, created_at, creator_id, invitation_sent_at) VALUES ('6622fbdf-a302-4724-a7da-7d335c3b8ed5', '5eef857d-f99b-4b2c-a45b-e493175ff52a', '23e910a6-0b3d-4147-ac6f-9efbcecaab70', '2021-09-21 13:06:45.076+00', 'orientation_manager', '2021-09-21 11:51:37.295647+00', '9eee9fea-bf3e-4eb8-8f43-d9b7fd6fae76', NULL);

-- Casandra Tran
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('b0b5e78b-9964-4aee-ac82-e3f9f93882d4', 'casandra.tran@aliquip.com', 'Tran', 'Casandra', '6728235Q', '1108430', '84722', 'Saddlebrooke', '376 Varanda Place', NULL, '0709216522', '1981-04-01', 'Wright', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:30:09.47948+00', '2022-03-30 09:30:09.47948+00', '1e5896d4-41d1-4460-9a3c-6cfb876ad4bf');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('fb2a1c32-5d91-4c82-8dc3-86531ad65670', 'b0b5e78b-9964-4aee-ac82-e3f9f93882d4', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:30:09.47948+00', '2022-03-30 09:30:09.47948+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('526e4f48-eb36-491c-9cb3-1ed08068ff53', 'b0b5e78b-9964-4aee-ac82-e3f9f93882d4', '2022-03-30 09:30:09.47948+00', NULL, true, false, false, true, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:30:09.47948+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('09f372f0-74a8-4b4b-8e1d-206e99a0f3ce', '526e4f48-eb36-491c-9cb3-1ed08068ff53', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Conducteur / Conductrice d''engins d''exploitation agricole (A1101)'));
INSERT INTO public.notebook_info (notebook_id, orientation, need_orientation) VALUES ('526e4f48-eb36-491c-9cb3-1ed08068ff53', NULL, true);
INSERT INTO public.notebook_member (id, notebook_id, account_id, last_visited_at, member_type, created_at, creator_id, invitation_sent_at) VALUES ('dee93a6c-d26d-4674-9767-47c610b132ac', '526e4f48-eb36-491c-9cb3-1ed08068ff53', '23e910a6-0b3d-4147-ac6f-9efbcecaab70', '2021-09-21 13:06:45.076+00', 'orientation_manager', '2021-09-21 11:51:37.295647+00', '9eee9fea-bf3e-4eb8-8f43-d9b7fd6fae76', NULL);

-- Isabella Conley
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('3cf656ec-f391-4a16-b845-a2cbad998563', 'isabella.conley@ullamco.net', 'Conley', 'Isabella', '0573690D', '5632422', '46259', 'Barronett', '652 Bristol Street', NULL, '0479676955', '1996-10-27', 'Caln', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:30:10.492988+00', '2022-03-30 09:30:10.492988+00', '36b971ca-f046-4468-a140-cd94105f38b2');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('4b66de5b-130c-402f-b982-db8d60e6c413', '3cf656ec-f391-4a16-b845-a2cbad998563', '8b71184c-6479-4440-aa89-15da704cc792', 'pending', '{}', '2022-03-30 09:30:10.492988+00', '2022-03-30 09:30:10.492988+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('86d71dc4-4719-470e-bffd-17a1593f4b60', '3cf656ec-f391-4a16-b845-a2cbad998563', '2022-03-30 09:30:10.492988+00', NULL, false, true, true, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:30:10.492988+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('9af0bfb8-e87f-4f27-a32b-beb215536900', '86d71dc4-4719-470e-bffd-17a1593f4b60', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Aide à domicile (K1304)'));
INSERT INTO public.notebook_info (notebook_id, orientation, need_orientation) VALUES ('86d71dc4-4719-470e-bffd-17a1593f4b60', NULL, true);

-- Buckley Hoffman
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('7b8949d5-8004-41fb-924c-d37270b494b6', 'buckley.hoffman@magna.net', 'Hoffman', 'Buckley', '1722202V', '3314256', '01600', 'Waverly', '325 Baltic Street', NULL, '0449833967', '1986-02-12', 'Bynum', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:30:11.48929+00', '2022-03-30 09:30:11.48929+00', '954cb698-a1b7-437b-90b7-6035cd78a330');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('414b1fa2-2bc9-4f73-92f4-a72980205292', '7b8949d5-8004-41fb-924c-d37270b494b6', '8b71184c-6479-4440-aa89-15da704cc792', 'pending', '{}', '2022-03-30 09:30:11.48929+00', '2022-03-30 09:30:11.48929+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('3c220ce4-df2c-44a1-9cc9-bfbb7102d2d1', '7b8949d5-8004-41fb-924c-d37270b494b6', '2022-03-30 09:30:11.48929+00', NULL, false, true, true, true, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:30:11.48929+00');
INSERT INTO public.notebook_info (notebook_id, orientation, need_orientation) VALUES ('3c220ce4-df2c-44a1-9cc9-bfbb7102d2d1', NULL, true);

-- Mercedes Olsen
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('46524a2d-6805-497a-bd3b-edee70f5b2d8', 'mercedes.olsen@minim.fr', 'Olsen', 'Mercedes', '3050084L', '3172476', '03561', 'Chautauqua', '175 Jaffray Street', NULL, '0744341588', '1978-08-05', 'Richville', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:30:12.516651+00', '2022-03-30 09:30:12.516651+00', 'b76ed328-94d2-4674-b8cd-6626913e8fc1');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('4183f5e6-fbdb-4632-ba0b-96496adaf043', '46524a2d-6805-497a-bd3b-edee70f5b2d8', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:30:12.516651+00', '2022-03-30 09:30:12.516651+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('865c293e-63d1-4475-b6c3-bce29e0adcb9', '46524a2d-6805-497a-bd3b-edee70f5b2d8', '2022-03-30 09:30:12.516651+00', NULL, true, false, true, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:30:12.516651+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('0a04f83c-aa99-403a-bc61-832008d6eddc', '865c293e-63d1-4475-b6c3-bce29e0adcb9', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Formateur / Formatrice (K2111)'));
INSERT INTO public.notebook_info (notebook_id, orientation, need_orientation) VALUES ('865c293e-63d1-4475-b6c3-bce29e0adcb9', NULL, true);

-- Pickett Mccormick
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('c701affa-d378-438b-b7fe-2355f789fbcf', 'pickett.mccormick@ea.fr', 'Mccormick', 'Pickett', '5724653A', '6888205', '11441', 'Wheatfields', '262 Woodrow Court', NULL, '0429149027', '1983-07-01', 'Herbster', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:30:13.526173+00', '2022-03-30 09:30:13.526173+00', '83317a74-8f63-4d00-80a3-8752d03cf34b');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('5e7c338f-6cec-4170-9b79-e387b6cf9187', 'c701affa-d378-438b-b7fe-2355f789fbcf', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:30:13.526173+00', '2022-03-30 09:30:13.526173+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('633f6b90-4ab8-4b74-8e37-eca75a137f09', 'c701affa-d378-438b-b7fe-2355f789fbcf', '2022-03-30 09:30:13.526173+00', NULL, true, true, true, true, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:30:13.526173+00');
INSERT INTO public.notebook_info (notebook_id, orientation, need_orientation) VALUES ('633f6b90-4ab8-4b74-8e37-eca75a137f09', NULL, true);

-- Hamilton Roth
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('d189940e-5323-47b3-83ee-707a7b2c07cf', 'hamilton.roth@cillum.fr', 'Roth', 'Hamilton', '1246465R', '2355490', '28411', 'Bendon', '133 Poplar Street', NULL, '0619285335', '1961-04-20', 'Delco', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:30:14.549224+00', '2022-03-30 09:30:14.549224+00', '3d9a0e44-27e3-4fc8-9cec-4b75167f0093');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('32eff06a-5724-4d41-8f77-b9ac45503afb', 'd189940e-5323-47b3-83ee-707a7b2c07cf', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:30:14.549224+00', '2022-03-30 09:30:14.549224+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('ba7a2a67-0ad5-4813-a2f4-cff216f24b60', 'd189940e-5323-47b3-83ee-707a7b2c07cf', '2022-03-30 09:30:14.549224+00', NULL, true, false, false, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:30:14.549224+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('561beed3-0a7e-4924-bd22-c968d229ee8d', 'ba7a2a67-0ad5-4813-a2f4-cff216f24b60', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Aide à domicile (K1304)'));
INSERT INTO public.notebook_info (notebook_id, orientation, need_orientation) VALUES ('ba7a2a67-0ad5-4813-a2f4-cff216f24b60', NULL, true);

-- Shelly Raymond
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('9d5661da-3296-4afa-b59b-e0f588cdc355', 'shelly.raymond@qui.fr', 'Raymond', 'Shelly', '5678467C', '4953292', '08283', 'Levant', '627 Merit Court', NULL, '0745560952', '1989-12-02', 'Buxton', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:30:15.530921+00', '2022-03-30 09:30:15.530921+00', '28ac21bf-4d5c-4ed1-95f5-4dd463edbfca');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('56e46ed8-8cc6-4403-9de8-72121059ac6a', '9d5661da-3296-4afa-b59b-e0f588cdc355', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:30:15.530921+00', '2022-03-30 09:30:15.530921+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('6dd78bd1-bad5-4914-a73f-aca9e71f6d2b', '9d5661da-3296-4afa-b59b-e0f588cdc355', '2022-03-30 09:30:15.530921+00', NULL, true, false, false, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:30:15.530921+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('4cef4e39-fcf7-4326-a0da-8630144d39fb', '6dd78bd1-bad5-4914-a73f-aca9e71f6d2b', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Pontier élingueur / Pontière élingueuse (N1104)'));
INSERT INTO public.notebook_info (notebook_id, orientation, need_orientation) VALUES ('6dd78bd1-bad5-4914-a73f-aca9e71f6d2b', 'pro', false);
INSERT INTO public.notebook_member (id, notebook_id, account_id, last_visited_at, member_type, created_at, creator_id, invitation_sent_at) VALUES ('222e926d-05be-44cd-9f15-109828bfeb48', '6dd78bd1-bad5-4914-a73f-aca9e71f6d2b', '23e910a6-0b3d-4147-ac6f-9efbcecaab70', '2021-09-21 13:06:45.076+00', 'orientation_manager', '2021-09-21 11:51:37.295647+00', '9eee9fea-bf3e-4eb8-8f43-d9b7fd6fae76', NULL);

-- Henderson Herrera
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('a4a510db-43d9-43b1-abe6-1b77dd96f686', 'henderson.herrera@eu.net', 'Herrera', 'Henderson', '2290412T', '9669219', '28848', 'Enoree', '930 Nevins Street', NULL, '0508825234', '1969-03-25', 'Escondida', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:30:16.561986+00', '2022-03-30 09:30:16.561986+00', 'd52963a4-2de1-4612-bb91-c067ba02f326');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('52621faf-5f4c-4ecf-a8fd-4a51d559cbe0', 'a4a510db-43d9-43b1-abe6-1b77dd96f686', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:30:16.561986+00', '2022-03-30 09:30:16.561986+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('03d656fd-11bf-4937-a57d-5752174eaa42', 'a4a510db-43d9-43b1-abe6-1b77dd96f686', '2022-03-30 09:30:16.561986+00', NULL, false, false, false, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:30:16.561986+00');
INSERT INTO public.notebook_info (notebook_id, orientation, need_orientation) VALUES ('03d656fd-11bf-4937-a57d-5752174eaa42', 'pro', false);
INSERT INTO public.notebook_member (id, notebook_id, account_id, last_visited_at, member_type, created_at, creator_id, invitation_sent_at) VALUES ('ba503099-0b6f-433c-ba3f-7e7e74b531b2', '03d656fd-11bf-4937-a57d-5752174eaa42', '23e910a6-0b3d-4147-ac6f-9efbcecaab70', '2021-09-21 13:06:45.076+00', 'orientation_manager', '2021-09-21 11:51:37.295647+00', '9eee9fea-bf3e-4eb8-8f43-d9b7fd6fae76', NULL);

-- Liz Rice
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('6a2de059-0f1c-4182-929e-219d067134d3', 'liz.rice@consequat.net', 'Rice', 'Liz', '2758244F', '3525833', '43281', 'Osmond', '518 Elliott Place', NULL, '0401199202', '1982-11-04', 'Hessville', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:30:17.561157+00', '2022-03-30 09:30:17.561157+00', '91942b79-6bb4-4694-8799-80703e2774a6');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('bbc4c37f-6e57-45c8-ab8d-e01cd30e950e', '6a2de059-0f1c-4182-929e-219d067134d3', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:30:17.561157+00', '2022-03-30 09:30:17.561157+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('05a5aab2-457b-4a03-8167-e3ff132c1ce8', '6a2de059-0f1c-4182-929e-219d067134d3', '2022-03-30 09:30:17.561157+00', NULL, true, false, true, true, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:30:17.561157+00');
INSERT INTO public.notebook_info (notebook_id, orientation, need_orientation) VALUES ('05a5aab2-457b-4a03-8167-e3ff132c1ce8', 'pro', false);
INSERT INTO public.notebook_member (id, notebook_id, account_id, last_visited_at, member_type, created_at, creator_id, invitation_sent_at) VALUES ('3f50f205-0bcd-4490-a7a1-c419bce3556d', '05a5aab2-457b-4a03-8167-e3ff132c1ce8', '23e910a6-0b3d-4147-ac6f-9efbcecaab70', '2021-09-21 13:06:45.076+00', 'orientation_manager', '2021-09-21 11:51:37.295647+00', '9eee9fea-bf3e-4eb8-8f43-d9b7fd6fae76', NULL);

-- Hester Jacobson
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('8df381e4-3d8a-49c3-9b65-5a9c30ebb7bb', 'hester.jacobson@id.fr', 'Jacobson', 'Hester', '4810152P', '6983190', '94473', 'Belleview', '447 John Street', NULL, '0429554651', '1962-03-11', 'Davenport', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:30:18.570623+00', '2022-03-30 09:30:18.570623+00', '4f165a1e-578a-4649-ac8e-bdf48477db00');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('6bac1188-19a1-4d71-a042-17bcd8e51d6c', '8df381e4-3d8a-49c3-9b65-5a9c30ebb7bb', '8b71184c-6479-4440-aa89-15da704cc792', 'pending', '{}', '2022-03-30 09:30:18.570623+00', '2022-03-30 09:30:18.570623+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('fcb9cd63-7623-4175-a061-1e372cb3259b', '8df381e4-3d8a-49c3-9b65-5a9c30ebb7bb', '2022-03-30 09:30:18.570623+00', NULL, false, true, true, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:30:18.570623+00');
INSERT INTO public.notebook_info (notebook_id, orientation, need_orientation) VALUES ('fcb9cd63-7623-4175-a061-1e372cb3259b', 'pro', false);
INSERT INTO public.notebook_member (id, notebook_id, account_id, last_visited_at, member_type, created_at, creator_id, invitation_sent_at) VALUES ('05e4a22a-acb2-40e4-be35-fc5b67d7acdd', 'fcb9cd63-7623-4175-a061-1e372cb3259b', '23e910a6-0b3d-4147-ac6f-9efbcecaab70', '2021-09-21 13:06:45.076+00', 'orientation_manager', '2021-09-21 11:51:37.295647+00', '9eee9fea-bf3e-4eb8-8f43-d9b7fd6fae76', NULL);

-- Payne Bennett
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('e8ead435-ae1e-463c-b1d8-64ee4bd18c01', 'payne.bennett@do.net', 'Bennett', 'Payne', '3671387F', '7954039', '46628', 'Rodman', '245 Luquer Street', NULL, '0399927099', '1963-06-02', 'Mooresburg', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:30:19.548456+00', '2022-03-30 09:30:19.548456+00', 'f5e2bfd0-1b16-478e-9959-b54af16609c3');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('ba05a3a0-1073-4f86-9fb6-fc07f9168c9d', 'e8ead435-ae1e-463c-b1d8-64ee4bd18c01', '8b71184c-6479-4440-aa89-15da704cc792', 'pending', '{}', '2022-03-30 09:30:19.548456+00', '2022-03-30 09:30:19.548456+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('761f99be-e1ac-4499-92e3-d07f22083f92', 'e8ead435-ae1e-463c-b1d8-64ee4bd18c01', '2022-03-30 09:30:19.548456+00', NULL, false, true, true, true, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:30:19.548456+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('dad86d6b-135b-47d1-986b-00621f9d6927', '761f99be-e1ac-4499-92e3-d07f22083f92', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Conducteur / Conductrice d''engins d''exploitation agricole (A1101)'));
INSERT INTO public.notebook_member (id, notebook_id, account_id, last_visited_at, member_type, created_at, creator_id, invitation_sent_at) VALUES ('e2c63fbd-0fa0-47e6-b6f0-ac0c40668eb6', '761f99be-e1ac-4499-92e3-d07f22083f92', '23e910a6-0b3d-4147-ac6f-9efbcecaab70', '2021-09-21 13:06:45.076+00', 'orientation_manager', '2021-09-21 11:51:37.295647+00', '9eee9fea-bf3e-4eb8-8f43-d9b7fd6fae76', NULL);

-- Sonja Kline
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('288abcb1-8092-452d-8317-b8a6e5934ce6', 'sonja.kline@deserunt.net', 'Kline', 'Sonja', '4477174D', '2708919', '13613', 'Westboro', '564 Batchelder Street', NULL, '0341487270', '1961-12-21', 'Shawmut', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:30:20.600783+00', '2022-03-30 09:30:20.600783+00', 'bd56e1f7-e3a7-4e38-b2e6-8f013c1568b1');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('a2a9b859-be4a-4800-98e4-cf62628102f2', '288abcb1-8092-452d-8317-b8a6e5934ce6', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:30:20.600783+00', '2022-03-30 09:30:20.600783+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('a3f1cae1-0c97-4b21-8519-ea4c2b0907db', '288abcb1-8092-452d-8317-b8a6e5934ce6', '2022-03-30 09:30:20.600783+00', NULL, true, true, true, true, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:30:20.600783+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('441ad1df-3691-45ea-ae6f-f54d6531fbae', 'a3f1cae1-0c97-4b21-8519-ea4c2b0907db', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Formateur / Formatrice (K2111)'));
INSERT INTO public.notebook_info (notebook_id, orientation, need_orientation) VALUES ('a3f1cae1-0c97-4b21-8519-ea4c2b0907db', 'social', false);
INSERT INTO public.notebook_member (id, notebook_id, account_id, last_visited_at, member_type, created_at, creator_id, invitation_sent_at) VALUES ('04d2feb7-979d-47de-aebe-2b7bbcf41021', 'a3f1cae1-0c97-4b21-8519-ea4c2b0907db', '2addd10f-9bd3-4d37-b3c9-10a6e2c4be4f', '2021-09-21 13:06:45.076+00', 'orientation_manager', '2021-09-21 11:51:37.295647+00', '9eee9fea-bf3e-4eb8-8f43-d9b7fd6fae76', NULL);

-- Woods Walker
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('f6d42562-004e-4d55-b416-dfc7e190c27b', 'woods.walker@esse.fr', 'Walker', 'Woods', '7404405W', '1272385', '71117', 'Guthrie', '326 Amboy Street', NULL, '0571411407', '1986-04-27', 'Sehili', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:30:21.583071+00', '2022-03-30 09:30:21.583071+00', '5c6adbab-f9be-472f-8fd3-e22764b439de');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('3f6079ba-7adf-49b8-a160-d341feb5cd25', 'f6d42562-004e-4d55-b416-dfc7e190c27b', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:30:21.583071+00', '2022-03-30 09:30:21.583071+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('5b5475ed-1458-4ffd-9d07-204b6c9f00d4', 'f6d42562-004e-4d55-b416-dfc7e190c27b', '2022-03-30 09:30:21.583071+00', NULL, false, false, false, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:30:21.583071+00');
INSERT INTO public.notebook_info (notebook_id, orientation, need_orientation) VALUES ('5b5475ed-1458-4ffd-9d07-204b6c9f00d4', 'social', false);
INSERT INTO public.notebook_member (id, notebook_id, account_id, last_visited_at, member_type, created_at, creator_id, invitation_sent_at) VALUES ('67f9dbf5-ed8f-4ba3-8085-0fafeef85882', '5b5475ed-1458-4ffd-9d07-204b6c9f00d4', '2addd10f-9bd3-4d37-b3c9-10a6e2c4be4f', '2021-09-21 13:06:45.076+00', 'orientation_manager', '2021-09-21 11:51:37.295647+00', '9eee9fea-bf3e-4eb8-8f43-d9b7fd6fae76', NULL);

-- Brigitte Patrick
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('6ff36393-a09c-45a0-9d6c-4b2427100857', 'brigitte.patrick@et.fr', 'Patrick', 'Brigitte', '6314030Q', '5524141', '99358', 'Dowling', '124 Kent Avenue', NULL, '0538854057', '1961-08-13', 'Forbestown', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:30:22.595306+00', '2022-03-30 09:30:22.595306+00', '6b3e7920-011c-4743-9411-5d703c585424');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('ef5a5b55-a20f-471f-a29f-8dd0e3fcef56', '6ff36393-a09c-45a0-9d6c-4b2427100857', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pending', '{}', '2022-03-30 09:30:22.595306+00', '2022-03-30 09:30:22.595306+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('0e97a8ac-98ec-4712-b0f4-086c5f5982db', '6ff36393-a09c-45a0-9d6c-4b2427100857', '2022-03-30 09:30:22.595306+00', NULL, false, true, false, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:30:22.595306+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('e9070329-dcdb-431d-a92f-ca03940a0a5f', '0e97a8ac-98ec-4712-b0f4-086c5f5982db', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Aide à domicile (K1304)'));
INSERT INTO public.notebook_info (notebook_id, orientation, need_orientation) VALUES ('0e97a8ac-98ec-4712-b0f4-086c5f5982db', 'sociopro', false);
INSERT INTO public.notebook_member (id, notebook_id, account_id, last_visited_at, member_type, created_at, creator_id, invitation_sent_at) VALUES ('aa89170c-b73a-4f80-aa8f-5f50a8f8644a', '0e97a8ac-98ec-4712-b0f4-086c5f5982db', '2addd10f-9bd3-4d37-b3c9-10a6e2c4be4f', '2021-09-21 13:06:45.076+00', 'orientation_manager', '2021-09-21 11:51:37.295647+00', '9eee9fea-bf3e-4eb8-8f43-d9b7fd6fae76', NULL);

-- Edwina Skinner
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('0af66131-727b-4d47-b0d2-92d363ed145b', 'edwina.skinner@commodo.com', 'Skinner', 'Edwina', '6540784H', '1381981', '85570', 'Drummond', '724 Loring Avenue', NULL, '0433253812', '1973-05-14', 'Gambrills', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:30:23.598674+00', '2022-03-30 09:30:23.598674+00', '35f9c1d9-f566-40a1-ba64-aac20111825a');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('3d9b3915-3555-49ff-9249-bf43b9e46244', '0af66131-727b-4d47-b0d2-92d363ed145b', '8b71184c-6479-4440-aa89-15da704cc792', 'pending', '{}', '2022-03-30 09:30:23.598674+00', '2022-03-30 09:30:23.598674+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('9c0e5236-a03d-4e5f-b945-c6bc556cf9f3', '0af66131-727b-4d47-b0d2-92d363ed145b', '2022-03-30 09:30:23.598674+00', NULL, false, true, true, false, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:30:23.598674+00');
INSERT INTO public.notebook_info (notebook_id, orientation, need_orientation) VALUES ('9c0e5236-a03d-4e5f-b945-c6bc556cf9f3', 'sociopro', false);
INSERT INTO public.notebook_member (id, notebook_id, account_id, last_visited_at, member_type, created_at, creator_id, invitation_sent_at) VALUES ('57bb5b99-552c-4d14-af7b-3c230c997eb8', '9c0e5236-a03d-4e5f-b945-c6bc556cf9f3', '2addd10f-9bd3-4d37-b3c9-10a6e2c4be4f', '2021-09-21 13:06:45.076+00', 'orientation_manager', '2021-09-21 11:51:37.295647+00', '9eee9fea-bf3e-4eb8-8f43-d9b7fd6fae76', NULL);

-- Alexandria Cobb
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('82550a7d-1385-4981-89ea-761cbe70812e', 'alexandria.cobb@veniam.com', 'Cobb', 'Alexandria', '1052725S', '4935882', '01555', 'Chicopee', '766 Seeley Street', NULL, '0483427053', '1993-06-30', 'Harrison', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:30:24.614983+00', '2022-03-30 09:30:24.614983+00', 'fc5702b5-c9f9-4a73-bad6-759d19ebe4e3');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('05fddf2c-b84b-40aa-aee9-e72af1430838', '82550a7d-1385-4981-89ea-761cbe70812e', '8b71184c-6479-4440-aa89-15da704cc792', 'pending', '{}', '2022-03-30 09:30:24.614983+00', '2022-03-30 09:30:24.614983+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, updated_at)
VALUES ('d235c967-29dc-47bc-b2f3-43aa46c9f54f', '82550a7d-1385-4981-89ea-761cbe70812e', '2022-03-30 09:30:24.614983+00', NULL, false, true, false, true, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 09:30:24.614983+00');
INSERT INTO public.notebook_info (notebook_id, orientation, need_orientation) VALUES ('d235c967-29dc-47bc-b2f3-43aa46c9f54f', 'sociopro', false);
INSERT INTO public.notebook_member (id, notebook_id, account_id, last_visited_at, member_type, created_at, creator_id, invitation_sent_at) VALUES ('d173dc3a-d88a-48c3-b6eb-24f1fdc53a25', 'd235c967-29dc-47bc-b2f3-43aa46c9f54f', '2addd10f-9bd3-4d37-b3c9-10a6e2c4be4f', '2021-09-21 13:06:45.076+00', 'orientation_manager', '2021-09-21 11:51:37.295647+00', '9eee9fea-bf3e-4eb8-8f43-d9b7fd6fae76', NULL);

-- KELLER Noel
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('ba6dc97e-05dd-4053-a810-b12605a11bba', 'keller.noel@fugiat.fr', 'Noel', 'KELLER', '3067049O', '5891832', '69995', 'Cucumber', '533 Trucklemans Lane', NULL, '0487512876', '1977-03-23', 'Oceola', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:30:25.617229+00', '2022-03-30 09:30:25.617229+00', '47207b54-1f06-4532-a498-f21fccbff699');
INSERT INTO public.beneficiary_structure (id, beneficiary_id, structure_id, status, data, created_at, updated_at)
VALUES ('703ff102-ff41-4fc5-b66f-1fe608b2a71f', 'ba6dc97e-05dd-4053-a810-b12605a11bba', '8b71184c-6479-4440-aa89-15da704cc792', 'pending', '{}', '2022-03-30 09:30:25.617229+00', '2022-03-30 09:30:25.617229+00');
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation, work_situation_end_date, contract_start_date, contract_end_date, updated_at)
VALUES ('a89cf5f3-7013-480a-a3bf-e10ad0b6f9e8', 'ba6dc97e-05dd-4053-a810-b12605a11bba', '2022-03-30 09:30:25.617229+00', 'rsa_droit_ouvert_et_suspendu', true, true, true, true, 'between_10_20', 'NV4', '2022-07-22', 'cer', '2021-01-05', 'iae', '2022-01-05', '2022-03-05', '2022-05-05', '2022-03-30 09:30:25.617229+00');
INSERT INTO public.wanted_job (id, notebook_id, rome_code_id) VALUES ('07a24076-f0f9-4e99-8767-d7201d41fbc4', 'a89cf5f3-7013-480a-a3bf-e10ad0b6f9e8', (SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Conducteur / Conductrice d''engins d''exploitation agricole (A1101)'));

-- Martin Gal
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, place_of_birth, deployment_id, created_at, updated_at, internal_id)
VALUES ('1f0d3401-67ad-4ea7-8f3a-a0876c4f79bd', 'martin.gal@gmail.com', 'Gal', 'Martin', '3067049O', '5891832', '69995', 'Cucumber', '533 Trucklemans Lane', NULL, '0387512876', '1978-03-23', 'Paris', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', '2022-03-30 09:30:25.617229+00', '2022-03-30 09:30:25.617229+00', 'internal-id-nnnn');
