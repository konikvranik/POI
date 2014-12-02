DELETE FROM public.source;
INSERT INTO public.source ( name,code, priority, description ) VALUES ('POI.cz', 'poi.cz', 0, 'Automaticky importované body ze serveru online.poi.cz.');
INSERT INTO public.source ( name,code, priority, description ) VALUES ('hPa', 'hpa', 0, 'Body dodané Petrem Vraníkem.');
INSERT INTO public.source ( name,code, priority, description ) VALUES ('Tom Tom Navigator 5', 'TTN5', 0, 'Body dodávané společně s Tom Tom Navigator v5.');
INSERT INTO public.source ( name,code, priority, description ) VALUES ('Tom Tom Navigator 6', 'TTN6', 0, 'Body dodávané společně s Tom Tom Navigator v6.');

SELECT * from public.source;

DELETE FROM public.category;
INSERT INTO public.category (name, code, description, source_id, symbol_id, type_id) VALUES ('benzinka Agip','TANK.AGIP', NULL, 3, NULL, NULL);

SELECT * from public.category;
