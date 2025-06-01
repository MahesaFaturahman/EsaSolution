-- Data perusahaan
INSERT INTO company_info (
    company_name, 
    address, 
    phone, 
    email, 
    working_hours, 
    vision, 
    mission, 
    about_us,
    logo_url
) VALUES (
    'PT Energi Solusi Aplikasi', 
    'Komplek ruko galeri Mediterania 2 no : N8M, Jl. Pantai Indah Kapuk, RT.1/RW.16 Kapuk Muara, Kec. Penjaringan, Jkt Utara, DKI Jakarta 14660', 
    '081380804529', 
    'esainformatika@gmail.com', 
    'Senin - Jumat: 09.00 - 17.00 WIB', 
    'Menjadi mitra teknologi terdepan yang mendorong transformasi digital bisnis di Indonesia.', 
    'Menyediakan solusi teknologi yang skalabel dan aman\nMemberikan pengalaman pengguna yang luar biasa\nMendukung pertumbuhan bisnis melalui inovasi digital', 
    'ESA Solution adalah software house profesional yang berfokus pada pengembangan aplikasi web, mobile, dan sistem enterprise. Sejak berdiri pada tahun 2023, kami telah membantu berbagai macam industri.',
    'https://drive.google.com/uc?export=view&id=1uqFF6wXz2Dve38PPJNmwNJ-9SxM_mAp7'
);

-- Data layanan
INSERT INTO services (
    title, 
    description, 
    icon_class, 
    image_url, 
    features
) VALUES 
(
    'Pengembangan Website', 
    'Kami membangun website profesional untuk berbagai kebutuhan bisnis Anda.', 
    'fas fa-globe', 
    'https://images.unsplash.com/photo-1547658719-da2b51169166?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1528&q=80', 
    '["Company Profile", "E-commerce", "Web Application", "Landing Page"]'
),
(
    'Aplikasi Mobile', 
    'Pengembangan aplikasi mobile untuk platform Android dan iOS.', 
    'fas fa-mobile-alt', 
    'https://images.unsplash.com/photo-1555774698-0b77e0d5fac6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80', 
    '["Android & iOS", "Hybrid (Flutter)", "Progressive Web Apps", "Enterprise Mobility"]'
),
(
    'Sistem Enterprise', 
    'Solusi terintegrasi untuk manajemen bisnis skala enterprise.', 
    'fas fa-server', 
    'https://images.unsplash.com/photo-1460925895917-afdab827c52f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1415&q=80', 
    '["ERP & CRM", "Sistem Inventory", "HR Management", "Business Intelligence"]'
),
(
    'UI/UX Design', 
    'Desain antarmuka yang menarik dan pengalaman pengguna yang optimal.', 
    'fas fa-paint-brush', 
    'https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80', 
    '["User Research", "Wireframing", "Prototyping", "Usability Testing"]'
);

-- Data portofolio
INSERT INTO portfolio (
    title, 
    description, 
    image_url, 
    client_name, 
    project_date, 
    technologies, 
    service_id
) VALUES 
(
    'Sistem POS Retail', 
    'Sistem point-of-sale untuk retail chain dengan 50+ cabang, dibangun dengan Laravel dan Vue.js.', 
    'https://images.unsplash.com/photo-1551434678-e076c223a692?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80', 
    'Retail Chain Indonesia', 
    '2023-05-15', 
    '["Laravel", "Vue.js", "MySQL"]', 
    1
),
(
    'Aplikasi Logistic', 
    'Sistem manajemen logistik dengan fitur track-and-trace real-time untuk perusahaan distribusi.', 
    'https://images.unsplash.com/photo-1600880292203-757bb62b4baf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80', 
    'Logistik Express', 
    '2023-08-22', 
    '["Node.js", "React", "MongoDB"]', 
    3
),
(
    'Platform E-commerce', 
    'Marketplace UMKM dengan integrasi pembayaran digital dan sistem referral.', 
    'https://images.unsplash.com/photo-1556740738-b6a63e27c4df?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80', 
    'UMKM Digital', 
    '2023-03-10', 
    '["PHP", "JavaScript", "PostgreSQL"]', 
    1
);

-- Data social media
INSERT INTO social_media (
    platform, 
    url, 
    icon_class, 
    is_active, 
    display_order
) VALUES 
('Facebook', 'https://facebook.com', 'fab fa-facebook-f', TRUE, 1),
('Twitter', 'https://twitter.com', 'fab fa-twitter', TRUE, 2),
('LinkedIn', 'https://linkedin.com', 'fab fa-linkedin-in', TRUE, 3),
('Instagram', 'https://instagram.com', 'fab fa-instagram', TRUE, 4),
('WhatsApp', 'https://wa.me/6281380804529', 'fab fa-whatsapp', TRUE, 5),
('Telegram', 'https://t.me', 'fab fa-telegram', TRUE, 6);