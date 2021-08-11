Config = {}

Config.Target = 'bt-target'  --change to bt-target if you use it

---- store prices ----

Config.groceryitem1 = 'burger'   --- item
Config.groceryprice1 = 15         --- item price

Config.groceryitem2 = 'chips'
Config.groceryprice2 = 10

Config.groceryitem3 = 'popcorn'
Config.groceryprice3 = 15

Config.groceryitem4 = 'sandwich'
Config.groceryprice4 = 15

---- liquor store ----

Config.liquoritem1 = 'wine'
Config.liquorprice1 = 20

Config.liquoritem2 = 'tekila'
Config.liquorprice2 = 30

Config.liquoritem3 = 'beer'
Config.liquorprice3 = 15

Config.liquoritem4 = 'vodka'
Config.liquorprice4 = 20

---- illegal shop ----

Config.weaponitem1 = 'WEAPON_PISTOL'
Config.weaponprice1 = 10000

Config.weaponitem2 = 'WEAPON_SMG'
Config.weaponprice2 = 20000

Config.weaponitem3 = 'WEAPON_BAT'
Config.weaponprice3 = 5000

Config.weaponitem4 = 'WEAPON_KNIFE'
Config.weaponprice4 = 7000


---- NPC spawn ----
Config.Distancia = 10.0

Config.main = {
    -------  Grocery Store  --------
    {
		modelo = 's_m_m_ammucountry',
		coords = vector3(-705.87, -914.42, 19.22), -- Great Ocean Highway
        heading = 90.1,
		gender = 'male'
	},

	{
		modelo = 's_m_m_ammucountry',
		coords = vector3(24.41, -1346.5, 29.5), -- Great Ocean Highway
        heading = 276.84,
		gender = 'male'
	},
    
	{
		modelo = 's_m_m_ammucountry',
		coords = vector3(-47.1, -1758.87, 29.42), -- Great Ocean Highway
        heading = 55.87,
		gender = 'male'
	},

	{
		modelo = 's_m_m_ammucountry',
		coords = vector3(372.53, 326.63, 103.57), -- Great Ocean Highway
        heading = 257.13,
		gender = 'male'
	},

	{
		modelo = 's_m_m_ammucountry',
		coords = vector3(549.07, 2671.2, 42.16), -- Great Ocean Highway
        heading = 93.6,
		gender = 'male'
	},

	{
		modelo = 's_m_m_ammucountry',
		coords = vector3(1960.03, 3740.13, 32.34), -- Great Ocean Highway
        heading = 311.78,
		gender = 'male'
	},

	{
		modelo = 's_m_m_ammucountry',
		coords = vector3(-3040.61, 583.81, 7.91), -- Great Ocean Highway
        heading = 15.95,
		gender = 'male'
	},

	{
		modelo = 's_m_m_ammucountry',
		coords = vector3(2677.88, 3279.39, 55.24), -- Great Ocean Highway
        heading = 326.14,
		gender = 'male'
	},

	{
		modelo = 's_m_m_ammucountry',
		coords = vector3(1697.2, 4923.4, 42.1), -- Great Ocean Highway
        heading = 326.14,
		gender = 'male'
	},

	{
		modelo = 's_m_m_ammucountry',
		coords = vector3(-1819.2, 793.9, 138.1), -- Great Ocean Highway
        heading = 120.14,
		gender = 'male'
	},

	{
		modelo = 's_m_m_ammucountry',
		coords = vector3(1165.3, -323.4, 69.2), -- Great Ocean Highway
        heading = 100.14,
		gender = 'male'
	},

	{
		modelo = 's_m_m_ammucountry',
		coords = vector3(1728.3, 6416.9, 35), -- Great Ocean Highway
        heading = 250.14,
		gender = 'male'
	},

	{
		modelo = 's_m_m_ammucountry',
		coords = vector3(-3244, 999.9, 12.8), -- Great Ocean Highway
        heading = 0.0,
		gender = 'male'
	},

	{
		modelo = 's_m_m_ammucountry',
		coords = vector3(2555.2, 380.8, 108.6), -- Great Ocean Highway
        heading = 0.0,
		gender = 'male'
	},

	-------  liquor store  ---------

	{
		modelo = 'csb_ortega',
		coords = vector3(1391.67, 3606.18, 34.98), 
        heading = 0.0,
		gender = 'male'
	},

	{
		modelo = 'csb_ortega',
		coords = vector3(-2966.47, 390.11, 15.04), 
        heading = 0.0,
		gender = 'male'
	},

	{
		modelo = 'csb_ortega',
		coords = vector3(-1485.82, -378.54, 40.16), 
        heading = 141.47,
		gender = 'male'
	},

	{
		modelo = 'csb_ortega',
		coords = vector3(1134.04, -981.51, 46.42), 
        heading = 274.01,
		gender = 'male'
	},

	{
		modelo = 'csb_ortega',
		coords = vector3(1166.8, 2710.78, 38.16), 
        heading = 0.0,
		gender = 'male'
	},

	----- illegal items -----

	{
		modelo = 'cs_taostranslator',
		coords = vector3(-45.54, 1918.58, 195.5), 
        heading = 2.4,
		gender = 'male'
	},


}

