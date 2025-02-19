-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 22, 2025 at 10:56 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qm_and_homes`
--

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `agency_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `license_number` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `specialties` text COLLATE utf8mb4_general_ci,
  `biography` text COLLATE utf8mb4_general_ci,
  `experience` text COLLATE utf8mb4_general_ci,
  `languages` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`id`, `user_id`, `name`, `email`, `agency_name`, `license_number`, `specialties`, `biography`, `experience`, `languages`, `contact`, `created_at`, `updated_at`) VALUES
('9d52e170-cda2-4b72-8885-1dd6352fad5b', 111, 'Sarah Thompson', 'sarah.thompson@homerealty.com', 'Home Realty Group', 'RE-09876543', 'Residential Sales, First-Time Homebuyers, Relocation Assistance', 'Sarah Thompson has been a dedicated real estate agent for over 12 years, helping families and individuals find their dream homes. Her deep knowledge of the local market and commitment to client satisfaction make her a trusted partner in the home buying and selling process. Sarah’s passion for real estate is evident in every transaction, ensuring her clients feel informed and confident at each step.', '12 years', 'English, Spanish', '(555) 123-4567', '2024-10-24 13:02:35', '2024-10-24 13:02:35'),
('9d52e1ba-8bf3-4110-9785-2c0b09199ab0', 112, 'James Wu', 'james.wu@urbanproperties.com', 'Urban Properties', 'RE-12345678', 'Commercial Real Estate, Investment Properties, Leasing', 'With a background in finance and over 15 years of experience in real estate, James Wu specializes in commercial properties and investment opportunities. His analytical approach and strategic insights have helped numerous clients maximize their investments, making him a go-to expert in the market.', '15 years', 'English, Mandarin', '(555) 987-6543', '2024-10-24 13:03:24', '2024-10-24 13:03:24'),
('9d52e202-cd57-4c0b-a1b2-be63b8a1e9f4', 113, 'Maria Garcia', 'maria.garcia@luxuryhomes.com', 'Luxury Homes International', 'RE-13579246', 'Luxury Properties, International Clients, High-End Condominiums', 'Maria Garcia is known for her expertise in the luxury real estate market, where she has been excelling for over 10 years. With a keen eye for detail and a global network of clients, Maria is passionate about finding the perfect property that matches her clients\' unique lifestyles and needs.', '10 years', 'English, Spanish, French', '(555) 246-8100', '2024-10-24 13:04:11', '2024-10-24 13:04:11'),
('9d52e4a9-d43f-47e1-a148-a677e7fa5388', 129, 'David Patel', 'david.patel@coastalproperties.com', 'Coastal Properties Realty', 'RE-87654321', 'Waterfront Properties, Vacation Homes, Real Estate Investments', 'David Patel has been in the real estate business for over 8 years, specializing in waterfront and vacation properties along the coast. His extensive knowledge of the local market and dedication to finding the right fit for his clients has earned him a stellar reputation. David prides himself on delivering personalized service, helping both buyers and investors navigate the complexities of real estate transactions.', '8 Years', 'English', '(555) 567-8901', '2025-01-03 19:06:24', '2024-10-24 13:11:36'),
('9de90da4-18b4-48d2-bdaf-686ce02303cb', 132, 'bilal Testign', 'bill@test.com', 'ab', 'ab324', 'abc', 'abc', 'anc', 'eng', '(555) 246-8100', '2025-01-07 04:40:23', '2025-01-07 04:40:23');

-- --------------------------------------------------------

--
-- Table structure for table `amenities`
--

CREATE TABLE `amenities` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
('9d098029-d3d2-4492-b097-791d172b4ee9', 'The Strip', 'A vibrant stretch of Las Vegas Boulevard lined with world-famous casinos, hotels, and entertainment venues. It\'s a hub for nightlife, dining, and shopping, making it a must-visit for tourists.', '2024-09-18 01:35:04', '2024-09-18 01:35:04'),
('9dc96d92-9c0c-4be6-97f7-e75d0259c9a8', 'Large homesites', 'Enjoy spacious living with generously-sized lots, offering plenty of room for outdoor activities and landscaping.', '2024-12-22 11:22:03', '2024-12-22 11:22:03'),
('9dc96dbc-60bc-434b-aff5-12526beeedee', 'Open floorplans', 'Experience modern living with airy, open-concept layouts that create a seamless flow between living, dining, and kitchen areas.', '2024-12-22 11:22:30', '2024-12-22 11:22:30'),
('9dc96ddb-0c16-48ca-9350-023d0b02a69e', 'Stunning mountain views', 'Take in breathtaking panoramic vistas of the surrounding mountains, providing a serene and picturesque backdrop to your home.', '2024-12-22 11:22:50', '2024-12-22 11:22:50'),
('9dc96dfa-0788-4df1-8541-c2a4c84843df', 'Low monthly HOA dues', 'Benefit from affordable homeowners association fees, making your community amenities and services cost-effective.', '2024-12-22 11:23:10', '2024-12-22 11:23:10'),
('9dc96e91-a9ef-43f2-aa89-739430e87a20', 'Quick access to Interstate 515', 'Conveniently located near Interstate 515, ensuring easy commutes and travel to various parts of the city and beyond.', '2024-12-22 11:24:50', '2024-12-22 11:24:50'),
('9dc96eab-5804-4746-83dc-67761ff7aab1', 'Near shopping and dining options', 'Enjoy the convenience of having numerous shopping centers and dining establishments just a short drive away, catering to all your needs and preferences.', '2024-12-22 11:25:07', '2024-12-22 11:25:07');

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_general_ci NOT NULL,
  `author_id` int NOT NULL,
  `image` int NOT NULL,
  `status` tinytext COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `title`, `content`, `author_id`, `image`, `status`, `created_at`, `updated_at`) VALUES
('9d2e76d1-1ba5-4e79-8ca5-ff2aa7453955', 'Top 5 Things to Consider When Buying a New Home', '<p>Buying a new home is a significant investment and an exciting milestone. Here are the top five factors to keep in mind to make a confident choice:</p><ol><li><strong>Location and Neighborhood:</strong> Location plays a pivotal role in your daily life, impacting commute times, local amenities, and neighborhood culture. Research the area’s schools, parks, and upcoming developments to ensure it meets your long-term needs.</li><li><strong>Budget and Affordability:</strong> It’s essential to have a clear budget. Beyond the initial price, factor in ongoing costs like property taxes, maintenance, and utilities to get a full picture of affordability.</li><li><strong>Home Size and Layout:</strong> Assess your space requirements. Consider factors like the number of bedrooms, outdoor space, and layout to ensure it aligns with your current lifestyle and future needs.</li><li><strong>Resale Value:</strong> While you may plan to stay long-term, it’s wise to think about the home’s resale value. Research local market trends and how properties in the area appreciate over time.</li><li><strong>Property Condition:</strong> A home inspection is essential to uncover potential repairs or renovations. This can save you from unexpected expenses and help in negotiations with the seller.</li></ol><p>By focusing on these key factors, you can navigate the home-buying process with greater clarity and make a choice that feels right for years to come.</p><p><br></p><p><strong>Title:</strong> <em>\"The Ultimate Guide to Selling Your Home Quickly and Effectively\"</em></p><p><strong>Content:</strong></p><p>Selling a home can be both exciting and challenging. Here’s a comprehensive guide to help you sell your property faster and for the best price:</p><ol><li><strong>Enhance Curb Appeal:</strong> First impressions are crucial. Simple updates, like painting the front door, maintaining landscaping, and adding outdoor lighting, can make your home look more inviting.</li><li><strong>Stage for Success:</strong> Staging helps buyers envision themselves in the space. Declutter, add neutral decor, and arrange furniture to highlight each room\'s functionality and flow.</li><li><strong>Set the Right Price:</strong> Work with a local real estate agent to assess the market and set a competitive price. Overpricing can lead to longer listing times, while underpricing can reduce profits.</li><li><strong>Effective Marketing:</strong> High-quality photos, virtual tours, and online listings on popular property sites are essential for reaching potential buyers. Consider social media marketing to broaden visibility.</li><li><strong>Be Flexible with Showings:</strong> Accommodate potential buyers’ schedules to maximize showings. The more people who see your home, the higher the chances of receiving an offer.</li></ol><p>Selling your home quickly requires a combination of smart pricing, effective marketing, and attention to detail in presentation. Following these steps will make your selling process smoother and more successful.</p>', 1, 164, '1', '2024-10-06 10:34:34', '2024-12-19 16:36:39'),
('9d2e794e-3237-411a-9c96-54a3609c4e90', 'Why Invest in Real Estate? The Top Benefits Explained', '<p>Real estate is a powerful investment tool for building long-term wealth. Here’s why it’s worth considering for your portfolio:</p><ol><li><strong>Steady Income:</strong> Rental properties can generate a reliable income stream, especially in high-demand areas. This passive income can be used to cover mortgage payments, maintenance, or saved for other investments.</li><li><strong>Property Appreciation:</strong> Over time, real estate values generally increase, providing capital appreciation on your investment. Researching growing markets can help maximize your returns.</li><li><strong>Tax Benefits:</strong> Real estate investors enjoy tax deductions on mortgage interest, property taxes, and even property management expenses, reducing their overall tax liability.</li><li><strong>Leverage and Diversification:</strong> Real estate allows for leveraged investments, meaning you can buy property with a mortgage and invest less upfront. This diversifies your portfolio, which can reduce risk.</li><li><strong>Tangible Asset:</strong> Unlike stocks or bonds, real estate is a tangible asset you can see and control. This makes it a stable, low-volatility option in times of economic uncertainty.</li></ol><p>Investing in real estate offers unique advantages that make it a solid choice for wealth building. With proper research and a long-term outlook, it can be a rewarding addition to any investment portfolio.</p>', 1, 495, '1', '2024-10-06 10:41:32', '2024-10-23 12:46:06'),
('9d2e797f-6abd-4d2e-9ebe-48a0f3ef579e', 'How to Find the Perfect Rental Property: A Renter’s Checklist', '<p>Finding a rental property that meets your needs and lifestyle requires careful planning. Here’s a checklist to help you find the perfect place:</p><ol><li><strong>Location and Commute:</strong> Prioritize areas that are close to work, schools, and public transport. Visit at different times of the day to get a feel for the neighborhood.</li><li><strong>Amenities and Features:</strong> Make a list of must-have amenities (e.g., parking, in-unit laundry) and conveniences (e.g., gym, pool). This will help narrow down options that meet your lifestyle.</li><li><strong>Budgeting Beyond Rent:</strong> In addition to rent, consider utilities, parking fees, and potential move-in costs. Sticking to a budget ensures you can comfortably manage monthly expenses.</li><li><strong>Lease Terms:</strong> Carefully read the lease agreement for details on maintenance responsibilities, pet policies, and security deposit returns. Clarify any questions with the landlord.</li><li><strong>Safety and Security:</strong> Check that the property has secure entry points, smoke detectors, and an emergency exit plan. Knowing that you’re in a safe environment brings peace of mind.</li></ol><p>Following these steps can help you secure a rental that not only fits your budget but also feels like home.</p>', 1, 496, '1', '2024-10-06 10:42:04', '2024-10-23 12:46:25');

-- --------------------------------------------------------

--
-- Table structure for table `builders`
--

CREATE TABLE `builders` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `builders`
--

INSERT INTO `builders` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
('9d09a566-6d4c-4dec-bbf1-75df4305c8e1', 'Builder 1', 'Descriptions', '2024-09-18 03:19:12', '2024-09-18 03:19:12'),
('9d09a7ab-a328-473b-9d44-b3637e545501', 'Builder 1', 'Descriptions', '2024-09-18 03:25:33', '2024-09-18 03:25:33'),
('9d408aa7-ba82-42a3-b0a7-6dda8017e87a', 'Builder Zia', 'Descriptios..', '2024-10-15 10:14:57', '2024-10-15 11:35:03'),
('9d40a62c-4ea2-4ec6-9119-3de21a5ed8e1', 'Builder X', 'Descriptions...', '2024-10-15 11:31:53', '2024-10-15 11:35:27'),
('9d885b61-53f4-4b3a-8106-09f3c37618fc', 'asdfasdf', 'asdfadfasd', '2024-11-20 15:02:22', '2024-11-20 15:02:22');

-- --------------------------------------------------------

--
-- Table structure for table `builders_communities`
--

CREATE TABLE `builders_communities` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `community_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `builder_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `builders_communities`
--

INSERT INTO `builders_communities` (`id`, `community_id`, `builder_id`, `created_at`, `updated_at`) VALUES
('9d40aafa-572e-430b-9adc-8e56c3ddfce3', '9d264828-aca0-48a7-afcf-8399b433edc7', '9d09a566-6d4c-4dec-bbf1-75df4305c8e1', '2024-10-15 11:45:20', '2024-10-15 11:45:20'),
('9d40ab16-518c-4010-a751-fc25c57cef92', '9d2647f5-93a7-4712-b440-37c679f8a9ae', '9d408aa7-ba82-42a3-b0a7-6dda8017e87a', '2024-10-15 11:45:38', '2024-10-15 11:45:38'),
('9d52e7fd-4f25-4a10-b6a4-6e7dfcf896cf', '9d2647a1-4043-4c93-a4f3-9b1789d2bc8d', '9d09a7ab-a328-473b-9d44-b3637e545501', '2024-10-24 13:20:50', '2024-10-24 13:20:50');

-- --------------------------------------------------------

--
-- Table structure for table `carousels`
--

CREATE TABLE `carousels` (
  `id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `image_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `order_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carousels`
--

INSERT INTO `carousels` (`id`, `image_id`, `description`, `order_id`, `created_at`, `updated_at`) VALUES
('9d27b9e5-2f41-4588-b043-f1f09f5a1c29', '277', 'Las Vegas properties feature innovative designs, close to world-class entertainment, shopping, and dining experiences.\n', 0, '2024-10-03 02:11:20', '2024-10-23 12:57:24'),
('9d27b9fb-3fb4-4427-860c-055ee79ee725', '278', 'Find your dream home in Las Vegas, from cozy condos to sprawling estates in prime locations.', 2, '2024-10-03 02:11:35', '2024-10-23 12:56:55'),
('9d27ba10-4381-4da2-82fa-a9c0b4960013', '279', 'Las Vegas properties feature innovative designs, close to world-class entertainment, shopping, and dining experiences.\n\n', 1, '2024-10-03 02:11:49', '2024-10-23 12:57:24');

-- --------------------------------------------------------

--
-- Table structure for table `communities`
--

CREATE TABLE `communities` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `location` text COLLATE utf8mb4_general_ci,
  `longitude` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `amenity_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hoa_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `neighborhood_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `las_vegas_region_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `main_image` int DEFAULT NULL,
  `files` text COLLATE utf8mb4_general_ci,
  `map_location` text COLLATE utf8mb4_general_ci,
  `legal_subdivision` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nearby_properties` text COLLATE utf8mb4_general_ci,
  `masterplan` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sub_association` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cic` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lid` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cid` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sid_lid_fee` decimal(10,2) DEFAULT NULL,
  `sid_lid_payment_frequency` text COLLATE utf8mb4_general_ci,
  `proximity_to_strip` decimal(8,2) DEFAULT NULL,
  `proximity_to_airport` decimal(8,2) DEFAULT NULL,
  `nearby_attractions` text COLLATE utf8mb4_general_ci,
  `banner` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `communities`
--

INSERT INTO `communities` (`id`, `name`, `description`, `location`, `longitude`, `latitude`, `amenity_id`, `hoa_id`, `neighborhood_id`, `las_vegas_region_id`, `main_image`, `files`, `map_location`, `legal_subdivision`, `nearby_properties`, `masterplan`, `sub_association`, `cic`, `lid`, `cid`, `sid_lid_fee`, `sid_lid_payment_frequency`, `proximity_to_strip`, `proximity_to_airport`, `nearby_attractions`, `banner`, `created_at`, `updated_at`) VALUES
('9d264764-2e21-4869-b7e6-692c38c02bbd', 'Serenity Hills', 'Serenity Hills offers scenic parks, safe neighborhoods, and modern amenities, creating a harmonious community perfect for families and individuals to thrive.', 'Near major shopping areas.', '-115.1607', '36.1203', NULL, '9d09b3e5-20ea-4ad4-a16d-6d328bc8750e', NULL, NULL, 1011, '[508,509,510,511,996,997,998,999,1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010]', '36.1234, -115.1234', 'West', '5', 'Serenity Masterplan', 'Yes', 'No', 'Yes', '123456', 150.00, 'Monthly', 5.00, 15.00, 'Red Rock Canyon, Summerlin Mall', 1012, '2024-10-02 03:55:20', '2024-12-31 16:17:44'),
('9d2647a1-4043-4c93-a4f3-9b1789d2bc8d', 'Oasis Gardens', 'A peaceful community with modern amenities.', 'Near major shopping areas.', '', '', NULL, '9d09b3e5-20ea-4ad4-a16d-6d328bc8750e', NULL, NULL, 87, '[79,80,81,82,83,84,85,86]', '36.1234, -115.1234', 'West', '5', 'Serenity Masterplan', 'Yes', 'No', 'Yes', '123456', 150.00, 'Monthly', 5.00, 15.00, 'Red Rock Canyon, Summerlin Mall', NULL, '2024-10-02 03:56:00', '2024-10-02 03:56:00'),
('9d2647f5-93a7-4712-b440-37c679f8a9ae', 'Desert Oasis', 'Desert Oasis is a serene community that combines the beauty of the desert with modern luxury. Featuring breathtaking landscapes, lush gardens, and calming water features.', 'Near major shopping areas.', '', '', NULL, '9d09b3e5-20ea-4ad4-a16d-6d328bc8750e', NULL, NULL, 94, '[88,89,90,91,92,93]', '36.1234, -115.1234', 'West', '5', 'Serenity Masterplan', 'Yes', 'No', 'Yes', '123456', 150.00, 'Monthly', 5.00, 15.00, 'Red Rock Canyon, Summerlin Mall', NULL, '2024-10-02 03:56:55', '2024-10-03 23:19:10'),
('9d264828-aca0-48a7-afcf-8399b433edc7', 'Mountain View Estates', 'A peaceful community with modern amenities.', 'Near major shopping areas.', '', '', NULL, '9d09c924-ed0a-445f-8860-fa75bd663b85', NULL, NULL, 101, '[95,96,97,98,99,100]', '36.1234, -115.1234', 'West', '5', 'Serenity Masterplan', 'Yes', 'No', 'Yes', '123456', 150.00, 'Monthly', 5.00, 15.00, 'Red Rock Canyon, Summerlin Mall', NULL, '2024-10-02 03:57:29', '2024-10-02 03:57:29'),
('9d264864-541a-47f7-9990-17e079da88e7', 'Royal Ridge', 'A peaceful community with modern amenities.', 'Near major shopping areas.', '', '', NULL, '9d09c924-ed0a-445f-8860-fa75bd663b85', NULL, NULL, 107, '[102,103,104,105,106]', '36.1234, -115.1234', 'West', '5', 'Serenity Masterplan', 'Yes', 'No', 'Yes', '123456', 150.00, 'Monthly', 5.00, 15.00, 'Red Rock Canyon, Summerlin Mall', NULL, '2024-10-02 03:58:08', '2024-10-02 03:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `community_amenities`
--

CREATE TABLE `community_amenities` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `community_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `amenity_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `community_amenities`
--

INSERT INTO `community_amenities` (`id`, `community_id`, `amenity_id`, `created_at`, `updated_at`) VALUES
('9ddbf22d-07d3-4c71-ac75-82a1debdc4a0', '9d264764-2e21-4869-b7e6-692c38c02bbd', '9d098029-d3d2-4492-b097-791d172b4ee9', '2024-12-31 16:17:44', '2024-12-31 16:17:44');

-- --------------------------------------------------------

--
-- Table structure for table `community_las_vegas_regions`
--

CREATE TABLE `community_las_vegas_regions` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `community_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `las_vegas_regions_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `community_neighborhoods`
--

CREATE TABLE `community_neighborhoods` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `community_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `neighborhood_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `community_neighborhoods`
--

INSERT INTO `community_neighborhoods` (`id`, `community_id`, `neighborhood_id`, `created_at`, `updated_at`) VALUES
('9ddbf22d-031b-4e91-a9a7-e1f115a285e3', '9d264764-2e21-4869-b7e6-692c38c02bbd', '9d098d4f-88e9-4635-9122-934b214d6710', '2024-12-31 16:17:44', '2024-12-31 16:17:44');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_general_ci,
  `contacted_from` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `parent_id`, `name`, `email`, `phone`, `subject`, `message`, `contacted_from`, `created_at`, `updated_at`) VALUES
('9d2c8c09-e76c-4036-8a42-d8405f9f397c', NULL, 'Waseem Khan', 'waseem@test.example', '2501000', NULL, 'Test', NULL, '2024-10-05 11:42:15', '2024-10-05 11:42:15'),
('9d2c8d75-9c2a-4ffe-9c8d-7dffd4408ea9', '9d2c8c09-e76c-4036-8a42-d8405f9f397c', 'Waseem Khan', 'waseem@test.example', '2501000', 'Information on Service 1 in Our System', 'test', NULL, '2024-10-05 11:46:14', '2024-10-05 11:46:14'),
('9d2c8d9d-6041-47b3-8cd6-e9f63c4c028e', '9d2c8c09-e76c-4036-8a42-d8405f9f397c', 'Waseem Khan', 'waseem@test.example', '2501000', 'Information on Service 1 in Our System', 'test', NULL, '2024-10-05 11:46:40', '2024-10-05 11:46:40'),
('9d2c8de4-4f08-427d-916a-1efa01413d15', '9d2c8c09-e76c-4036-8a42-d8405f9f397c', 'Waseem Khan', 'waseem@test.example', '2501000', 'ets', 'test', NULL, '2024-10-05 11:47:26', '2024-10-05 11:47:26'),
('9d3fd6d6-df9d-4d79-b0c9-b6be41173bca', NULL, 'Bilal Hussain', 'bill@test.example', '325212000', NULL, 'Hello! \nthis is Bilal .', 'Agent', '2024-10-15 01:52:09', '2024-10-15 01:52:09'),
('9d3fd91e-06ec-47a7-aa19-5d4b9447c8f5', NULL, 'Wasy Black', 'wasy@black.exampl', '235214524', NULL, 'Message from wasy.', 'Customer', '2024-10-15 01:58:31', '2024-10-15 01:58:31'),
('9d3fd9b6-2c89-4996-bcf3-90aab3ba03d2', '9d3fd91e-06ec-47a7-aa19-5d4b9447c8f5', 'Wasy Black', 'wasy@black.exampl', '235214524', 'Information on Service 1 in Our System', 'Information on Service 1 in Our System', NULL, '2024-10-15 02:00:10', '2024-10-15 02:00:10'),
('9d3fda17-535d-49c1-95e3-59b400509602', '9d3fd91e-06ec-47a7-aa19-5d4b9447c8f5', 'Wasy Black', 'wasy@black.exampl', '235214524', 'Information on Service 1 in Our System', 'Information on Service 1 in Our System', NULL, '2024-10-15 02:01:14', '2024-10-15 02:01:14'),
('9d40b718-c573-4dc0-b380-192e809ba364', NULL, 'Syed Umar', 'syed-umar@hotmail.com', '923359333211', NULL, 'Hi \nI want a home.', 'Customer', '2024-10-15 12:19:13', '2024-10-15 12:19:13');

-- --------------------------------------------------------

--
-- Table structure for table `customer_agents_connections`
--

CREATE TABLE `customer_agents_connections` (
  `id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `customer_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `agent_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `property_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `date` date NOT NULL,
  `current_status` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `terms_agreed` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `agreement_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_agents_connections`
--

INSERT INTO `customer_agents_connections` (`id`, `customer_id`, `agent_id`, `property_id`, `date`, `current_status`, `terms_agreed`, `agreement_type`, `created_at`, `updated_at`) VALUES
('9de1c6c9-f234-4315-8162-2afcf08139c3', '126', '9d52e4a9-d43f-47e1-a148-a677e7fa5388', '9ddbee46-98c0-4f0b-829f-a68827609ce3', '2025-01-03', 'Completed', 'true', 'single', '2025-01-03 13:51:23', '2025-01-03 14:07:33');

-- --------------------------------------------------------

--
-- Table structure for table `customer_visiting_homes_history`
--

CREATE TABLE `customer_visiting_homes_history` (
  `id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `customer_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `home_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_visiting_homes_history`
--

INSERT INTO `customer_visiting_homes_history` (`id`, `customer_id`, `home_id`, `ip_address`, `created_at`, `updated_at`) VALUES
('9dc61745-633e-4633-9901-ef692cc74d99', '129', 'd3b3a5dd-77ad-411a-afd7-5410f2214707', '127.0.0.1', '2024-12-20 19:33:15', '2024-12-20 19:33:15'),
('9dc6201b-cc77-4519-a671-1f7e94f9070e', '129', 'a16e1314-3ed3-4f96-b9e1-bd286ed1b4ba', '127.0.0.1', '2024-12-20 19:57:57', '2024-12-20 19:57:57'),
('9dcbe6b2-a6c8-43a4-ad20-bf5aeb08ba36', '130', '9dcbde6f-4184-4d4e-b317-d7145497b7e2', '127.0.0.1', '2024-12-23 16:52:23', '2024-12-23 16:52:23'),
('9de1c6b9-9b04-445d-84ab-d1ec3e95742b', '126', '9ddbee46-98c0-4f0b-829f-a68827609ce3', '127.0.0.1', '2025-01-03 13:51:13', '2025-01-03 13:51:13');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `description` text NOT NULL,
  `registeration_link` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `date`, `description`, `registeration_link`, `image`, `created_at`, `updated_at`) VALUES
('9d620b35-42bf-494e-870d-f18a61b32090', 'Realtor Networking Mixer', '2024-11-20', '<p class=\"ql-align-justify\">Join us for an evening of networking <span style=\"color: rgb(0, 138, 0);\">with fellow realtors!</span> This mixer is a perfect opportunity to exchange ideas, share listings, and<span style=\"color: rgb(255, 255, 0);\"> </span><span style=\"background-color: rgb(255, 255, 0);\" class=\"ql-font-serif\">build valuable connections</span> within the real estate community.</p>', 'realtor.events.example.com', '534', '2024-11-01 01:56:43', '2024-11-02 01:55:35'),
('9d640d87-40ea-4b6f-8649-25d29caeab49', 'Homebuyer Seminar', '2025-11-04', '<p>Are you <strong>ready </strong>to buy your dream home? Our expert panel will guide you through the <strong>homebuying </strong>process, from securing financing to making the best offers. <span style=\"color: rgb(230, 0, 0);\">Don’t miss this chance to ask your questions</span>!</p>', 'realtor.events.example.com', '165', '2024-11-02 01:54:52', '2024-12-19 16:36:58'),
('9d640e15-a5e9-4e1c-9f40-439abb3a4fd9', 'Real Estate Investment Workshop', '2024-12-06', '<p><span style=\"color: rgb(230, 0, 0);\">Learn the secrets</span> of successful real estate <span style=\"color: rgb(230, 0, 0);\">investing</span>! This workshop will cover everything from market analysis to property management, helping you make informed investment decisions.</p>', 'realtor.events.example.com', '535', '2024-11-02 01:56:25', '2024-11-02 02:57:26'),
('9d640e91-06cd-410c-9cf7-8bf62aa30f61', 'Open House Showcase', '2024-11-22', '<p>Discover beautiful properties at our Open House Showcase! Explore various homes on the market, meet the listing agents, and find out what makes each property unique.Discover beautiful properties at our Open House Showcase! Explore various homes on the market, meet the listing agents, and find out what makes each property unique.</p>', 'realtor.events.example.com', '536', '2024-11-02 01:57:46', '2024-11-02 01:58:05');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `connection` text COLLATE utf8mb4_general_ci NOT NULL,
  `queue` text COLLATE utf8mb4_general_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `floorplan`
--

CREATE TABLE `floorplan` (
  `id` int NOT NULL,
  `property_id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `size` decimal(10,2) NOT NULL,
  `beds` int NOT NULL,
  `full_baths` int NOT NULL,
  `half_baths` int NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `special_features` text,
  `image` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `floorplan`
--

INSERT INTO `floorplan` (`id`, `property_id`, `name`, `size`, `beds`, `full_baths`, `half_baths`, `price`, `special_features`, `image`, `created_at`, `updated_at`) VALUES
(5, '9e08341f-5088-4d48-b85e-afc86cfe454a', 'P1', 34234.00, 3, 3, 3, 234234.00, 'test', NULL, '2025-01-22 16:18:33', '2025-01-22 16:18:33'),
(6, '9e08341f-5088-4d48-b85e-afc86cfe454a', 'Plan 2', 234234.00, 3, 3, 3, 3434.00, 'Testst', NULL, '2025-01-22 16:18:33', '2025-01-22 16:18:33'),
(7, '9e08341f-5088-4d48-b85e-afc86cfe454a', 'Floor Plan 3', 34532535.00, 4, 4, 4, 35345.00, 'Test', NULL, '2025-01-22 16:18:33', '2025-01-22 16:18:33');

-- --------------------------------------------------------

--
-- Table structure for table `hoa`
--

CREATE TABLE `hoa` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fee` decimal(8,2) DEFAULT NULL,
  `frequency` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `master_plan` tinyint(1) NOT NULL DEFAULT '0',
  `sub_association` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hoa`
--

INSERT INTO `hoa` (`id`, `name`, `fee`, `frequency`, `master_plan`, `sub_association`, `created_at`, `updated_at`) VALUES
('9d09b3e5-20ea-4ad4-a16d-6d328bc8750e', 'Canyon Vista Homeowners Association', 130.00, 'Monthly', 1, 1, '2024-09-18 03:59:44', '2024-09-18 04:57:57'),
('9d09c8ef-0178-4a5e-ab20-aeaee9749fb2', 'Sunset Ridge Community Association', 150.00, 'Quarterly', 1, 1, '2024-09-18 04:58:33', '2024-09-18 04:58:33'),
('9d09c924-ed0a-445f-8860-fa75bd663b85', 'Desert Springs Homeowners Association', 230.00, 'Yearly', 0, 1, '2024-09-18 04:59:09', '2024-09-18 04:59:09'),
('9dc96fc4-f88c-4b97-8e5d-338997b9460b', 'Luna Vista HOA', 222.00, 'Monthly', 1, 1, '2024-12-22 11:28:11', '2024-12-22 11:28:11');

-- --------------------------------------------------------

--
-- Table structure for table `incentives`
--

CREATE TABLE `incentives` (
  `id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `interest_rate_first_year` double(8,2) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `incentive_banner` int DEFAULT NULL,
  `builder_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `incentives`
--

INSERT INTO `incentives` (`id`, `title`, `description`, `start_date`, `end_date`, `interest_rate_first_year`, `status`, `incentive_banner`, `builder_id`, `created_at`, `updated_at`) VALUES
('9d2ad55f-982b-43dc-a1bb-f32456ac7e6d', 'Inventory Home Incentive', '<p><span style=\"color: rgb(41, 80, 59);\">Get up to $5,000 towards closing costs &amp; up to $1% of your loan amount (up to $5,000) towards interest rate buy down when you use a preferred vendor on an Inventory Home!</span></p>', '2024-10-04', '2024-11-18', 20.00, 1, 539, '9d408aa7-ba82-42a3-b0a7-6dda8017e87a', '2024-10-04 15:15:39', '2024-12-20 19:58:09'),
('9d2ad560-c7f4-4e8f-b0b8-79caa3fab0d0', 'Luxury Living at The Strip', '<blockquote><span class=\"hljs-string\">Experience unparalleled luxury with our latest homes located on The Strip. Enjoy world-class amenities and breathtaking views.</span></blockquote>', '2027-10-13', '2021-11-09', 25.00, 0, 182, '9d09a7ab-a328-473b-9d44-b3637e545501', '2024-10-04 15:15:40', '2024-12-19 18:46:03'),
('9d2ad561-ce01-474a-adb9-a5b196d74c53', 'Pre-Sale Incentive', '<p>Get up to $5,000 in design center upgrade credit &amp; 1% of your loan amount (up to $5,000) credited toward rate buy down when you use a preferred vendor on a pre-sale lot!</p>', '2024-10-02', '2024-11-04', 50.00, 0, 538, '9d09a566-6d4c-4dec-bbf1-75df4305c8e1', '2024-10-04 15:15:41', '2024-11-04 01:05:20'),
('9d2ad562-e4dc-47c1-bb00-b32ae2ff7089', 'Family-Friendly Community Special', '<p>Join our family-friendly community in Las Vegas with great schools, parks, and recreational activities. Limited-time incentives available!</p>', '2025-10-17', '2021-11-09', 25.20, 1, 1, '9d09a7ab-a328-473b-9d44-b3637e545501', '2024-10-04 15:15:42', '2024-12-20 19:28:03');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `code` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `rtl` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `rtl`, `created_at`, `updated_at`) VALUES
('9b55e0e2-0402-41b8-86a4-ee555fc2ecfd', 'English', 'US', 0, '2024-02-14 12:24:34', '2024-02-14 15:06:08'),
('9b650387-bf67-43e0-9c9a-56d66ea0e6e3', 'Spanish', 'ES', 0, '2024-02-22 00:58:52', '2024-02-22 00:58:52');

-- --------------------------------------------------------

--
-- Table structure for table `las_vegas_regions`
--

CREATE TABLE `las_vegas_regions` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `boundaries` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `las_vegas_regions`
--

INSERT INTO `las_vegas_regions` (`id`, `name`, `description`, `boundaries`, `created_at`, `updated_at`) VALUES
('9d099821-343f-4d67-a3dc-7f20ad2f4692', 'Red Rock Canyon', 'A stunning natural conservation area featuring towering red sandstone cliffs, hiking trails, and diverse wildlife. It’s a popular spot for outdoor enthusiasts, rock climbers, and photographers seeking breathtaking views.', 'Located about 20 miles west of the Las Vegas Strip. Take NV-159 W from the Strip, following signs to Red Rock Canyon. The scenic loop drive offers access to various trailheads and lookout points.', '2024-09-18 02:42:05', '2024-09-18 02:42:05'),
('9d099823-7f56-4133-b0f5-88feb7130fbf', 'Lake Mead National Recreation Area', 'A vast and beautiful outdoor area offering a variety of recreational activities such as boating, fishing, hiking, and camping. The lake, formed by the Hoover Dam, is a popular spot for water sports and scenic picnicking.', 'Located about 30 miles southeast of Las Vegas. Take US-93 S to NV-166 E. Follow signs to the recreation area. Multiple access points provide entry to beaches, trails, and visitor centers.', '2024-09-18 02:42:07', '2024-09-18 02:43:51'),
('9d099888-0c6a-4e53-ae94-79700208ecea', 'Downtown Arts District', 'A vibrant area known for its creative scene, featuring art galleries, studios, and eclectic shops. The district hosts regular art walks, festivals, and community events that celebrate local artists.', 'Situated just north of the Fremont Street Experience. From the Strip, head east on E Flamingo Rd, then turn north onto S 1st St. Look for colorful murals and signage indicating gallery openings.', '2024-09-18 02:43:13', '2024-09-18 02:43:13');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_08_04_075853_create_las_vegas_regions_table', 1),
(6, '2024_08_04_080425_create_builders_table', 1),
(7, '2024_08_04_081919_create_hoa_table', 1),
(8, '2024_08_04_082519_create_neighborhoods_table', 1),
(9, '2024_08_04_082730_create_amenities_table', 1),
(10, '2024_08_04_083333_create_communities_table', 2),
(11, '2024_08_04_085838_create_schools_table', 2),
(12, '2024_08_04_102346_create_builders_communities_table', 2),
(13, '2024_08_28_194600_drop_foreign_key_from_communities_table', 2),
(14, '2024_09_19_073133_create_community_amenities_table', 3),
(15, '2024_09_19_073134_create_community_las_vegas_regions_table', 3),
(16, '2024_09_19_073134_create_community_neighborhoods_table', 3),
(18, '2024_09_25_085240_create_properties_table', 4),
(19, '2024_09_25_091416_create_property_features_table', 5),
(21, '2024_09_26_094908_create_quick_move_in_homes_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `neighborhoods`
--

CREATE TABLE `neighborhoods` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `location` text COLLATE utf8mb4_general_ci,
  `amenities` text COLLATE utf8mb4_general_ci,
  `image` int DEFAULT NULL,
  `map_location` text COLLATE utf8mb4_general_ci,
  `nearby_properties` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `neighborhoods`
--

INSERT INTO `neighborhoods` (`id`, `name`, `description`, `location`, `amenities`, `image`, `map_location`, `nearby_properties`, `created_at`, `updated_at`) VALUES
('9d098d4f-88e9-4635-9122-934b214d6710', 'Sunset Valley', 'A vibrant residential neighborhood known for its family-friendly atmosphere, featuring a mix of modern homes and charming townhouses surrounded by parks and recreational spaces.', 'West of the Las Vegas Strip, easily accessible via major highways.', NULL, 3, '[Insert Google Maps link or coordinates here]', 'A range of single-family homes and townhouses, with listings available for sale or rent within walking distance to local amenities.', '2024-09-18 02:11:50', '2024-09-18 02:11:50'),
('9d098e0c-48fa-436f-b99b-b9a14cfca40f', 'Desert Oasis', 'A serene residential community characterized by lush landscaping and contemporary architecture. It offers a peaceful retreat from the hustle and bustle of the Strip, perfect for those seeking tranquility.', 'North Las Vegas, just a short drive from downtown.', '9d098029-d3d2-4492-b097-791d172b4ee9', 4, '[Insert Google Maps link or coordinates here]', 'Apartments and lofts, often with easy access to public transportation and local attractions.', '2024-09-18 02:13:54', '2024-09-18 02:13:54'),
('9d098e10-778c-4539-b2ee-f005aa019550', 'Desert Oasis', 'A serene residential community characterized by lush landscaping and contemporary architecture. It offers a peaceful retreat from the hustle and bustle of the Strip, perfect for those seeking tranquility.', 'North Las Vegas, just a short drive from downtown.', '9d098029-d3d2-4492-b097-791d172b4ee9', 5, '[Insert Google Maps link or coordinates here]', 'Apartments and lofts, often with easy access to public transportation and local attractions.', '2024-09-18 02:13:57', '2024-09-18 02:13:57'),
('9d09915c-7480-4706-b2ce-61598d0be958', 'Canyon Ridge', 'A picturesque neighborhood nestled at the foothills of the Spring Mountains, offering stunning views and a peaceful atmosphere. It’s perfect for nature lovers and those seeking outdoor activities.', 'Northwest Las Vegas, near hiking trails and natural parks.', '9d0980ca-5feb-4a53-916a-88c9d5128fdc', 6, '[Insert Google Maps link or coordinates here]', 'A mix of spacious single-family homes and custom-built properties with access to nature trails and parks.', '2024-09-18 02:23:10', '2024-09-18 02:23:10'),
('9d09950a-51a7-4d70-bed5-749ae10674ee', 'test', 'tet', 'test', '9d098029-d3d2-4492-b097-791d172b4ee9', NULL, 'est', 'test', '2024-09-18 02:33:28', '2024-09-18 02:33:28'),
('9dc9719b-63b1-472f-a0fd-be099bd619e9', 'North Las Vegas, NV', 'North Las Vegas is a vibrant community that combines suburban charm with urban convenience. Known for its growing economy, diverse real estate options, and family-friendly atmosphere, this area is a favorite for both homebuyers and investors alike.', 'North Las Vegas is located in Clark County, Nevada, within the Las Vegas Valley. It is situated to the north of Las Vegas and is home to Nellis Air Force Base.', '9dc96ddb-0c16-48ca-9350-023d0b02a69e', NULL, '36.201946, -115.120216', 'North Las Vegas has a variety of residential options, from affordable starter homes to spacious family properties and luxury estates. Some popular neighborhoods include:\n\nAliante: A master-planned community with modern homes, parks, and an 18-hole golf course.\nEldorado: Known for its family-friendly atmosphere and beautiful parks.\nCrestline: Offers affordable housing options and convenient access to shopping and dining.', '2024-12-22 11:33:19', '2024-12-22 11:33:19');

-- --------------------------------------------------------

--
-- Table structure for table `open_houses`
--

CREATE TABLE `open_houses` (
  `id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `property_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `open_houses`
--

INSERT INTO `open_houses` (`id`, `property_id`, `date`, `start_time`, `end_time`, `description`, `created_at`, `updated_at`) VALUES
('9dc60043-a28b-4440-a122-88bcf9c403a8', 'ef533cc3-8293-43c7-b936-c28fe208e34a', '2024-12-26', '06:30:00', '08:32:00', 'Explore this charming historic home at [Insert Address], featuring [Insert Number of Bedrooms] bedrooms, [Insert Number of Bathrooms] bathrooms, and [Insert Square Footage] square feet of living space. The property is available for auction, offering a rare opportunity to own a piece of history. Come visit during the open house to tour the home and place your bid. For more details, contact [Insert Contact Information].', '2024-12-20 18:28:55', '2024-12-20 18:28:55'),
('9dcbdd81-433b-4e73-a7b9-254ca9fb57e7', '9dcbdb5d-37f2-445a-b98b-d51f942f6c65', '2024-11-30', '02:30:00', '02:30:00', 'Tests', '2024-12-23 16:26:41', '2024-12-23 16:26:41');

-- --------------------------------------------------------

--
-- Table structure for table `our_promises`
--

CREATE TABLE `our_promises` (
  `id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `icon` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `our_promises`
--

INSERT INTO `our_promises` (`id`, `title`, `description`, `icon`, `created_at`, `updated_at`) VALUES
('9c594f0f-45ff-481c-ba40-3ad2d92feae1', 'Best price guarantee', 'We offer the most competitive prices in the market, backed by our Best Price Guarantee. If you find a better deal elsewhere, let us know, and we’ll refund the difference within 24 hours. Your satisfaction and peace of mind are our top priorities!', 54, '2024-06-22 11:32:04', '2024-10-24 09:20:12'),
('9c59582e-25d0-479e-a63f-b568fec9499c', 'Extraordinary Experiences', 'Our property specialists work closely with local partners to craft unique, well-rounded experiences tailored for small groups. Discover the perfect blend of comfort and adventure during your stay!', 55, '2024-06-22 11:57:34', '2024-10-24 09:20:43'),
('9c595c36-e412-49f2-82d4-58bc6b3fe01c', 'Everything is Taken Care Of', 'We streamline your property search and booking. Our Property Finder App offers 24/7 support, helping you discover homes tailored to your needs. Enjoy a seamless experience—your satisfaction is our priority!', 56, '2024-06-22 12:08:51', '2024-10-02 08:02:59');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_general_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'webToken', '4bbec3149c2af4572a0a3974dfed5234d5395093f2838f7a4a7fa8ef45ecbf57', '[\"*\"]', NULL, NULL, '2024-08-28 14:56:52', '2024-08-28 14:56:52'),
(2, 'App\\Models\\User', 1, 'webToken', 'e7cb297c68aeecbd2fe49d22c78162498f714ba97d509b533d943d70d94fa478', '[\"*\"]', NULL, NULL, '2024-08-28 14:58:15', '2024-08-28 14:58:15'),
(3, 'App\\Models\\User', 1, 'webToken', '30ffc9dc7454f9cfe8b0c537e118e509cf7e5af2cec66e03ef5b49295fb869c9', '[\"*\"]', NULL, NULL, '2024-08-30 16:01:08', '2024-08-30 16:01:08'),
(4, 'App\\Models\\User', 1, 'webToken', 'b6b247d62ccfd3c297fdb148d7927d540b0a803b7f3797016c9f8c995fedff47', '[\"*\"]', NULL, NULL, '2024-09-18 01:16:15', '2024-09-18 01:16:15'),
(5, 'App\\Models\\User', 1, 'webToken', '381b2c39be55ed430fcfb52790d27614de25bdeaa67d69d6167e12c13b2dd009', '[\"*\"]', NULL, NULL, '2024-09-19 02:24:05', '2024-09-19 02:24:05'),
(6, 'App\\Models\\User', 1, 'webToken', '4d84eba3016ce421f492006e687f8e4172ea9a7651ddafbd562ef287284d8e17', '[\"*\"]', NULL, NULL, '2024-09-23 01:51:55', '2024-09-23 01:51:55'),
(7, 'App\\Models\\User', 1, 'webToken', '8a0bcacf298508bd0325d8afda3f0b8889f2560a4c81d1a3b8d7198424df9aa6', '[\"*\"]', NULL, NULL, '2024-09-23 01:52:10', '2024-09-23 01:52:10'),
(8, 'App\\Models\\User', 1, 'webToken', 'a2f35099fe844e7c90ef0339e1f2c5fde290a2d68ddf22429a557f2fa913eef8', '[\"*\"]', NULL, NULL, '2024-09-24 03:57:48', '2024-09-24 03:57:48'),
(9, 'App\\Models\\User', 1, 'webToken', '7594b19b4233d597df253e9bac73874a9459fe7f70f571d15885494d3f74cf6d', '[\"*\"]', NULL, NULL, '2024-09-25 01:37:18', '2024-09-25 01:37:18'),
(10, 'App\\Models\\User', 1, 'webToken', '28683df77ea57867a3b04182ebf3b6e220b507532143bf7318a92506384fa024', '[\"*\"]', NULL, NULL, '2024-09-26 00:56:25', '2024-09-26 00:56:25'),
(11, 'App\\Models\\User', 1, 'webToken', 'f293a0b07eba77da9be2b3ea3dcb531861045e5319b3e7d614fb9afaf1fe68b9', '[\"*\"]', NULL, NULL, '2024-09-26 04:43:02', '2024-09-26 04:43:02'),
(12, 'App\\Models\\User', 1, 'webToken', '2eddbab2e2849c139f15b0cfe3e58ea97c0cab94183bee6f4f622e2062dbcfb5', '[\"*\"]', NULL, NULL, '2024-10-01 15:28:30', '2024-10-01 15:28:30'),
(13, 'App\\Models\\User', 1, 'webToken', 'e6b8b52bedc7a1d8e9c74041236a688cdda95580ca0d919b745f6d36e86f9417', '[\"*\"]', NULL, NULL, '2024-10-01 15:31:51', '2024-10-01 15:31:51'),
(14, 'App\\Models\\User', 1, 'webToken', '862a7bba355f3ebe526c28c75a8a0e98d51e7d6af7b20c19c6d7e2aa2edd8868', '[\"*\"]', NULL, NULL, '2024-10-01 15:36:20', '2024-10-01 15:36:20'),
(15, 'App\\Models\\User', 1, 'webToken', '0f01dfa04acba373def1fb3dc318b95ea64c1ed9aeff9be61b5289015174da99', '[\"*\"]', NULL, NULL, '2024-10-02 00:33:37', '2024-10-02 00:33:37'),
(16, 'App\\Models\\User', 1, 'webToken', '22ecbda953e70c4a6d1ad06437da7664257ea1981b7bda055beb9e35b80479c3', '[\"*\"]', NULL, NULL, '2024-10-02 06:06:34', '2024-10-02 06:06:34'),
(17, 'App\\Models\\User', 1, 'webToken', 'd127af85ac6a80ebde688ff82bbe7dfdaa13032747e66db416b6c685ca2212da', '[\"*\"]', NULL, NULL, '2024-10-02 15:32:15', '2024-10-02 15:32:15'),
(18, 'App\\Models\\User', 1, 'webToken', '76304f622c2b8a2798217a26f3c8cc96e77fa71f50641da69177db5dc8706732', '[\"*\"]', NULL, NULL, '2024-10-03 01:43:33', '2024-10-03 01:43:33'),
(19, 'App\\Models\\User', 1, 'webToken', '5abff4af850821c9be048d6e0f219c63cec654be0f26238ee7cac534ac469698', '[\"*\"]', NULL, NULL, '2024-10-03 13:50:24', '2024-10-03 13:50:24'),
(20, 'App\\Models\\User', 1, 'webToken', 'a60a9ce201139bb6ba2e855749a20971cc6c945faaf949411d362e87b52324a8', '[\"*\"]', NULL, NULL, '2024-10-04 00:48:30', '2024-10-04 00:48:30'),
(21, 'App\\Models\\User', 1, 'webToken', '9e1e6b177f96a4d2c4a9a2a6ed0288b2e9b6dffb4361f0b6bb9ad8ba4c0d50a6', '[\"*\"]', NULL, NULL, '2024-10-05 02:19:27', '2024-10-05 02:19:27'),
(22, 'App\\Models\\User', 42, 'webToken', 'e467e619a3c1e5cc474944d31e496c769b10fdece9493cdb38a71df92aa11555', '[\"*\"]', NULL, NULL, '2024-10-05 11:51:47', '2024-10-05 11:51:47'),
(23, 'App\\Models\\User', 1, 'webToken', '56724cea3ada4d3e53b9f43d9e9dae50b88e5e8ae5a3cf12c75c5e476c86e01a', '[\"*\"]', NULL, NULL, '2024-10-05 13:09:58', '2024-10-05 13:09:58'),
(24, 'App\\Models\\User', 42, 'webToken', '2b2acd92ead72d827f62c30ac29589b7c8cf3c2a2d6ab035712868686fc3b11a', '[\"*\"]', NULL, NULL, '2024-10-06 04:37:58', '2024-10-06 04:37:58'),
(25, 'App\\Models\\User', 106, 'webToken', '7b3134f785143cc6e169324eca03dc032e258f9612b996e56c6fe3d42b7130f3', '[\"*\"]', NULL, NULL, '2024-10-06 05:17:01', '2024-10-06 05:17:01'),
(26, 'App\\Models\\User', 107, 'webToken', 'b8e2a4e8b9aaabef7d5ab74960c5f6df1d8334b3a7fea4534c061b08dfa38d45', '[\"*\"]', NULL, NULL, '2024-10-06 05:19:42', '2024-10-06 05:19:42'),
(27, 'App\\Models\\User', 107, 'webToken', '56c5e6b1ad037e44330436a9902df4b7d8b03d012d6d846fc633b971a62f642e', '[\"*\"]', NULL, NULL, '2024-10-06 06:24:07', '2024-10-06 06:24:07'),
(28, 'App\\Models\\User', 1, 'webToken', 'ed78d4ac43438d7d67783a45af6b357a51588314d327296aeeac8505f8ed1afd', '[\"*\"]', NULL, NULL, '2024-10-06 06:31:45', '2024-10-06 06:31:45'),
(29, 'App\\Models\\User', 1, 'webToken', '012e2e80abfd4c3e72dc815095a5d76e89e34b35d604789cbb6d0a186b1ecc3b', '[\"*\"]', NULL, NULL, '2024-10-06 06:38:12', '2024-10-06 06:38:12'),
(30, 'App\\Models\\User', 107, 'webToken', 'c109a1522dda98da4ccaf4eeeface383ae3fb10e16d4344b46da77e4e7f4fb41', '[\"*\"]', NULL, NULL, '2024-10-06 06:38:34', '2024-10-06 06:38:34'),
(31, 'App\\Models\\User', 98, 'webToken', 'db43572959478f1bbb839abf5b56b3cdee6402012204d25c74a12f8642c0068f', '[\"*\"]', NULL, NULL, '2024-10-06 07:13:40', '2024-10-06 07:13:40'),
(32, 'App\\Models\\User', 107, 'webToken', 'c2a5e2fd40d0c8d849932c2b3d54aafd0505109a37baf674ad4cf05150eb77a0', '[\"*\"]', NULL, NULL, '2024-10-06 07:20:11', '2024-10-06 07:20:11'),
(33, 'App\\Models\\User', 1, 'webToken', 'd0b57e1ae79244f045a5399e827afe52d71c072b3f235f4e65f6a4f671fa3be7', '[\"*\"]', NULL, NULL, '2024-10-06 07:54:26', '2024-10-06 07:54:26'),
(34, 'App\\Models\\User', 107, 'webToken', 'c1c6cc4933885204c265bb925fb26f9a17432079dfb2ae4a42bb89a29286d76c', '[\"*\"]', NULL, NULL, '2024-10-06 08:36:44', '2024-10-06 08:36:44'),
(35, 'App\\Models\\User', 1, 'webToken', 'd4dd48d051455b04955828b6740f0a3a4f06d4a68ca297d81973582898956662', '[\"*\"]', NULL, NULL, '2024-10-06 08:37:46', '2024-10-06 08:37:46'),
(36, 'App\\Models\\User', 42, 'webToken', '368a0f8769bf062bd268bd81fe5113ab67298de3865747103a67b07cfe8934b9', '[\"*\"]', NULL, NULL, '2024-10-06 08:50:04', '2024-10-06 08:50:04'),
(37, 'App\\Models\\User', 98, 'webToken', '8a9ea2551fdf0750ea41f7d854fde9ac3b43c944fcb49bfc730ad06ed6b96070', '[\"*\"]', NULL, NULL, '2024-10-06 08:53:59', '2024-10-06 08:53:59'),
(38, 'App\\Models\\User', 107, 'webToken', 'd3d7592dcb5accbdba1922faeeb66c3f1b8c87a12e5f783318145557bb2ab837', '[\"*\"]', NULL, NULL, '2024-10-06 09:21:49', '2024-10-06 09:21:49'),
(39, 'App\\Models\\User', 107, 'webToken', '484f6ced769c51877ef3aa2b74d47add864b85ea36464f59494f35a989044f12', '[\"*\"]', NULL, NULL, '2024-10-06 09:32:13', '2024-10-06 09:32:13'),
(40, 'App\\Models\\User', 1, 'webToken', '5d619c203f88f9c399079013f4118afdb6b3ce400a72be504ddfdd18315f4bdb', '[\"*\"]', NULL, NULL, '2024-10-06 10:23:59', '2024-10-06 10:23:59'),
(41, 'App\\Models\\User', 107, 'webToken', '99f1dd7a43cdf2fe5e63629e82d0938a03bc113914b8a94f0e1d6c2ca400a970', '[\"*\"]', NULL, NULL, '2024-10-06 13:17:24', '2024-10-06 13:17:24'),
(42, 'App\\Models\\User', 107, 'webToken', 'f355737ed929e165f865f195779b9627e3204c915e46408422bf4f122d9e2141', '[\"*\"]', NULL, NULL, '2024-10-06 13:56:43', '2024-10-06 13:56:43'),
(43, 'App\\Models\\User', 107, 'webToken', '7cc565a385c32050405dc384c81d320ebccda935de8e8890a7deb12a87f4df8c', '[\"*\"]', NULL, NULL, '2024-10-06 14:00:18', '2024-10-06 14:00:18'),
(44, 'App\\Models\\User', 107, 'webToken', 'b36f616daf362304821d4e2da862db62b2ab6eebef490f4b3b081a0165def4d4', '[\"*\"]', NULL, NULL, '2024-10-06 14:20:04', '2024-10-06 14:20:04'),
(45, 'App\\Models\\User', 107, 'webToken', '672b09c3168f0d9ea3f1ac30d70493bd45b9e1533b54cdb381560d2633eae0e5', '[\"*\"]', NULL, NULL, '2024-10-06 14:27:13', '2024-10-06 14:27:13'),
(46, 'App\\Models\\User', 107, 'webToken', 'fdc971a9cc507bc4ce2285ce8477769559532955636c03344330f1d32114c1ab', '[\"*\"]', NULL, NULL, '2024-10-06 14:29:54', '2024-10-06 14:29:54'),
(47, 'App\\Models\\User', 107, 'webToken', 'da0847e4152ba486dd03e5e7f29857dc1a0309fbbf98fac77bd5d2818d3c543e', '[\"*\"]', NULL, NULL, '2024-10-06 14:33:09', '2024-10-06 14:33:09'),
(48, 'App\\Models\\User', 107, 'webToken', '6cd8f4827a65b3e02912fa2d90cba37e25f83093d0e0299165e6fff67ac35edc', '[\"*\"]', NULL, NULL, '2024-10-06 14:55:39', '2024-10-06 14:55:39'),
(49, 'App\\Models\\User', 107, 'webToken', '757f4258bd5fccb2cd8ab8e05e178d269e30949a9b0860f74323fea1a8abad53', '[\"*\"]', NULL, NULL, '2024-10-06 15:15:49', '2024-10-06 15:15:49'),
(50, 'App\\Models\\User', 1, 'webToken', '8950acf551ef83a6b90330f7f7eea7e2d9dfb8d19b0fd842a023f54c630b6426', '[\"*\"]', NULL, NULL, '2024-10-07 08:47:45', '2024-10-07 08:47:45'),
(51, 'App\\Models\\User', 1, 'webToken', 'cea826ffe806cdc852cb2f45014b4ec1945388995b17ac3542cd12700e956ca1', '[\"*\"]', NULL, NULL, '2024-10-07 15:44:32', '2024-10-07 15:44:32'),
(52, 'App\\Models\\User', 1, 'webToken', '8e02e40f0cccf9ce9f3b312d96104b9c98a42da4ff0f0ae10e513e5a3e1a4a06', '[\"*\"]', NULL, NULL, '2024-10-08 14:03:15', '2024-10-08 14:03:15'),
(53, 'App\\Models\\User', 1, 'webToken', 'ecafed414ed5d31ba0f35a674c76cacb83004d786701137e44e6ab2511208068', '[\"*\"]', NULL, NULL, '2024-10-09 15:01:44', '2024-10-09 15:01:44'),
(54, 'App\\Models\\User', 107, 'webToken', '33244c0a4edeaf56ece8ebfee52234db8fe17cc3eaf4f6174466d1ddc0b8d272', '[\"*\"]', NULL, NULL, '2024-10-10 06:08:26', '2024-10-10 06:08:26'),
(55, 'App\\Models\\User', 42, 'webToken', '50c05904c9650248e378f1d016242eccb1887289ab591440c8f3de2d4c3336b4', '[\"*\"]', NULL, NULL, '2024-10-10 06:14:18', '2024-10-10 06:14:18'),
(56, 'App\\Models\\User', 98, 'webToken', 'aee3205ee48f199774648dffa7408ef5ff67355bbe90c84dec6bbae59524659c', '[\"*\"]', NULL, NULL, '2024-10-10 06:14:35', '2024-10-10 06:14:35'),
(57, 'App\\Models\\User', 107, 'webToken', '4e2f8da3fd6f268b2bfc97e7a3d6e9dcdda64b2330323b8831fc41410f8c724d', '[\"*\"]', NULL, NULL, '2024-10-10 06:16:05', '2024-10-10 06:16:05'),
(58, 'App\\Models\\User', 1, 'webToken', 'd2d169338c1f1d80ac7f015a9de672ff5c65aec8acd477e195f3fb38a5a8f961', '[\"*\"]', NULL, NULL, '2024-10-10 06:59:04', '2024-10-10 06:59:04'),
(59, 'App\\Models\\User', 1, 'webToken', '6392ca213479bc8552ca22189d684a4a6e06f08fdfa62b047a68bd07898a5f11', '[\"*\"]', NULL, NULL, '2024-10-15 01:52:34', '2024-10-15 01:52:34'),
(60, 'App\\Models\\User', 107, 'webToken', '050db957a50fd994d8b35241aea6aa24203df82664f0ba442d4082a68da4abc4', '[\"*\"]', NULL, NULL, '2024-10-15 02:03:05', '2024-10-15 02:03:05'),
(61, 'App\\Models\\User', 107, 'webToken', 'aa3ff3dba9f994da61289ec8c07c86ed9f258bd9160b6943e7ab35403189f5a5', '[\"*\"]', NULL, NULL, '2024-10-15 03:09:31', '2024-10-15 03:09:31'),
(62, 'App\\Models\\User', 1, 'webToken', 'e453b5095214fe7b45d9bf1097b0af0680e1d4e17265f5aeb30622a1391e2007', '[\"*\"]', NULL, NULL, '2024-10-15 03:29:44', '2024-10-15 03:29:44'),
(63, 'App\\Models\\User', 107, 'webToken', 'd95d3898eed708f91f6952596fbd70fb8f150f581c624645ea171942ed2fc8dc', '[\"*\"]', NULL, NULL, '2024-10-15 03:40:01', '2024-10-15 03:40:01'),
(64, 'App\\Models\\User', 1, 'webToken', '62e7c4decb77afb88138809c6e5f7f3e4010e596dfdaddafca7fa6a78b61c48a', '[\"*\"]', NULL, NULL, '2024-10-15 06:22:26', '2024-10-15 06:22:26'),
(65, 'App\\Models\\User', 1, 'webToken', '978635077a0cf26a9f9a840aca2ded649f607e0749aa3f10703b99167ab1f635', '[\"*\"]', NULL, NULL, '2024-10-15 10:07:45', '2024-10-15 10:07:45'),
(66, 'App\\Models\\User', 107, 'webToken', 'abdf84845467a3a681e288d1db26d06e31ab5c293905d9854f8b1f8835530a9a', '[\"*\"]', NULL, NULL, '2024-10-15 11:40:08', '2024-10-15 11:40:08'),
(67, 'App\\Models\\User', 108, 'webToken', 'c5ca93e7e0b918f601e9bedd57cafc5f7d35d6bba28403b727cf727124af6934', '[\"*\"]', NULL, NULL, '2024-10-15 12:21:32', '2024-10-15 12:21:32'),
(68, 'App\\Models\\User', 1, 'webToken', 'd60fd293184967260b3d4ba6af3b21b29cf4088724384864868c8d352939d3bf', '[\"*\"]', NULL, NULL, '2024-10-23 09:13:10', '2024-10-23 09:13:10'),
(69, 'App\\Models\\User', 108, 'webToken', '1f3d17953ecf4f7433300955fd98f6c3ccdd5f848f0e81315082f53308c6b8da', '[\"*\"]', NULL, NULL, '2024-10-23 13:01:30', '2024-10-23 13:01:30'),
(70, 'App\\Models\\User', 105, 'webToken', '86c6d852bd8061cedcf3d1863445812072cd430d0cf68ee16bd52cabdeb90e7f', '[\"*\"]', NULL, NULL, '2024-10-23 13:09:08', '2024-10-23 13:09:08'),
(71, 'App\\Models\\User', 1, 'webToken', '38bb970fbd6c63bbd9368d97a960ab5d03d71143ecbbe8a363f21e2920fcb1f6', '[\"*\"]', NULL, NULL, '2024-10-23 13:12:11', '2024-10-23 13:12:11'),
(72, 'App\\Models\\User', 99, 'webToken', 'da3fb724fe8f6c1997c4ac8ec4dd44d45388f8c5cecd502a444bec4ab4fa925c', '[\"*\"]', NULL, NULL, '2024-10-24 08:26:24', '2024-10-24 08:26:24'),
(73, 'App\\Models\\User', 95, 'webToken', '448cae8e3ae2459d03b991f28a1a20b877f16179baee178bbc0a6d2e69c81181', '[\"*\"]', NULL, NULL, '2024-10-24 08:29:10', '2024-10-24 08:29:10'),
(74, 'App\\Models\\User', 96, 'webToken', '05263e46ce6a68d14305f0d31a54fa2963f39edfad9364415e2238117349d439', '[\"*\"]', NULL, NULL, '2024-10-24 08:30:12', '2024-10-24 08:30:12'),
(75, 'App\\Models\\User', 1, 'webToken', 'afbb85d91a006234ce268cb763e306e901de2f9ff34491242214fd1e898fdb76', '[\"*\"]', NULL, NULL, '2024-10-24 09:17:02', '2024-10-24 09:17:02'),
(76, 'App\\Models\\User', 109, 'webToken', '3c029257c19816fb6dd7576caf384ee10217302e9d15101c7fbfd58153672f23', '[\"*\"]', NULL, NULL, '2024-10-24 12:28:16', '2024-10-24 12:28:16'),
(77, 'App\\Models\\User', 109, 'webToken', 'a30e6a9e37efc71cc96ad1c12b14166ef1310409766c7a658a45acf8b8f2e1bc', '[\"*\"]', NULL, NULL, '2024-10-24 12:39:32', '2024-10-24 12:39:32'),
(78, 'App\\Models\\User', 96, 'webToken', '9b72af21cfe7b156d809c32962d54768796d24f3f2573c2edcfac4a0be6caab5', '[\"*\"]', NULL, NULL, '2024-10-24 12:46:41', '2024-10-24 12:46:41'),
(79, 'App\\Models\\User', 108, 'webToken', '32cfb529b4ea68ba6e66e5a13cba959b1293394ec8fec0e477927e8e10df79c6', '[\"*\"]', NULL, NULL, '2024-10-24 12:48:50', '2024-10-24 12:48:50'),
(80, 'App\\Models\\User', 98, 'webToken', '6bbd219016458bebc7cb4f398dc9aa02c034c2594cb98a973e593d8401b785d2', '[\"*\"]', NULL, NULL, '2024-10-24 12:52:25', '2024-10-24 12:52:25'),
(81, 'App\\Models\\User', 95, 'webToken', 'a6465c254743ccca379a62a4e715985aea615c97f2ed0cc16cf6148641f94f8b', '[\"*\"]', NULL, NULL, '2024-10-24 12:52:57', '2024-10-24 12:52:57'),
(82, 'App\\Models\\User', 100, 'webToken', '062c5c18e265b32f87f3402f571e57f84cf5115a31deb4d6093f3cc33ee71357', '[\"*\"]', NULL, NULL, '2024-10-24 12:54:05', '2024-10-24 12:54:05'),
(83, 'App\\Models\\User', 1, 'webToken', 'eef4b9454a2d2e306c603f21494055b40afb5a5ccc475fff36479bd9d84a3446', '[\"*\"]', NULL, NULL, '2024-10-24 12:58:51', '2024-10-24 12:58:51'),
(84, 'App\\Models\\User', 110, 'webToken', '912504c62d8782d245cbc99ec98eb9b5222d8f3077852c508886d7b206ba8a3a', '[\"*\"]', NULL, NULL, '2024-10-24 12:59:47', '2024-10-24 12:59:47'),
(85, 'App\\Models\\User', 1, 'webToken', 'f73aa1f4ed65a8f976bfb2bcf0894277c85c740e1bed9e216460b7da1d4a93ff', '[\"*\"]', NULL, NULL, '2024-10-24 13:00:20', '2024-10-24 13:00:20'),
(86, 'App\\Models\\User', 113, 'webToken', 'ee780debda363e093f642c667564ebe45687840418e8c6ceb5ea2dba49072c75', '[\"*\"]', NULL, NULL, '2024-10-24 13:05:47', '2024-10-24 13:05:47'),
(87, 'App\\Models\\User', 111, 'webToken', '482ea3c7eac03dde992b393266f15f4da93eb968808ec5be57d380c7c549039b', '[\"*\"]', NULL, NULL, '2024-10-24 13:07:31', '2024-10-24 13:07:31'),
(88, 'App\\Models\\User', 112, 'webToken', '32b0c957b0aa89585139d2d26b3ab3063d8f564fd9f93b4b8704be3e97bfb5b8', '[\"*\"]', NULL, NULL, '2024-10-24 13:08:23', '2024-10-24 13:08:23'),
(89, 'App\\Models\\User', 1, 'webToken', 'bdff4a91999ca0cb07f982f3a605eb3ebb5aee59d336366f61d0631187950219', '[\"*\"]', NULL, NULL, '2024-10-24 13:10:20', '2024-10-24 13:10:20'),
(90, 'App\\Models\\User', 110, 'webToken', '81478245a03d57efa6e2a181f947927c202d894d12f2733434dfb24931cd00cd', '[\"*\"]', NULL, NULL, '2024-10-24 13:12:22', '2024-10-24 13:12:22'),
(91, 'App\\Models\\User', 112, 'webToken', '056214f7de567088528544dd0f65c3f8a89e4b0f024b5218cb2e428ffcedaeef', '[\"*\"]', NULL, NULL, '2024-10-24 13:13:00', '2024-10-24 13:13:00'),
(92, 'App\\Models\\User', 1, 'webToken', 'c50220997438e14b0c4d9dd644764ceac404376beea4067bfa8b26d09b6374bd', '[\"*\"]', NULL, NULL, '2024-10-24 13:19:36', '2024-10-24 13:19:36'),
(93, 'App\\Models\\User', 1, 'webToken', '8e6da7a0facafde0aa7ee1cca57b141ab56c4dc61ae9aba40f02513ae1ecee5c', '[\"*\"]', NULL, NULL, '2024-10-24 13:19:45', '2024-10-24 13:19:45'),
(94, 'App\\Models\\User', 113, 'webToken', '6f01c54648394d0c5325d2cd1d31d1b0d0f2e61f3be3824f5d8c50b6f9e856be', '[\"*\"]', NULL, NULL, '2024-10-25 09:40:10', '2024-10-25 09:40:10'),
(95, 'App\\Models\\User', 1, 'webToken', '30f9a66435ed71e72c50499d5ca737c8c7ab01b3f6be3fae8a9d2275efa8e089', '[\"*\"]', NULL, NULL, '2024-10-25 09:41:11', '2024-10-25 09:41:11'),
(96, 'App\\Models\\User', 110, 'webToken', '25aa4950dcaee0ba668543d7ef11c669b80a2728335f53648f11ae19d5fce8c5', '[\"*\"]', NULL, NULL, '2024-10-25 09:43:26', '2024-10-25 09:43:26'),
(97, 'App\\Models\\User', 110, 'webToken', '2860194a89e1920d04d7aa4a073f73d068a9f78b7bf08a506844a29c36e1380c', '[\"*\"]', NULL, NULL, '2024-10-25 10:16:58', '2024-10-25 10:16:58'),
(98, 'App\\Models\\User', 1, 'webToken', '2f4d07d2a8d238853b9a52884d9ab6b6427170865f7753746fb7c9cbc659ca9e', '[\"*\"]', NULL, NULL, '2024-10-25 10:19:48', '2024-10-25 10:19:48'),
(99, 'App\\Models\\User', 115, 'webToken', 'd038cc1c2e41d65d3abcb0727c1f49b0c4feec384d229dc4aef291e2656f4768', '[\"*\"]', NULL, NULL, '2024-10-25 10:25:26', '2024-10-25 10:25:26'),
(100, 'App\\Models\\User', 113, 'webToken', '85e07b6f440f764e97b6ab3edef803eb03c9d88dd3948890a524090978294d70', '[\"*\"]', NULL, NULL, '2024-10-25 10:26:54', '2024-10-25 10:26:54'),
(101, 'App\\Models\\User', 114, 'webToken', 'e3963b954ff7d50674022ee0712dd41ee1c938027674decd5d1089e89e44db14', '[\"*\"]', NULL, NULL, '2024-10-25 10:28:16', '2024-10-25 10:28:16'),
(102, 'App\\Models\\User', 116, 'webToken', 'ea05d58daf1ec7a96de38f42314ffb068cd15a1f199873d45aba57b1d0e2baea', '[\"*\"]', NULL, NULL, '2024-10-25 12:42:53', '2024-10-25 12:42:53'),
(103, 'App\\Models\\User', 118, 'webToken', '2086f0dd2cbdd00d6888e5fb80f82c742c9983dc7956335f51eddd1d6a6f23ae', '[\"*\"]', NULL, NULL, '2024-10-30 12:06:15', '2024-10-30 12:06:15'),
(104, 'App\\Models\\User', 118, 'webToken', '3299403207075b4f9754f69c4206db0c9b88fdf12a8e8b2795eb26b5ffc4efaf', '[\"*\"]', NULL, NULL, '2024-10-30 12:13:52', '2024-10-30 12:13:52'),
(105, 'App\\Models\\User', 1, 'webToken', '69e314853061645d673636df59a189ba87f4f4e70f481d6da37f02f1b0599c45', '[\"*\"]', NULL, NULL, '2024-10-30 12:14:53', '2024-10-30 12:14:53'),
(106, 'App\\Models\\User', 1, 'webToken', '7b85918a54f559d690f60c777e849c542a77fe905a85bbca36336327a7484259', '[\"*\"]', NULL, NULL, '2024-10-31 03:57:46', '2024-10-31 03:57:46'),
(107, 'App\\Models\\User', 119, 'webToken', 'bf74cd05abcfcff698ad446e042dd868ac37e5307c37fcb0d1be4e5755aa2639', '[\"*\"]', NULL, NULL, '2024-10-31 04:13:18', '2024-10-31 04:13:18'),
(108, 'App\\Models\\User', 1, 'webToken', 'aac83c30f26fd32bd388cd2dbafc95e1530229568b78c529978f1fccc308b26d', '[\"*\"]', NULL, NULL, '2024-11-01 00:08:05', '2024-11-01 00:08:05'),
(109, 'App\\Models\\User', 1, 'webToken', '375ad2fb825b4f82a0bcea149be2c8be01a5707ea4e9ca0aeac04c57066146f6', '[\"*\"]', NULL, NULL, '2024-11-01 00:09:24', '2024-11-01 00:09:24'),
(110, 'App\\Models\\User', 1, 'webToken', 'd147c3e9353a97c0d513a5f53a64342fb53bc199de4fbb78f6e2e9d6a274d00c', '[\"*\"]', NULL, NULL, '2024-11-01 00:09:49', '2024-11-01 00:09:49'),
(111, 'App\\Models\\User', 1, 'webToken', 'f6657ae648b328f871598558a58e58aef7a29a3a10c072e1cf38bbf812991cc8', '[\"*\"]', NULL, NULL, '2024-11-02 01:26:24', '2024-11-02 01:26:24'),
(112, 'App\\Models\\User', 1, 'webToken', '5859fbb141768c1a44e684069c91e83663302c55f433ce64701ff1dea7d4d7da', '[\"*\"]', NULL, NULL, '2024-11-03 12:20:04', '2024-11-03 12:20:04'),
(113, 'App\\Models\\User', 118, 'webToken', 'ddfa4d0ff5cf543b4d11f3dadb0d35a68745d38679266c7a83ae5ccb1ce9d610', '[\"*\"]', NULL, NULL, '2024-11-03 14:15:56', '2024-11-03 14:15:56'),
(114, 'App\\Models\\User', 1, 'webToken', '38a28f225d5ee7924b8d80815d954ef2bf8d8d39e5762e8fd7f86f923fab964f', '[\"*\"]', NULL, NULL, '2024-11-03 14:19:56', '2024-11-03 14:19:56'),
(115, 'App\\Models\\User', 118, 'webToken', 'ab2f49042f2a0e9001f2bc8080f1dec963d3d8de391ae78abef782e62ac581b7', '[\"*\"]', NULL, NULL, '2024-11-04 00:44:12', '2024-11-04 00:44:12'),
(116, 'App\\Models\\User', 1, 'webToken', '47dd8b50f4f5d40abfab2a472de6bdde5aba21bb921f0ad6ce734e71b5a60f54', '[\"*\"]', NULL, NULL, '2024-11-04 01:04:29', '2024-11-04 01:04:29'),
(117, 'App\\Models\\User', 120, 'webToken', '05f5d33bf6677a56fafa4774a1858c026bbcb12ebdddfb72fc08a2c681cd4297', '[\"*\"]', NULL, NULL, '2024-11-04 02:48:48', '2024-11-04 02:48:48'),
(118, 'App\\Models\\User', 1, 'webToken', 'ce4f08f8cbc8d6d1ba705290eb768868ed53b7b18bf8f7eafbb60a427b6b304a', '[\"*\"]', NULL, NULL, '2024-11-05 01:30:15', '2024-11-05 01:30:15'),
(119, 'App\\Models\\User', 1, 'webToken', 'fbd784e6cbc3023c0d065ffb924bcab80184ae50e33f3cafa62b334de81af1aa', '[\"*\"]', NULL, NULL, '2024-11-05 20:54:32', '2024-11-05 20:54:32'),
(120, 'App\\Models\\User', 118, 'webToken', '0ad18d4bdeea496f6815ed956e3476fdac94a13fd23b6ab87aec928310750ada', '[\"*\"]', NULL, NULL, '2024-11-05 21:26:35', '2024-11-05 21:26:35'),
(121, 'App\\Models\\User', 118, 'webToken', '8017db2fe77fd03f079dd56ba6ce55bdd32ed0d241d238514967b7dae3b8af5d', '[\"*\"]', NULL, NULL, '2024-11-12 00:48:19', '2024-11-12 00:48:19'),
(122, 'App\\Models\\User', 1, 'webToken', '9f5aa9a3c093fd2b2cd659078d06fab400b3860032c31b216ec8695b539bc5f2', '[\"*\"]', NULL, NULL, '2024-11-12 00:55:37', '2024-11-12 00:55:37'),
(123, 'App\\Models\\User', 1, 'webToken', '3607a96e8e2468678083180a6f883fa9cf7e67d42f2d196cea9e142fa0a998a5', '[\"*\"]', NULL, NULL, '2024-11-17 05:15:00', '2024-11-17 05:15:00'),
(124, 'App\\Models\\User', 1, 'webToken', '1bc7f702e9ae29c913a027e639b3e0c19c1f75693c571996bd6fd3d2edaeba84', '[\"*\"]', NULL, NULL, '2024-11-17 16:58:35', '2024-11-17 16:58:35'),
(125, 'App\\Models\\User', 1, 'webToken', 'ed0825d5b74716ffb85d296fa54d8b473ec9919e87cb507599b6b1e6e93e375b', '[\"*\"]', NULL, NULL, '2024-11-19 15:44:49', '2024-11-19 15:44:49'),
(126, 'App\\Models\\User', 1, 'webToken', '891bb15b7da490339873c1f3fb9ae62ccf98f081f0ba1f60667f7bead58e640f', '[\"*\"]', NULL, NULL, '2024-11-19 16:32:09', '2024-11-19 16:32:09'),
(127, 'App\\Models\\User', 120, 'webToken', '6b41a5f1c0c6e9e8ca694ab36e59eccc6e99994df0cbdfcea8d0a5ecffcc150c', '[\"*\"]', NULL, NULL, '2024-11-19 16:46:06', '2024-11-19 16:46:06'),
(128, 'App\\Models\\User', 120, 'webToken', '814c7e5e498cee80f66b6394d5110f45c4d1f452559bdec7f9b583968b1a42a5', '[\"*\"]', NULL, NULL, '2024-11-19 17:00:44', '2024-11-19 17:00:44'),
(129, 'App\\Models\\User', 1, 'webToken', 'bb4f1f0fd95e203e6fdbe2752a23f428990c3c7476bbc15b18d2c81fb798615b', '[\"*\"]', NULL, NULL, '2024-11-20 02:34:57', '2024-11-20 02:34:57'),
(130, 'App\\Models\\User', 1, 'webToken', '4939c8100866ca01eb6e1affa467289634717affd5d1457a9b0acf98dfc66b71', '[\"*\"]', NULL, NULL, '2024-11-20 11:24:36', '2024-11-20 11:24:36'),
(131, 'App\\Models\\User', 1, 'webToken', '93356181c0dd5724f2f2ddf51620f16eae68fa9ef995df362c916f22eb9fbdfe', '[\"*\"]', NULL, NULL, '2024-11-20 14:56:53', '2024-11-20 14:56:53'),
(132, 'App\\Models\\User', 1, 'webToken', '2bc1efbd8cd40d69f4d59222cf5b8f12b5e94aa288a44de93069e53cd21f8e8a', '[\"*\"]', NULL, NULL, '2024-11-20 14:57:36', '2024-11-20 14:57:36'),
(133, 'App\\Models\\User', 1, 'webToken', 'c0b2fb4de111d3e9e0abfc78c973d5614da60f25febd15584839f55a6c981646', '[\"*\"]', NULL, NULL, '2024-11-20 16:37:36', '2024-11-20 16:37:36'),
(134, 'App\\Models\\User', 1, 'webToken', 'deafaab50a55807a3b8531d2e682c516a3c39e06715b097b901706f0c8e488f4', '[\"*\"]', NULL, NULL, '2024-11-24 04:41:43', '2024-11-24 04:41:43'),
(135, 'App\\Models\\User', 1, 'webToken', 'd55ed5b9044452ed7c9f590d7601e6b290733a3d519feb079384f7f233466c64', '[\"*\"]', NULL, NULL, '2024-12-04 16:25:30', '2024-12-04 16:25:30'),
(136, 'App\\Models\\User', 126, 'webToken', '32c9f2b00fed0901c6d1e6b92a81c7627a7154932cbc2b38910013b5c14e73a8', '[\"*\"]', NULL, NULL, '2024-12-10 13:50:19', '2024-12-10 13:50:19'),
(137, 'App\\Models\\User', 1, 'webToken', '39d55c6a0f057e3d81fb63542c6ccd457547098c4846bfdb3dd24a7f69beadd3', '[\"*\"]', NULL, NULL, '2024-12-13 03:13:42', '2024-12-13 03:13:42'),
(138, 'App\\Models\\User', 1, 'webToken', '44ae2e237c95b2946d2955422aff94854542628d60863a527efce86fc9f3bef0', '[\"*\"]', NULL, NULL, '2024-12-17 16:01:10', '2024-12-17 16:01:10'),
(139, 'App\\Models\\User', 1, 'webToken', 'd95dd42d1416ad9dd316a89750f8313d70a08542c0044908d1b1a81f2db2fa31', '[\"*\"]', NULL, NULL, '2024-12-18 04:29:39', '2024-12-18 04:29:39'),
(140, 'App\\Models\\User', 1, 'webToken', 'f1758be8c48dac3c6d3373f658defccf11a709d0756319fae227530eb6890a93', '[\"*\"]', NULL, NULL, '2024-12-19 14:43:22', '2024-12-19 14:43:22'),
(141, 'App\\Models\\User', 1, 'webToken', '28daab45a5a2d3238a9bac47145551afc6a275fb237465d011db72872254ba29', '[\"*\"]', NULL, NULL, '2024-12-20 17:06:42', '2024-12-20 17:06:42'),
(142, 'App\\Models\\User', 129, 'webToken', '5daf5764e5e4cde33063ee1bb540d846e36de50ee7a75666e87ad1e40380badb', '[\"*\"]', NULL, NULL, '2024-12-20 19:33:00', '2024-12-20 19:33:00'),
(143, 'App\\Models\\User', 1, 'webToken', 'f2ff9fea1b4cb570043922f0f11763f27c51a0de8201cbeb3adce656dff12aa5', '[\"*\"]', NULL, NULL, '2024-12-21 07:15:55', '2024-12-21 07:15:55'),
(144, 'App\\Models\\User', 1, 'webToken', 'b28ff2c476ad6d09199f083056ea08f71065e57c7990a286b24948e44793645c', '[\"*\"]', NULL, NULL, '2024-12-21 16:21:23', '2024-12-21 16:21:23'),
(145, 'App\\Models\\User', 1, 'webToken', '29f4c7b499c65e72dd2272ef51e6a4e338631d4b172a65ef54d3860695d7a8b5', '[\"*\"]', NULL, NULL, '2024-12-22 10:54:52', '2024-12-22 10:54:52'),
(146, 'App\\Models\\User', 120, 'webToken', 'e332cb8053bd50646241a908c0e9cfd74c4edfc72145ddb9e63068c0ac0cbd46', '[\"*\"]', NULL, NULL, '2024-12-22 11:43:28', '2024-12-22 11:43:28'),
(147, 'App\\Models\\User', 1, 'webToken', 'ef39f29e0827a23e79869c4a1162ba56987339db88d3042d19873e46333222c2', '[\"*\"]', NULL, NULL, '2024-12-22 15:57:35', '2024-12-22 15:57:35'),
(148, 'App\\Models\\User', 1, 'webToken', '5dca0b26c30ea24e720fd97a82f0e7f67175b88b91f0bceb141b04e89467bd46', '[\"*\"]', NULL, NULL, '2024-12-23 16:17:47', '2024-12-23 16:17:47'),
(149, 'App\\Models\\User', 1, 'webToken', '86b0578100dcccff74c253e9bb0348e2e6da1b001a5b51008f78b8e4dbba14fd', '[\"*\"]', NULL, NULL, '2024-12-23 16:20:10', '2024-12-23 16:20:10'),
(150, 'App\\Models\\User', 130, 'webToken', '157d273abab7b6d9d73c536cd2955ca6974580ed79254e00f0ee71bed8977411', '[\"*\"]', NULL, NULL, '2024-12-23 16:47:36', '2024-12-23 16:47:36'),
(151, 'App\\Models\\User', 1, 'webToken', 'b4cb635f4caf3dd4802e08457c171e0220ad1e4de057233436fd36a9dd4b4d47', '[\"*\"]', NULL, NULL, '2024-12-23 17:55:57', '2024-12-23 17:55:57'),
(152, 'App\\Models\\User', 1, 'webToken', '2d687aecf3ee8751695473e4f9a9ebcf88303db34bf16ce2aa804f9250f0cad1', '[\"*\"]', NULL, NULL, '2024-12-31 05:53:50', '2024-12-31 05:53:50'),
(153, 'App\\Models\\User', 1, 'webToken', '84892014db682b088d8e2656d73b6ede5039605d304aa705700e42e452d2d7d6', '[\"*\"]', NULL, NULL, '2024-12-31 09:03:44', '2024-12-31 09:03:44'),
(154, 'App\\Models\\User', 1, 'webToken', 'a98f1e54851ec596947a230a9ead8449606f9f2b785961548e4e643137e39f8b', '[\"*\"]', NULL, NULL, '2024-12-31 15:16:40', '2024-12-31 15:16:40'),
(155, 'App\\Models\\User', 1, 'webToken', '6e352ed60cf60174692e886edb3b3cbaf6c07284c2cd21e7652df91f63068db9', '[\"*\"]', NULL, NULL, '2025-01-01 16:00:33', '2025-01-01 16:00:33'),
(156, 'App\\Models\\User', 126, 'webToken', 'f2ee515f43e7be2e7a9860ea22d5d9254348057278dae25af8facd983b80390b', '[\"*\"]', NULL, NULL, '2025-01-03 13:45:27', '2025-01-03 13:45:27'),
(157, 'App\\Models\\User', 129, 'webToken', '0119c13e33cee6cf19369dfe06b010e9306bcd1dbcc6afe0a82a88f6fc5108fa', '[\"*\"]', NULL, NULL, '2025-01-03 13:54:15', '2025-01-03 13:54:15'),
(158, 'App\\Models\\User', 126, 'webToken', 'd6061060dd648a3e33793a430000d27b1ee877f156cd2cf8bcc1a3106e6eb775', '[\"*\"]', NULL, NULL, '2025-01-03 14:08:01', '2025-01-03 14:08:01'),
(159, 'App\\Models\\User', 1, 'webToken', 'ba7add2f2902c845ddf0b2b2ae9c5a88a561f6e0b03beb6fbc447d6be6cebfdf', '[\"*\"]', NULL, NULL, '2025-01-07 04:29:37', '2025-01-07 04:29:37'),
(160, 'App\\Models\\User', 131, 'webToken', 'ba729a2ff93689a235fa43c5a26c5e7884e59170d4c19e786c74dc8111ad6a69', '[\"*\"]', NULL, NULL, '2025-01-07 04:38:20', '2025-01-07 04:38:20'),
(161, 'App\\Models\\User', 1, 'webToken', 'a816ddb49fe3ffae7d9104567ad02f0a300761b43010e86dd7de77bf4ecc5b6c', '[\"*\"]', NULL, NULL, '2025-01-07 04:39:07', '2025-01-07 04:39:07'),
(162, 'App\\Models\\User', 1, 'webToken', '1c9659332befd893eab683709ff80c1ec7be5058c8c2df36f4228dfada0008a0', '[\"*\"]', NULL, NULL, '2025-01-10 12:59:42', '2025-01-10 12:59:42'),
(163, 'App\\Models\\User', 1, 'webToken', 'cb017049e8aad6287ab1bf61c82b12fb652e8e9a5b68f77df3b606043c615567', '[\"*\"]', NULL, NULL, '2025-01-22 15:32:39', '2025-01-22 15:32:39'),
(164, 'App\\Models\\User', 1, 'webToken', '60ca712232fe645219bc53e5848e99eb91eb6fab6131afe47eae3ce8fc4085aa', '[\"*\"]', NULL, NULL, '2025-01-22 16:40:17', '2025-01-22 16:40:17');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `property_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `community_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `address` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `bedrooms` int DEFAULT NULL,
  `square_feet` decimal(10,2) DEFAULT NULL,
  `lot_size` decimal(10,2) DEFAULT NULL,
  `property_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `listing_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `year_built` int DEFAULT NULL,
  `hoa_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `association_fee` decimal(10,2) DEFAULT NULL,
  `cic` tinyint(1) DEFAULT NULL,
  `school_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `main_image` int DEFAULT NULL,
  `banner` int DEFAULT NULL,
  `is_open_house` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price_from` decimal(12,2) DEFAULT NULL,
  `price_to` decimal(12,2) DEFAULT NULL,
  `stories` int DEFAULT NULL,
  `full_bath` int DEFAULT NULL,
  `half_bath` int DEFAULT NULL,
  `size_from` float DEFAULT NULL,
  `size_to` float DEFAULT NULL,
  `construction_status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `listing_status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `average_price_per_square` decimal(12,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`property_id`, `user_id`, `community_id`, `title`, `description`, `address`, `city`, `state`, `zip_code`, `longitude`, `latitude`, `price`, `bedrooms`, `square_feet`, `lot_size`, `property_type`, `listing_type`, `year_built`, `hoa_id`, `association_fee`, `cic`, `school_id`, `images`, `main_image`, `banner`, `is_open_house`, `price_from`, `price_to`, `stories`, `full_bath`, `half_bath`, `size_from`, `size_to`, `construction_status`, `listing_status`, `average_price_per_square`, `created_at`, `updated_at`) VALUES
('9e08341f-5088-4d48-b85e-afc86cfe454a', 1, '9d264764-2e21-4869-b7e6-692c38c02bbd', 'TItle', 'test', 'Test', 'test', 'test', '89118', '-115.1728', '36.1013', 234234.00, 3, 342423.00, 234234.00, '234234', 'Rent', 2342, '9d09b3e5-20ea-4ad4-a16d-6d328bc8750e', 2234.00, 1, '9d09a853-a044-4fd4-bbc6-5f57f0beb1fd', NULL, NULL, NULL, NULL, 234234.00, 234234.00, 3, 3, 3, 3, 3, 'Under Construction', 'Active', 342342.00, '2025-01-22 16:18:33', '2025-01-22 16:18:33');

-- --------------------------------------------------------

--
-- Table structure for table `property_features`
--

CREATE TABLE `property_features` (
  `feature_id` int NOT NULL,
  `property_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `fireplace_type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kitchen_pantry_type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reach_in` tinyint(1) DEFAULT NULL,
  `walk_in` tinyint(1) DEFAULT NULL,
  `laundry_closet` tinyint(1) DEFAULT NULL,
  `closet_location` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bedroom_location` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bathroom_type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bathroom_status` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pool_shape` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `water_features` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pool_status` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `spa` tinyint(1) DEFAULT NULL,
  `fencing_material` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fencing_status` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `parking_enclosure` tinyint(1) DEFAULT NULL,
  `private_bath` tinyint(1) DEFAULT NULL,
  `outdoor_shower` tinyint(1) DEFAULT NULL,
  `landscape_maintenance` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `foundation_conditions` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property_features`
--

INSERT INTO `property_features` (`feature_id`, `property_id`, `name`, `description`, `fireplace_type`, `kitchen_pantry_type`, `reach_in`, `walk_in`, `laundry_closet`, `closet_location`, `bedroom_location`, `bathroom_type`, `bathroom_status`, `pool_shape`, `water_features`, `pool_status`, `spa`, `fencing_material`, `fencing_status`, `parking_enclosure`, `private_bath`, `outdoor_shower`, `landscape_maintenance`, `foundation_conditions`, `created_at`, `updated_at`) VALUES
(1130, '9e08341f-5088-4d48-b85e-afc86cfe454a', NULL, 'test', NULL, NULL, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, 1, NULL, NULL, '2025-01-22 16:18:33', '2025-01-22 16:18:33');

-- --------------------------------------------------------

--
-- Table structure for table `property_incentives`
--

CREATE TABLE `property_incentives` (
  `id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `property_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `incentive_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property_incentives`
--

INSERT INTO `property_incentives` (`id`, `property_id`, `incentive_id`, `created_at`, `updated_at`) VALUES
('9e08325b-551e-4cb5-b17e-12ebc3d78ae3', '9e08325b-51d5-49d0-8f9c-c875143c9924', '9d2ad55f-982b-43dc-a1bb-f32456ac7e6d', '2025-01-22 16:13:37', '2025-01-22 16:13:37'),
('9e08326f-59d4-459e-a4be-c324cf55e497', '9e08326f-5631-4bb9-9863-5883f6fd1e0d', '9d2ad55f-982b-43dc-a1bb-f32456ac7e6d', '2025-01-22 16:13:50', '2025-01-22 16:13:50'),
('9e08327b-c2ce-43e4-a5ad-353adb869263', '9e08327b-bd67-480b-a1aa-09327fdd14be', '9d2ad55f-982b-43dc-a1bb-f32456ac7e6d', '2025-01-22 16:13:58', '2025-01-22 16:13:58'),
('9e0832a5-0344-436d-b78a-a31a3b62ccb5', '9e0832a4-fd45-4b2d-8c67-418d438605d5', '9d2ad55f-982b-43dc-a1bb-f32456ac7e6d', '2025-01-22 16:14:26', '2025-01-22 16:14:26'),
('9e0832cc-4ef6-4568-8c76-fb40ed32f12b', '9e0832cc-4a42-4666-a49d-5cff0af8d777', '9d2ad55f-982b-43dc-a1bb-f32456ac7e6d', '2025-01-22 16:14:51', '2025-01-22 16:14:51'),
('9e0832ec-df60-4ee4-ad5e-44b7e450bc19', '9e0832ec-d902-421b-9f69-07c217da84cb', '9d2ad55f-982b-43dc-a1bb-f32456ac7e6d', '2025-01-22 16:15:13', '2025-01-22 16:15:13'),
('9e08330f-a6aa-41d0-a082-64ce8be09cad', '9e08330f-a38c-45fc-8e94-373b58938bb7', '9d2ad55f-982b-43dc-a1bb-f32456ac7e6d', '2025-01-22 16:15:35', '2025-01-22 16:15:35'),
('9e08334f-5882-4a7a-8efb-5e41dceafca1', '9e08334f-54e6-42f6-bbc1-eb8c903b3681', '9d2ad55f-982b-43dc-a1bb-f32456ac7e6d', '2025-01-22 16:16:17', '2025-01-22 16:16:17'),
('9e083362-abc4-47b4-9ec1-e954b6ed0c15', '9e083362-a93f-4a1d-bc05-d5a6c9082f6e', '9d2ad55f-982b-43dc-a1bb-f32456ac7e6d', '2025-01-22 16:16:30', '2025-01-22 16:16:30'),
('9e08336f-6ee2-4137-b175-e443f5490d28', '9e08336f-6c06-4df4-ba8f-b51c4992bb5e', '9d2ad55f-982b-43dc-a1bb-f32456ac7e6d', '2025-01-22 16:16:38', '2025-01-22 16:16:38'),
('9e083384-9515-4340-b02b-64b8d4f07f4b', '9e083384-90c7-4239-821a-030b4e7c0e8f', '9d2ad55f-982b-43dc-a1bb-f32456ac7e6d', '2025-01-22 16:16:52', '2025-01-22 16:16:52'),
('9e083392-ebb3-4423-a9e3-17d4f6d64c86', '9e083392-e6fa-46e7-8b2c-66e22ab26093', '9d2ad55f-982b-43dc-a1bb-f32456ac7e6d', '2025-01-22 16:17:01', '2025-01-22 16:17:01'),
('9e0833aa-e188-4a81-92a4-c55e472d2dcb', '9e0833aa-dd23-4ccf-a73e-8872641051a5', '9d2ad55f-982b-43dc-a1bb-f32456ac7e6d', '2025-01-22 16:17:17', '2025-01-22 16:17:17'),
('9e0833b5-d7f0-4774-b07f-bd59b6f2a3f3', '9e0833b5-d45b-4b8c-bf19-53b3868b2901', '9d2ad55f-982b-43dc-a1bb-f32456ac7e6d', '2025-01-22 16:17:24', '2025-01-22 16:17:24'),
('9e0833cc-2dd3-4628-90a9-660beb01f353', '9e0833cc-282c-44cd-8b8b-0a764003e112', '9d2ad55f-982b-43dc-a1bb-f32456ac7e6d', '2025-01-22 16:17:39', '2025-01-22 16:17:39'),
('9e0833ff-ec66-41b5-948b-a69a7d2abbdf', '9e0833ff-e94e-4819-8c3c-0393512c8826', '9d2ad55f-982b-43dc-a1bb-f32456ac7e6d', '2025-01-22 16:18:13', '2025-01-22 16:18:13'),
('9e08341f-566b-499d-9664-df4fad7e07ec', '9e08341f-5088-4d48-b85e-afc86cfe454a', '9d2ad55f-982b-43dc-a1bb-f32456ac7e6d', '2025-01-22 16:18:33', '2025-01-22 16:18:33');

-- --------------------------------------------------------

--
-- Table structure for table `quick_move_in_homes`
--

CREATE TABLE `quick_move_in_homes` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `property_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `move_in_date` date NOT NULL,
  `incentives` text COLLATE utf8mb4_general_ci,
  `main_image` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quick_move_in_homes`
--

INSERT INTO `quick_move_in_homes` (`id`, `property_id`, `move_in_date`, `incentives`, `main_image`, `created_at`, `updated_at`) VALUES
('9e08341f-5530-4547-8c55-c9151a6c98c0', '9e08341f-5088-4d48-b85e-afc86cfe454a', '2025-01-22', '[\"9d2ad55f-982b-43dc-a1bb-f32456ac7e6d\"]', NULL, '2025-01-22 16:18:33', '2025-01-22 16:18:33');

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `directions_and_details` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `name`, `type`, `directions_and_details`, `created_at`, `updated_at`) VALUES
('9d09a853-a044-4fd4-bbc6-5f57f0beb1fd', 'Silver Springs Academy', 'Public', 'Located in the heart of Sunset Valley, Silver Springs Academy is easily accessible from major roads. To get there, take NV-595 W and exit at Sunset Rd. The school is situated on Silver Springs Blvd, just past the community park. It offers a curriculum focused on STEM education and has a strong emphasis on extracurricular activities.', '2024-09-18 03:27:23', '2024-09-18 03:31:05'),
('9d09a857-3d19-40a3-ad82-8fb3731c7fcd', 'Red Rock Elementary', 'Private', 'Situated near Red Rock Canyon, Red Rock Elementary can be found by taking NV-159 E from the Las Vegas Strip. Turn onto W Charleston Blvd and then take a left on Red Rock Dr. This school is known for its strong community involvement and innovative teaching methods, catering to early childhood education', '2024-09-18 03:27:25', '2024-09-18 03:30:46'),
('9d09a87c-2bee-448c-9567-53ad9c27dfa3', 'Desert Pines Middle School', 'Charter', 'Located in the Desert Oasis neighborhood, Desert Pines Middle School is accessible via Desert Oasis Blvd. From the Las Vegas Strip, take NV-159 E to Desert Oasis Rd and head north. The school is equipped with modern facilities and focuses on a holistic approach to education, emphasizing both academics and social development.', '2024-09-18 03:27:49', '2024-11-20 12:25:48');

-- --------------------------------------------------------

--
-- Table structure for table `seo`
--

CREATE TABLE `seo` (
  `id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `keyword` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `image` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seo`
--

INSERT INTO `seo` (`id`, `title`, `keyword`, `description`, `image`, `created_at`, `updated_at`) VALUES
('9b7fc1f0-7710-42c6-b53c-9cd30af8e7f2', 'Seo Title', '#us #newhomes #quickmoveinhomes #vegasnewhomes', 'Experience unmatched comfort in carefully chosen hotels that blend luxury and convenience seamlessly. From boutique gems to world-class resorts, our accommodations promise a refreshing stay, complementing the beauty of the destinations.', 24, '2024-03-06 08:02:49', '2024-11-20 12:23:55');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `value` text COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
('9b56180d-dc31-418a-b2c1-db85a7f4b1df', 'default_language', 'ES', '2024-02-14 14:58:50', '2024-02-29 13:40:19'),
('9b59f423-ebd0-4d12-84cf-954c7e2e9b59', 'welcome_email', '[{\"subject\":\"Welcome to our Website! Your Account Details Inside.\",\"description\":\"<p>Welcome to QuickMoveInHome \\u2013 your gateway to finding the perfect property! We\'re excited to have you on board. Your journey to discovering incredible homes begins now.<\\/p><p>Here are your login credentials:<\\/p><p><strong>Email:<\\/strong> [email]<\\/p><p><strong>Password:<\\/strong> [password]<\\/p><p>Please keep these details secure. Feel free to explore our website, where you can browse exciting property listings, neighborhood guides, and exclusive offers.<\\/p><p>If you have any questions or need assistance, our support team is here to help. Simply reply to this email, and we\'ll get back to you as soon as possible.<\\/p><p>Thank you for choosing QuickMoveInHome. Happy house hunting!<\\/p><p>Best regards,<\\/p><p><strong>The QuickMoveInHome Team<\\/strong><\\/p>\"}]', '2024-02-16 13:01:44', '2024-10-05 15:12:24'),
('9b59f802-7681-42dc-93a3-699ab1ae61ac', 'reset_password_email_section', '[{\"subject\":\"QuickMoveInHome Password Reset\",\"description\":\"<p><strong>Dear [user_name],<\\/strong><\\/p><p>We hope this message finds you well! It seems that you\\u2019ve requested a password reset for your QuickMoveInHome account. No worries, we\'re here to help!<\\/p><p>If you didn\\u2019t request this reset or have any concerns, please ignore this email. Your account security is important to us.<\\/p><p>To reset your password, please click on the following link:<\\/p><p><a href=\\\"#\\\" rel=\\\"noopener noreferrer\\\" target=\\\"_blank\\\"><strong>Reset Your Password<\\/strong><\\/a><\\/p><p>If you encounter any issues or need further assistance, feel free to reach out to our support team.<\\/p><p>Thank you for choosing QuickMoveInHome!<\\/p><p>Best regards,<\\/p><p><strong>The QuickMoveInHome Team<\\/strong><\\/p>\"}]', '2024-02-16 13:12:33', '2024-10-05 15:14:49'),
('9b5bb510-601d-4c50-8a25-bb8394df3d10', 'logo', '268', '2024-02-17 09:57:00', '2024-10-02 16:04:28'),
('9b93c225-6b0e-4b8d-975a-e25feee2a85e', 'website_name', 'Brand New Homes Vegas', '2024-03-16 06:39:57', '2025-01-01 17:36:49'),
('9b93c225-7281-4b33-be26-0ec28d7523a6', 'youtube', 'https://www.youtube.com/@vegasonlinerealtypoweredby5400', '2024-03-16 06:39:57', '2024-10-23 13:12:55'),
('9b93c225-742b-4692-a8a9-3b7ed87183ba', 'instagram', 'https://www.instagram.com/yvonnekhooexprealtylics.69489/', '2024-03-16 06:39:57', '2024-10-23 13:14:16'),
('9b93c225-7570-4694-829e-61805caac7fe', 'facebook', 'https://www.facebook.com/KhoogroupExp/?_rdc=2&_rdr', '2024-03-16 06:39:57', '2024-10-23 13:16:21'),
('9b93c225-76e0-4595-a8b1-2b00e2dbe2c9', 'email', 'khoooffice@gmail.com', '2024-03-16 06:39:57', '2024-10-23 12:42:57'),
('9b93c225-7a0f-453e-9a54-8b4459682456', 'website_address', '10845 Griffith Peak Drive, Suite 2\nLas Vegas, NV, 89135', '2024-03-16 06:39:57', '2024-10-23 13:14:16'),
('9b93c225-7ccc-4c8f-85a0-d06b9138a8dc', 'website_phone', '(702) 819-0035', '2024-03-16 06:39:57', '2024-10-23 13:14:16'),
('9c2a324f-8357-4d62-9ae1-e83b47afb029', 'verification_code_email_section', '[{\"subject\":\"Your Secure Verification Code\",\"description\":\"<p>Dear <strong>[user_name],<\\/strong><\\/p><p>To manage your account securely, here\'s your six-digit verification code:<\\/p><p>Verification Code: <strong>[verification_code]<\\/strong><\\/p><p><br><\\/p><p>Use this code to reset your password, verify your existing account, or register a new one. Enter it where prompted to proceed.<\\/p><p>For any assistance, reach out to our support team.<\\/p><p><br><\\/p><p>Thank you for prioritizing the security of your account with us.<\\/p><p><br><\\/p><p><strong>Best regards,<\\/strong><\\/p>\"}]', '2024-05-30 01:27:46', '2024-05-30 01:27:46'),
('9d26e238-fd4e-40bc-bf91-e66b5c77fb1e', 'white_logo', '1032', '2024-10-02 16:08:17', '2025-01-01 16:30:23'),
('9d27b02f-7fcd-4c5c-a380-8c92fc16ca9a', 'black_logo', '1031', '2024-10-03 01:44:11', '2025-01-01 16:30:23');

-- --------------------------------------------------------

--
-- Table structure for table `tours`
--

CREATE TABLE `tours` (
  `id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `image` bigint DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `flash_sale` tinyint(1) DEFAULT NULL,
  `best_seller` tinyint(1) DEFAULT NULL,
  `multi_country` tinyint(1) DEFAULT NULL,
  `important_notes` text COLLATE utf8mb4_general_ci,
  `offer_conditions` text COLLATE utf8mb4_general_ci,
  `operator_status` tinyint DEFAULT NULL,
  `itinerary_image` bigint DEFAULT NULL,
  `itinerary_pdf` bigint DEFAULT NULL,
  `itinerary_description` text COLLATE utf8mb4_general_ci,
  `not_included` text COLLATE utf8mb4_general_ci,
  `country` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `availability` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tours`
--

INSERT INTO `tours` (`id`, `user_id`, `title`, `sub_title`, `description`, `image`, `status`, `flash_sale`, `best_seller`, `multi_country`, `important_notes`, `offer_conditions`, `operator_status`, `itinerary_image`, `itinerary_pdf`, `itinerary_description`, `not_included`, `country`, `availability`, `created_at`, `updated_at`) VALUES
('9b65d88e-a02d-499f-b74d-64db47929992', 42, 'Ancient Ruins, Mykonos', 'Greece in 11 Days, 9 Nights in Destination', '<p class=\"ql-align-justify\">Explore the enchanting landscapes and vibrant cultures on our exclusive guided tour. Immerse yourself in the rich history of each destination as our knowledgeable guides lead you through iconic landmarks and hidden gems. From bustling cityscapes to serene natural wonders, this journey promises an unforgettable adventure. Savor local cuisine, connect with fellow travelers, and create memories that will last a lifetime. <a href=\"www.goole.com\" rel=\"noopener noreferrer\" target=\"_blank\">Google</a></p>', 63, 1, 1, 1, 1, '<p class=\"ql-align-justify\">Please ensure you have a valid passport with at least<strong> six months</strong> validity beyond the tour end date.</p><p class=\"ql-align-justify\">Comfortable walking shoes are recommended for exploring various sites during the tour.</p><p class=\"ql-align-justify\">Be <strong>prepared</strong> for diverse weather conditions; pack layers and check the forecast for each destination.</p><p class=\"ql-align-justify\">Follow the provided itinerary to make the most of the included activities and excursions.</p><p class=\"ql-align-justify\">Inform the tour guide of any dietary <strong>restrictions</strong> or medical conditions for personalized assistance.</p>', '<p>This offer is valid for bookings made before [expiration date].</p><p>Prices are based on double occupancy; single supplement charges apply for solo travelers.</p><p>A non-refundable deposit is required to secure your reservation; the remaining balance is due [number of days] days before the tour start date.</p><p>Changes to the itinerary may occur due to unforeseen circumstances; alternative activities will be provided.</p><p>Special promotions and discounts are subject to availability and may have blackout dates.</p>', 1, 3, 278, '<p class=\"ql-align-justify\"><span style=\"background-color: rgb(255, 255, 0);\">This offer is valid for bookings made before.</span><strong style=\"color: rgb(153, 51, 255);\">Prices are based on double occupancy; single supplement charges apply for solo travelers.</strong>A non-refundable deposit is required to secure your reservation; the remaining balance is due [number of days] days before the tour start date. <span style=\"color: rgb(230, 0, 0);\">Changes to the itinerary may occur due to unforeseen circumstances; alternative activities will be provided.</span><span style=\"color: rgb(0, 138, 0);\">Special promotions and discounts are subject to availability and may have blackout dates.</span></p>', '<p><span style=\"background-color: rgb(255, 255, 0);\">This offer is valid for bookings made before.</span><strong style=\"color: rgb(153, 51, 255);\">Prices are based on double occupancy; single supplement charges apply for solo travelers.</strong>A non-refundable deposit is required to secure your reservation; the remaining balance is due [number of days] days before the tour start date. <span style=\"color: rgb(230, 0, 0);\">Changes to the itinerary may occur due to unforeseen circumstances; alternative activities will be provided.</span><span style=\"color: rgb(0, 138, 0);\">Special promotions and discounts are subject to availability and may have blackout dates.</span></p>', '41', 'Departures available until October 2025\nAvailable Group tours\nSolo travelers from + $700\nAdd up to 4 nights to your stay', '2024-02-22 15:56:45', '2024-09-23 14:34:21'),
('9b65d88f-a02d-499f-b74d-64db47929992', NULL, 'Sparkling Starry Affair', 'Sparkling-Starry Sub', '<p class=\"ql-align-justify\">Explore the enchanting landscapes and vibrant cultures on our exclusive guided tour. Immerse yourself in the rich history of each destination as our knowledgeable guides lead you through iconic landmarks and hidden gems. From bustling cityscapes to serene natural wonders, this journey promises an unforgettable adventure. Savor local cuisine, connect with fellow travelers, and create memories that will last a lifetime. <a href=\"www.goole.com\" rel=\"noopener noreferrer\" target=\"_blank\">Google</a></p>', 64, 1, 1, 1, 1, '<p class=\"ql-align-justify\">Please ensure you have a valid passport with at least<strong> six months</strong> validity beyond the tour end date.</p><p class=\"ql-align-justify\">Comfortable walking shoes are recommended for exploring various sites during the tour.</p><p class=\"ql-align-justify\">Be <strong>prepared</strong> for diverse weather conditions; pack layers and check the forecast for each destination.</p><p class=\"ql-align-justify\">Follow the provided itinerary to make the most of the included activities and excursions.</p><p class=\"ql-align-justify\">Inform the tour guide of any dietary <strong>restrictions</strong> or medical conditions for personalized assistance.</p><p><br></p>', '<p>This offer is valid for bookings made before [expiration date].</p><p>Prices are based on double occupancy; single supplement charges apply for solo travelers.</p><p>A non-refundable deposit is required to secure your reservation; the remaining balance is due [number of days] days before the tour start date.</p><p>Changes to the itinerary may occur due to unforeseen circumstances; alternative activities will be provided.</p><p>Special promotions and discounts are subject to availability and may have blackout dates.</p><p><br></p>', 1, 232, 378, '<p>12</p>', '<p>null</p>', '39', NULL, '2024-02-22 10:54:32', '2024-09-23 14:34:40'),
('9b66455d-ed10-4354-b56f-37b6492d9acb', NULL, 'Luminous Sunset Serenade', 'Luminous Sunset Serenade', '<p><span style=\"color: rgb(77, 81, 86);\">In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.</span></p>', 65, 1, 1, 1, 1, '<p><span style=\"color: rgb(77, 81, 86);\">In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.</span></p>', '<p class=\"ql-align-justify\"><span style=\"color: rgb(77, 81, 86);\">In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.</span></p>', 1, 314, 315, '<p><span style=\"color: rgb(77, 81, 86);\">In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.</span></p>', '<p><span style=\"color: rgb(77, 81, 86);\">In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.</span></p>', '73', NULL, '2024-02-22 15:58:47', '2024-09-23 14:35:00'),
('9c5efda7-892b-4cdb-95ba-e1f1ce241e76', 1, 'Car Racing Tour', 'Tesla Anouncement Car Racing', '<p><span style=\"color: rgb(77, 81, 86);\">In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.</span></p>', 79, 1, 1, 1, 1, '<p><span style=\"color: rgb(77, 81, 86);\">In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.</span></p>', '<p><span style=\"color: rgb(77, 81, 86);\">In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.</span></p>', 1, NULL, 317, '<p><span style=\"color: rgb(77, 81, 86);\">In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.</span></p>', '<p><span style=\"color: rgb(77, 81, 86);\">In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.</span></p>', NULL, NULL, '2024-06-25 07:19:24', '2024-09-23 14:46:58'),
('9c7109e6-bd1a-46d1-bf56-267ab83d3192', 1, 'Glashier Park', '10 Day Glashier Park Tour', '<p>test	</p>', 76, 1, 1, 1, 0, '<p>test			</p>', '<p>test</p>', 1, NULL, NULL, '<p>test</p>', '<p>test</p>', NULL, NULL, '2024-07-04 06:38:33', '2024-09-23 14:45:58');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lang_key` mediumtext COLLATE utf8mb4_general_ci,
  `lang_value` mediumtext COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
('9ce06039-ca5d-4249-be9f-177d11ed51f5', 'US', 'Email', 'Email', '2024-08-28 14:56:50', '2024-08-28 14:56:50'),
('9ce06039-ca5d-4640-bf5f-cce019f96ba5', 'US', 'Password', 'Password', '2024-08-28 14:56:50', '2024-08-28 14:56:50'),
('9ce0603a-8f25-41bc-9dd1-e93ec8e4c066', 'ES', 'Email', 'Email', '2024-08-28 14:56:50', '2024-08-28 14:56:50'),
('9ce0603a-8f25-4f92-bcbb-05aec19eb2c5', 'ES', 'Password', 'Password', '2024-08-28 14:56:50', '2024-08-28 14:56:50'),
('9ce0603a-fc69-4073-ab18-bcff0dad0f87', 'US', 'Register new user', 'Register new user', '2024-08-28 14:56:50', '2024-08-28 14:56:50'),
('9ce0603a-fcac-44d2-b657-dd805e79f363', 'US', 'Log in', 'Log in', '2024-08-28 14:56:50', '2024-08-28 14:56:50'),
('9ce0603b-018b-4058-bef0-e5c7d292bd52', 'ES', 'Log in', 'Log in', '2024-08-28 14:56:50', '2024-08-28 14:56:50'),
('9ce0603b-01c9-442f-be79-ddf2f955ae24', 'ES', 'Register new user', 'Register new user', '2024-08-28 14:56:50', '2024-08-28 14:56:50'),
('9ce0603b-801d-4b73-9707-2fe939511f6f', 'US', 'Forgot password', 'Forgot password', '2024-08-28 14:56:51', '2024-08-28 14:56:51'),
('9ce0603b-82c6-409d-9527-df419cb7fd4e', 'ES', 'Forgot password', 'Forgot password', '2024-08-28 14:56:51', '2024-08-28 14:56:51'),
('9ce0603f-ff16-4e47-be99-9c51d9c163cd', 'US', 'Profile settings', 'Profile settings', '2024-08-28 14:56:54', '2024-08-28 14:56:54'),
('9ce06040-02dd-4cdd-94dc-d60fbbba8616', 'ES', 'Profile settings', 'Profile settings', '2024-08-28 14:56:54', '2024-08-28 14:56:54'),
('9ce06040-6d91-4016-b321-8623bf2f739a', 'US', 'Welcome email', 'Welcome email', '2024-08-28 14:56:54', '2024-08-28 14:56:54'),
('9ce06040-7018-4b2e-a48c-1d316e5d7a73', 'ES', 'Welcome email', 'Welcome email', '2024-08-28 14:56:54', '2024-08-28 14:56:54'),
('9ce06040-d385-4b5a-8426-5e57f5b1eacb', 'US', 'Verification code email', 'Verification code email', '2024-08-28 14:56:54', '2024-08-28 14:56:54'),
('9ce06040-d611-4995-a77e-8ec3fa76f276', 'ES', 'Verification code email', 'Verification code email', '2024-08-28 14:56:54', '2024-08-28 14:56:54'),
('9ce06041-0195-4db3-ab37-af7cf76a87d1', 'US', 'Emails', 'Emails', '2024-08-28 14:56:54', '2024-08-28 14:56:54'),
('9ce06041-0665-42f3-80e9-045af72a45da', 'ES', 'Emails', 'Emails', '2024-08-28 14:56:54', '2024-08-28 14:56:54'),
('9ce06041-3e4f-40a3-a7d4-31ff8fa88f66', 'US', 'Offices', 'Offices', '2024-08-28 14:56:54', '2024-08-28 14:56:54'),
('9ce06041-406c-4a14-9202-739452fbfbca', 'ES', 'Offices', 'Offices', '2024-08-28 14:56:54', '2024-08-28 14:56:54'),
('9ce06041-6a57-4bb9-b103-47755226c546', 'US', 'Reset password email', 'Reset password email', '2024-08-28 14:56:55', '2024-08-28 14:56:55'),
('9ce06041-6e15-4e33-907f-2cb427ac12b2', 'ES', 'Reset password email', 'Reset password email', '2024-08-28 14:56:55', '2024-08-28 14:56:55'),
('9ce06041-aafd-4da7-8380-17b939a84ab3', 'US', 'User reviews', 'User reviews', '2024-08-28 14:56:55', '2024-08-28 14:56:55'),
('9ce06041-aebe-496a-b094-a0f705e8998f', 'ES', 'User reviews', 'User reviews', '2024-08-28 14:56:55', '2024-08-28 14:56:55'),
('9ce06041-cc23-4ae4-83c4-0be0c5a54b62', 'US', 'External website', 'External website', '2024-08-28 14:56:55', '2024-08-28 14:56:55'),
('9ce06041-d038-4cfc-a581-4f2bbee33c7b', 'ES', 'External website', 'External website', '2024-08-28 14:56:55', '2024-08-28 14:56:55'),
('9ce06042-1a90-436d-a060-c629d3a94e67', 'US', 'User contact', 'User contact', '2024-08-28 14:56:55', '2024-08-28 14:56:55'),
('9ce06042-1cfe-42db-96f6-57eac505c36a', 'ES', 'User contact', 'User contact', '2024-08-28 14:56:55', '2024-08-28 14:56:55'),
('9ce06042-412f-4212-a288-6a9c987ece9c', 'US', 'Call Now', 'Call Now', '2024-08-28 14:56:55', '2024-08-28 14:56:55'),
('9ce06042-4509-4077-b262-c6a63d2389e1', 'ES', 'Call Now', 'Call Now', '2024-08-28 14:56:55', '2024-08-28 14:56:55'),
('9ce06042-8445-474f-8618-bac511d86ad7', 'US', 'Special tours', 'Special tours', '2024-08-28 14:56:55', '2024-08-28 14:56:55'),
('9ce06042-868c-44c0-9108-33873ec5e398', 'ES', 'Special tours', 'Special tours', '2024-08-28 14:56:55', '2024-08-28 14:56:55'),
('9ce06042-a279-4488-a6d4-ade00902430c', 'US', 'Users', 'Users', '2024-08-28 14:56:55', '2024-08-28 14:56:55'),
('9ce06042-a494-45d7-99ae-d3ebef26985f', 'ES', 'Users', 'Users', '2024-08-28 14:56:55', '2024-08-28 14:56:55'),
('9ce06042-f964-4650-a5a2-f6ae1b3b3219', 'US', 'Tour countries', 'Tour countries', '2024-08-28 14:56:56', '2024-08-28 14:56:56'),
('9ce06042-fe3e-4537-9dbe-b93c528ed88e', 'ES', 'Tour countries', 'Tour countries', '2024-08-28 14:56:56', '2024-08-28 14:56:56'),
('9ce06043-529e-4a88-8448-dc61a237ce1a', 'US', 'Our promises', 'Our promises', '2024-08-28 14:56:56', '2024-08-28 14:56:56'),
('9ce06043-5561-4645-88a2-24c9278fa95e', 'ES', 'Our promises', 'Our promises', '2024-08-28 14:56:56', '2024-08-28 14:56:56'),
('9ce060d1-de1a-4a6d-b6c3-72cd09883a44', 'US', 'Language', 'Language', '2024-08-28 14:58:29', '2024-08-28 14:58:29'),
('9ce060d1-e3ed-4cea-9811-e94868201141', 'ES', 'Language', 'Language', '2024-08-28 14:58:29', '2024-08-28 14:58:29'),
('9ce060d2-a852-4d9d-96d0-667748ccfc7e', 'US', 'Choose default language', 'Choose default language', '2024-08-28 14:58:30', '2024-08-28 14:58:30'),
('9ce060d2-abb4-4e89-924e-5db7c6f7fef0', 'ES', 'Choose default language', 'Choose default language', '2024-08-28 14:58:30', '2024-08-28 14:58:30'),
('9ce060d2-ad1c-476c-9c4a-d4de2c902c4d', 'US', 'Save', 'Save', '2024-08-28 14:58:30', '2024-08-28 14:58:30'),
('9ce060d2-b045-41df-9706-3156156e9cc4', 'ES', 'Save', 'Save', '2024-08-28 14:58:30', '2024-08-28 14:58:30'),
('9ce060d3-6ac6-4ea3-8496-e7492ef40c7b', 'US', 'Translations', 'Translations', '2024-08-28 14:58:30', '2024-08-28 14:58:30'),
('9ce060d3-6d83-4d61-895c-5a9442ac39fd', 'ES', 'Translations', 'Translations', '2024-08-28 14:58:30', '2024-08-28 14:58:30'),
('9ce060d3-7026-4acd-b4d9-da6d38a9e3dd', 'US', 'Edit', 'Edit', '2024-08-28 14:58:30', '2024-08-28 14:58:30'),
('9ce060d3-73ff-48cb-ac23-6c736e0b63f3', 'ES', 'Edit', 'Edit', '2024-08-28 14:58:30', '2024-08-28 14:58:30'),
('9ce060d4-5c4b-4a60-9d37-afc968dc2f86', 'US', 'Delete', 'Delete', '2024-08-28 14:58:31', '2024-08-28 14:58:31'),
('9ce060d4-5ef7-4bb6-b78c-55650c7b74fd', 'ES', 'Delete', 'Delete', '2024-08-28 14:58:31', '2024-08-28 14:58:31'),
('9ce060d4-5f5d-43fa-a2e6-35712a9af56f', 'US', 'Delete', 'Delete', '2024-08-28 14:58:31', '2024-08-28 14:58:31'),
('9ce060d4-630f-44e1-9a30-3361ef7b73d2', 'ES', 'Delete', 'Delete', '2024-08-28 14:58:31', '2024-08-28 14:58:31'),
('9ce060d6-4b7a-4a07-8222-99e70c7dc03d', 'US', 'Search by name', 'Search by name', '2024-08-28 14:58:32', '2024-08-28 14:58:32'),
('9ce060d6-4fd4-42f2-8324-c44ffcd7d235', 'ES', 'Search by name', 'Search by name', '2024-08-28 14:58:32', '2024-08-28 14:58:32'),
('9ce060d6-d3fd-4235-83eb-ad8dac4238dd', 'US', 'Name', 'Name', '2024-08-28 14:58:33', '2024-08-28 14:58:33'),
('9ce060d6-d9d7-4b5a-bebb-0631c86ea10a', 'ES', 'Name', 'Name', '2024-08-28 14:58:33', '2024-08-28 14:58:33'),
('9ce060d6-dfa5-4a78-8f98-65e5f82e1a4b', 'US', 'Phone', 'Phone', '2024-08-28 14:58:33', '2024-08-28 14:58:33'),
('9ce060d6-e3bf-4dbf-bd50-aa45d5407528', 'ES', 'Phone', 'Phone', '2024-08-28 14:58:33', '2024-08-28 14:58:33'),
('9ce060f0-1d95-4918-b28d-fa20ee1937cb', 'US', 'Login', 'Login', '2024-08-28 14:58:49', '2024-08-28 14:58:49'),
('9ce060f0-21fa-41de-8615-377c73c106b6', 'ES', 'Login', 'Login', '2024-08-28 14:58:49', '2024-08-28 14:58:49'),
('9ce060f0-b9fa-4f58-8b7a-f24e58ee998c', 'US', 'Reset your password', 'Reset your password', '2024-08-28 14:58:49', '2024-08-28 14:58:49'),
('9ce060f0-be28-412e-8155-9a147a8350e9', 'ES', 'Reset your password', 'Reset your password', '2024-08-28 14:58:49', '2024-08-28 14:58:49'),
('9ce060f0-c245-4643-99be-ce0fe78516f9', 'US', 'Submit', 'Submit', '2024-08-28 14:58:49', '2024-08-28 14:58:49'),
('9ce060f0-c68f-453b-b05c-a5d460afe425', 'ES', 'Submit', 'Submit', '2024-08-28 14:58:49', '2024-08-28 14:58:49'),
('9ce060f1-4f22-456b-a066-e00e8b8149a8', 'US', 'Full name', 'Full name', '2024-08-28 14:58:50', '2024-08-28 14:58:50'),
('9ce060f1-52f3-44e5-a771-3ce4b6a9c654', 'ES', 'Full name', 'Full name', '2024-08-28 14:58:50', '2024-08-28 14:58:50'),
('9ce060f1-c89f-4c08-8af7-a252b640cc07', 'US', 'Account type', 'Account type', '2024-08-28 14:58:50', '2024-08-28 14:58:50'),
('9ce060f1-ccab-4257-b28d-8a2763728ff7', 'ES', 'Account type', 'Account type', '2024-08-28 14:58:50', '2024-08-28 14:58:50'),
('9ce060f2-1f0e-490a-9695-4456c98f6084', 'US', 'User', 'User', '2024-08-28 14:58:50', '2024-08-28 14:58:50'),
('9ce060f2-2261-403e-bb04-05b8127a512e', 'ES', 'User', 'User', '2024-08-28 14:58:50', '2024-08-28 14:58:50'),
('9ce060f2-3f8c-46cc-b1c7-b1fcfbe74b53', 'US', 'Tour operator', 'Tour operator', '2024-08-28 14:58:50', '2024-08-28 14:58:50'),
('9ce060f2-41e6-4c61-a0cd-8cb979c510f7', 'ES', 'Tour operator', 'Tour operator', '2024-08-28 14:58:50', '2024-08-28 14:58:50'),
('9ce060f2-9566-4752-be0f-39029ae937fc', 'US', 'Confirm password', 'Confirm password', '2024-08-28 14:58:51', '2024-08-28 14:58:51'),
('9ce060f2-982a-47b5-bfd6-dbf0f0333fe3', 'ES', 'Confirm password', 'Confirm password', '2024-08-28 14:58:51', '2024-08-28 14:58:51'),
('9ce060f2-fdce-42e0-82e7-d31319c74f3a', 'US', 'Register', 'Register', '2024-08-28 14:58:51', '2024-08-28 14:58:51'),
('9ce060f3-011b-4ac0-8ced-c880a6db3ccb', 'ES', 'Register', 'Register', '2024-08-28 14:58:51', '2024-08-28 14:58:51'),
('9ce060f3-5cd4-44ad-a760-367c9ad0937e', 'US', 'Call us now', 'Call us now', '2024-08-28 14:58:51', '2024-08-28 14:58:51'),
('9ce060f3-5f67-43a1-9b18-e6cfaffd6974', 'ES', 'Call us now', 'Call us now', '2024-08-28 14:58:51', '2024-08-28 14:58:51'),
('9ce060f3-cd41-4c3d-ac3e-ec46e1f94ce5', 'US', 'Search by country', 'Search by country', '2024-08-28 14:58:51', '2024-08-28 14:58:51'),
('9ce060f3-d0eb-4e06-a580-d224415c7017', 'ES', 'Search by country', 'Search by country', '2024-08-28 14:58:51', '2024-08-28 14:58:51'),
('9ce060f3-df6e-4edb-bd90-26ea42fa5ac9', 'US', 'Search', 'Search', '2024-08-28 14:58:52', '2024-08-28 14:58:52'),
('9ce060f3-e270-4a77-92da-fde6660ec724', 'ES', 'Search', 'Search', '2024-08-28 14:58:52', '2024-08-28 14:58:52'),
('9ce0616d-0125-439d-8ec7-3f77df5fc0da', 'US', 'Regions', 'Regions', '2024-08-28 15:00:11', '2024-08-28 15:00:11'),
('9ce0616d-0442-4a32-bffd-82be01c0680d', 'US', 'Builders', 'Builders', '2024-08-28 15:00:11', '2024-08-28 15:00:11'),
('9ce0616d-0612-4ee1-bbb1-1c9eaca9b492', 'ES', 'Regions', 'Regions', '2024-08-28 15:00:11', '2024-08-28 15:00:11'),
('9ce0616d-0770-4ece-8bd0-98dfa70f75b7', 'ES', 'Builders', 'Builders', '2024-08-28 15:00:11', '2024-08-28 15:00:11'),
('9ce0616d-7147-4442-8adf-87795357d9a3', 'US', 'Schools', 'Schools', '2024-08-28 15:00:11', '2024-08-28 15:00:11'),
('9ce0616d-73a9-4051-a0ec-3249b4ba52e8', 'ES', 'Schools', 'Schools', '2024-08-28 15:00:11', '2024-08-28 15:00:11'),
('9ce0616d-794d-4be5-8f51-ea84ad57273e', 'US', 'HOA', 'HOA', '2024-08-28 15:00:11', '2024-08-28 15:00:11'),
('9ce0616d-7bef-41fb-8d12-944f9bebe93f', 'ES', 'HOA', 'HOA', '2024-08-28 15:00:11', '2024-08-28 15:00:11'),
('9ce0616d-c08b-4874-afe5-756beeb17fce', 'US', 'Neighborhood', 'Neighborhood', '2024-08-28 15:00:11', '2024-08-28 15:00:11'),
('9ce0616d-c2b9-4403-b04d-3570ba90aef3', 'ES', 'Neighborhood', 'Neighborhood', '2024-08-28 15:00:11', '2024-08-28 15:00:11'),
('9ce0616d-c7d9-4bff-8e62-951dac58d2aa', 'US', 'Amenities', 'Amenities', '2024-08-28 15:00:11', '2024-08-28 15:00:11'),
('9ce0616d-ca53-43b0-be88-a00d18c88086', 'ES', 'Amenities', 'Amenities', '2024-08-28 15:00:11', '2024-08-28 15:00:11'),
('9ce0616e-1376-44d4-bb31-90e99804eeeb', 'US', 'Communities', 'Communities', '2024-08-28 15:00:12', '2024-08-28 15:00:12'),
('9ce0616e-15c4-44e8-b12c-2aeb239f70d0', 'ES', 'Communities', 'Communities', '2024-08-28 15:00:12', '2024-08-28 15:00:12'),
('9ce0616e-1afe-4be9-bf31-64e312f9039a', 'US', 'Settings', 'Settings', '2024-08-28 15:00:12', '2024-08-28 15:00:12'),
('9ce0616e-1d32-4ede-b0ec-71e8d520afa8', 'ES', 'Settings', 'Settings', '2024-08-28 15:00:12', '2024-08-28 15:00:12'),
('9ce0617a-59dd-4373-ae7c-fc922334808d', 'US', 'Add new region', 'Add new region', '2024-08-28 15:00:20', '2024-08-28 15:00:20'),
('9ce0617a-5d74-40e5-a040-c5c0f9e40f30', 'ES', 'Add new region', 'Add new region', '2024-08-28 15:00:20', '2024-08-28 15:00:20'),
('9ce0617a-c077-4902-b3d1-91518035c193', 'US', 'Boundaries', 'Boundaries', '2024-08-28 15:00:20', '2024-08-28 15:00:20'),
('9ce0617a-c2c1-463c-b372-52a768d46c1d', 'ES', 'Boundaries', 'Boundaries', '2024-08-28 15:00:20', '2024-08-28 15:00:20'),
('9ce0617a-dd0a-4e5b-b28b-457552f00c9f', 'US', 'Description', 'Description', '2024-08-28 15:00:20', '2024-08-28 15:00:20'),
('9ce0617a-e06c-4e52-b6c6-d58afcb92d78', 'ES', 'Description', 'Description', '2024-08-28 15:00:20', '2024-08-28 15:00:20'),
('9ce0617b-3c4b-46c9-978c-7d2da256c13b', 'US', 'Action', 'Action', '2024-08-28 15:00:20', '2024-08-28 15:00:20'),
('9ce0617b-3e96-4c18-8cfb-d9c2e24c6ab9', 'ES', 'Action', 'Action', '2024-08-28 15:00:20', '2024-08-28 15:00:20'),
('9ce0617d-d3dc-4aa3-bf7a-fe752c3b0740', 'US', 'Add new builder', 'Add new builder', '2024-08-28 15:00:22', '2024-08-28 15:00:22'),
('9ce0617d-d6bc-41a4-ae9a-b4ec1ff91dd5', 'ES', 'Add new builder', 'Add new builder', '2024-08-28 15:00:22', '2024-08-28 15:00:22'),
('9ce06182-7378-44c9-8897-71d3635c89cf', 'US', 'Add new school', 'Add new school', '2024-08-28 15:00:25', '2024-08-28 15:00:25'),
('9ce06182-7708-49c3-a028-ea2998dfdbc2', 'ES', 'Add new school', 'Add new school', '2024-08-28 15:00:25', '2024-08-28 15:00:25'),
('9ce06182-d0ef-4275-8ee9-aa91ab695b55', 'US', 'Directions & details', 'Directions & details', '2024-08-28 15:00:25', '2024-08-28 15:00:25'),
('9ce06182-d3d0-4ad5-b986-b37695b84d7d', 'ES', 'Directions & details', 'Directions & details', '2024-08-28 15:00:25', '2024-08-28 15:00:25'),
('9ce06182-e30b-46a7-ab71-74e7f9677c52', 'US', 'Type', 'Type', '2024-08-28 15:00:25', '2024-08-28 15:00:25'),
('9ce06182-e526-4c81-9fdd-1003e5625ed9', 'ES', 'Type', 'Type', '2024-08-28 15:00:25', '2024-08-28 15:00:25'),
('9ce06187-e648-4bdb-99e0-0d9337405c89', 'US', 'Add new HOA', 'Add new HOA', '2024-08-28 15:00:29', '2024-08-28 15:00:29'),
('9ce06187-eb52-489a-98b7-f158e09dce75', 'ES', 'Add new HOA', 'Add new HOA', '2024-08-28 15:00:29', '2024-08-28 15:00:29'),
('9ce06188-365d-41b2-a12e-4fe9275b9d08', 'US', 'Location', 'Location', '2024-08-28 15:00:29', '2024-08-28 15:00:29'),
('9ce06188-38da-4c1b-997f-b2c2c35ceeb0', 'ES', 'Location', 'Location', '2024-08-28 15:00:29', '2024-08-28 15:00:29'),
('9ce06188-4820-47bb-9808-4d4e46f0327e', 'US', 'Image', 'Image', '2024-08-28 15:00:29', '2024-08-28 15:00:29'),
('9ce06188-4a36-4351-bcb6-2fdf583fef21', 'ES', 'Image', 'Image', '2024-08-28 15:00:29', '2024-08-28 15:00:29'),
('9ce0618b-a0c6-48fd-8a62-21bd3cfc2aaf', 'US', 'Add new neighborhood', 'Add new neighborhood', '2024-08-28 15:00:31', '2024-08-28 15:00:31'),
('9ce0618b-a4e7-4a14-a0c5-2896055c8fa0', 'ES', 'Add new neighborhood', 'Add new neighborhood', '2024-08-28 15:00:31', '2024-08-28 15:00:31'),
('9ce0618d-b428-48db-964c-e9623e8f14e4', 'US', 'Add new community', 'Add new community', '2024-08-28 15:00:32', '2024-08-28 15:00:32'),
('9ce0618d-b8ff-4337-9958-6c03ab79a2c9', 'ES', 'Add new community', 'Add new community', '2024-08-28 15:00:32', '2024-08-28 15:00:32'),
('9ce0619d-b168-46a6-82af-2dfa69a5464e', 'US', 'Add new incentive', 'Add new incentive', '2024-08-28 15:00:43', '2024-08-28 15:00:43'),
('9ce0619d-b470-4fb9-aecf-fa10ec9ef91c', 'ES', 'Add new incentive', 'Add new incentive', '2024-08-28 15:00:43', '2024-08-28 15:00:43'),
('9ce0619e-24d1-447f-944c-98f556534088', 'US', 'Title', 'Title', '2024-08-28 15:00:43', '2024-08-28 15:00:43'),
('9ce0619e-26b5-4507-a241-e584592481de', 'US', 'Search by title', 'Search by title', '2024-08-28 15:00:43', '2024-08-28 15:00:43'),
('9ce0619e-28b8-408c-90b6-4b7cc6cd1b79', 'ES', 'Title', 'Title', '2024-08-28 15:00:43', '2024-08-28 15:00:43'),
('9ce0619e-2a3a-4770-9344-eb88faf7f211', 'ES', 'Search by title', 'Search by title', '2024-08-28 15:00:43', '2024-08-28 15:00:43'),
('9ce0619e-870a-4ae1-adfc-1348df09be1f', 'US', 'Home', 'Home', '2024-08-28 15:00:43', '2024-08-28 15:00:43'),
('9ce0619e-8c37-4c5a-b901-f72364b05507', 'ES', 'Home', 'Home', '2024-08-28 15:00:43', '2024-08-28 15:00:43'),
('9ce0619e-931c-4ae5-9782-b286e5c53a23', 'US', 'Status', 'Status', '2024-08-28 15:00:43', '2024-08-28 15:00:43'),
('9ce0619e-9717-4ad6-a0e6-1e0fa111fed9', 'ES', 'Status', 'Status', '2024-08-28 15:00:43', '2024-08-28 15:00:43'),
('9ce0619e-eb0b-4493-83e7-aa241a94f263', 'US', 'End Date', 'End Date', '2024-08-28 15:00:44', '2024-08-28 15:00:44'),
('9ce0619e-ee21-418e-879b-8961622c227b', 'ES', 'End Date', 'End Date', '2024-08-28 15:00:44', '2024-08-28 15:00:44'),
('9ce0619e-f818-4059-8d79-ed3e871f6b28', 'US', 'Start Date', 'Start Date', '2024-08-28 15:00:44', '2024-08-28 15:00:44'),
('9ce0619e-fb4d-4faa-ade8-3acbec415104', 'ES', 'Start Date', 'Start Date', '2024-08-28 15:00:44', '2024-08-28 15:00:44'),
('9ce0619f-6008-4276-8d81-f69132842148', 'US', 'Descriptions', 'Descriptions', '2024-08-28 15:00:44', '2024-08-28 15:00:44'),
('9ce0619f-62b7-424a-96e0-d11b41caa990', 'ES', 'Descriptions', 'Descriptions', '2024-08-28 15:00:44', '2024-08-28 15:00:44'),
('9ce061a9-d5ef-45e2-9355-9415da4a709f', 'US', 'Blog Posts', 'Blog Posts', '2024-08-28 15:00:51', '2024-08-28 15:00:51'),
('9ce061a9-db09-4c2f-b06c-800a0a965100', 'ES', 'Blog Posts', 'Blog Posts', '2024-08-28 15:00:51', '2024-08-28 15:00:51'),
('9ce061aa-4b97-4268-b90a-fd8138ce3722', 'US', 'Add new blog post', 'Add new blog post', '2024-08-28 15:00:51', '2024-08-28 15:00:51'),
('9ce061aa-5013-4bb2-b260-a37c0f6ed92f', 'ES', 'Add new blog post', 'Add new blog post', '2024-08-28 15:00:51', '2024-08-28 15:00:51'),
('9ce061aa-b1a2-4a3e-bdc3-e8a806bb5cf4', 'US', 'Content', 'Content', '2024-08-28 15:00:51', '2024-08-28 15:00:51'),
('9ce061aa-b1b7-412f-87b0-daa7e9943df4', 'US', 'Author', 'Author', '2024-08-28 15:00:51', '2024-08-28 15:00:51'),
('9ce061aa-b3c0-44fc-ac9c-065c7b109862', 'ES', 'Content', 'Content', '2024-08-28 15:00:51', '2024-08-28 15:00:51'),
('9ce061aa-b3ec-4dfa-9068-babdcae23078', 'ES', 'Author', 'Author', '2024-08-28 15:00:51', '2024-08-28 15:00:51'),
('9ce061c1-54ce-435d-9786-68ba909c2b31', 'US', 'Create Tour', 'Create Tour', '2024-08-28 15:01:06', '2024-08-28 15:01:06'),
('9ce061c1-5885-40d3-8419-431314f50961', 'ES', 'Create Tour', 'Create Tour', '2024-08-28 15:01:06', '2024-08-28 15:01:06'),
('9ce061c1-c8a4-47b0-8fd5-d20f533d8f10', 'US', 'Sub title', 'Sub title', '2024-08-28 15:01:06', '2024-08-28 15:01:06'),
('9ce061c1-cc1e-4ede-9f7c-69b9d36932ca', 'ES', 'Sub title', 'Sub title', '2024-08-28 15:01:06', '2024-08-28 15:01:06'),
('9ce061c1-d664-4597-b762-80f45ca8613b', 'US', 'Search tour by title', 'Search tour by title', '2024-08-28 15:01:07', '2024-08-28 15:01:07'),
('9ce061c1-d94c-4981-bb9f-392dbba2405e', 'ES', 'Search tour by title', 'Search tour by title', '2024-08-28 15:01:07', '2024-08-28 15:01:07'),
('9ce061c2-2ff4-485a-b5e0-a3c5b2bef687', 'US', 'Discount', 'Discount', '2024-08-28 15:01:07', '2024-08-28 15:01:07'),
('9ce061c2-3396-4f5a-a402-299ee1643abf', 'ES', 'Discount', 'Discount', '2024-08-28 15:01:07', '2024-08-28 15:01:07'),
('9ce061c2-3c76-40aa-98bd-0f1f6738b3dd', 'US', 'Price', 'Price', '2024-08-28 15:01:07', '2024-08-28 15:01:07'),
('9ce061c2-3fde-46c3-a103-ed9d4f69db88', 'ES', 'Price', 'Price', '2024-08-28 15:01:07', '2024-08-28 15:01:07'),
('9ce061c2-abe8-41c1-ba04-f989c430743d', 'US', 'Actions', 'Actions', '2024-08-28 15:01:07', '2024-08-28 15:01:07'),
('9ce061c2-af2a-4c2a-9c99-32abfcd0b58e', 'ES', 'Actions', 'Actions', '2024-08-28 15:01:07', '2024-08-28 15:01:07'),
('9ce06213-df3f-4b79-b2f7-ac119b3a4a67', 'US', 'Create community', 'Create community', '2024-08-28 15:02:00', '2024-08-28 15:02:00'),
('9ce06213-e2b7-4a89-8520-c8a7d4c7faf5', 'ES', 'Create community', 'Create community', '2024-08-28 15:02:00', '2024-08-28 15:02:00'),
('9ce06213-ed45-4101-8497-28c1c65a91f0', 'US', 'Create', 'Create', '2024-08-28 15:02:00', '2024-08-28 15:02:00'),
('9ce06213-f00d-41e5-9e75-2b6af0ad773d', 'ES', 'Create', 'Create', '2024-08-28 15:02:00', '2024-08-28 15:02:00'),
('9ce06214-42d4-4963-8675-242a74eef09b', 'US', 'Choose Status', 'Choose Status', '2024-08-28 15:02:01', '2024-08-28 15:02:01'),
('9ce06214-452b-4469-b42e-f0c9ed07be44', 'ES', 'Choose Status', 'Choose Status', '2024-08-28 15:02:01', '2024-08-28 15:02:01'),
('9ce06214-4bce-419b-b1cc-1d595a845910', 'US', 'OFF', 'OFF', '2024-08-28 15:02:01', '2024-08-28 15:02:01'),
('9ce06214-4e6c-4a40-938d-d03379f17ac4', 'ES', 'OFF', 'OFF', '2024-08-28 15:02:01', '2024-08-28 15:02:01'),
('9ce06214-a75a-4445-a580-e15eb623fd08', 'US', 'ON', 'ON', '2024-08-28 15:02:01', '2024-08-28 15:02:01'),
('9ce06214-a7ee-4d11-914a-5c416e1a750f', 'US', 'Change Picture', 'Change Picture', '2024-08-28 15:02:01', '2024-08-28 15:02:01'),
('9ce06214-ab91-4f49-8954-4caa0c5060ff', 'ES', 'ON', 'ON', '2024-08-28 15:02:01', '2024-08-28 15:02:01'),
('9ce06214-abcd-4dc2-add1-684ba80b7b21', 'ES', 'Change Picture', 'Change Picture', '2024-08-28 15:02:01', '2024-08-28 15:02:01'),
('9ce06214-fdb6-40d1-84ad-02cf7cb53273', 'US', 'Crop and Upload', 'Crop and Upload', '2024-08-28 15:02:01', '2024-08-28 15:02:01'),
('9ce06214-fefa-42a7-9979-831a18966d64', 'US', 'Rotate +90deg', 'Rotate +90deg', '2024-08-28 15:02:01', '2024-08-28 15:02:01'),
('9ce06214-ffe4-4313-852d-1155fa00e932', 'ES', 'Crop and Upload', 'Crop and Upload', '2024-08-28 15:02:01', '2024-08-28 15:02:01'),
('9ce06215-0142-40f2-86d2-f70798bc31e2', 'ES', 'Rotate +90deg', 'Rotate +90deg', '2024-08-28 15:02:01', '2024-08-28 15:02:01'),
('9ce06215-598e-4574-ab73-1df658f426e1', 'US', 'Close', 'Close', '2024-08-28 15:02:01', '2024-08-28 15:02:01'),
('9ce06215-5f37-4e08-84e0-1e92255546e1', 'ES', 'Close', 'Close', '2024-08-28 15:02:01', '2024-08-28 15:02:01'),
('9ce06215-6247-441b-a4bd-cb7390b1014b', 'US', 'Choose Picture', 'Choose Picture', '2024-08-28 15:02:01', '2024-08-28 15:02:01'),
('9ce06215-68b4-43f2-a83b-a77d09e5d610', 'ES', 'Choose Picture', 'Choose Picture', '2024-08-28 15:02:01', '2024-08-28 15:02:01'),
('9ce0621a-a1db-453d-b3b1-9ba235461e22', 'US', 'Region', 'Region', '2024-08-28 15:02:05', '2024-08-28 15:02:05'),
('9ce0621a-a1db-4eec-b424-f9ff6cbb8988', 'US', 'Create region', 'Create region', '2024-08-28 15:02:05', '2024-08-28 15:02:05'),
('9ce0621a-a520-4b98-ad9a-336136cea140', 'ES', 'Create region', 'Create region', '2024-08-28 15:02:05', '2024-08-28 15:02:05'),
('9ce0621a-a54a-437d-b0a1-37eec594343e', 'ES', 'Region', 'Region', '2024-08-28 15:02:05', '2024-08-28 15:02:05'),
('9ce0621b-0ccb-4a00-aab3-4250df3913b9', 'US', 'Directions & Details', 'Directions & Details', '2024-08-28 15:02:05', '2024-08-28 15:02:05'),
('9ce0621b-11cc-46d2-9781-2dd26ff4f0fc', 'ES', 'Directions & Details', 'Directions & Details', '2024-08-28 15:02:05', '2024-08-28 15:02:05'),
('9ce47d65-f5ac-4aaa-b01b-59680a7417bb', 'US', 'Create builder', 'Create builder', '2024-08-30 16:01:43', '2024-08-30 16:01:43'),
('9ce47d65-f5b8-4d94-90a7-827302013248', 'US', 'Comminities', 'Comminities', '2024-08-30 16:01:43', '2024-08-30 16:01:43'),
('9ce47d66-a0a5-4746-a503-5e757cbb6ea6', 'ES', 'Create builder', 'Create builder', '2024-08-30 16:01:43', '2024-08-30 16:01:43'),
('9ce47d66-a0d5-4cbd-967e-a848d8f6586a', 'ES', 'Comminities', 'Comminities', '2024-08-30 16:01:43', '2024-08-30 16:01:43'),
('9ce47d67-0dd8-4838-ace0-635ef207cd29', 'US', 'Community', 'Community', '2024-08-30 16:01:43', '2024-08-30 16:01:43'),
('9ce47d67-124f-465e-a23a-be8779c65b87', 'ES', 'Community', 'Community', '2024-08-30 16:01:43', '2024-08-30 16:01:43'),
('9d0979a9-111e-41cd-8bca-cc63951bfff4', 'US', 'Add new amenity', 'Add new amenity', '2024-09-18 01:16:54', '2024-09-18 01:16:54'),
('9d0979aa-131b-4763-b43e-6467c5d71ecb', 'ES', 'Add new amenity', 'Add new amenity', '2024-09-18 01:16:54', '2024-09-18 01:16:54'),
('9d0979ad-4cf9-4fc5-b727-c8cb0d570cf8', 'US', 'School', 'School', '2024-09-18 01:16:56', '2024-09-18 01:16:56'),
('9d0979ad-4f21-44a6-8de9-f84e581c5e1f', 'US', 'Create school', 'Create school', '2024-09-18 01:16:56', '2024-09-18 01:16:56'),
('9d0979ad-5018-446b-bcff-e0463a12f212', 'ES', 'School', 'School', '2024-09-18 01:16:56', '2024-09-18 01:16:56'),
('9d0979ad-53b2-452c-b6a0-8978afedd7d3', 'ES', 'Create school', 'Create school', '2024-09-18 01:16:56', '2024-09-18 01:16:56'),
('9d0979c3-bd10-4cce-b2d7-6ef0814df5f2', 'US', 'Add new home', 'Add new home', '2024-09-18 01:17:11', '2024-09-18 01:17:11'),
('9d0979c3-c10c-4759-a827-8ce00b33538e', 'ES', 'Add new home', 'Add new home', '2024-09-18 01:17:11', '2024-09-18 01:17:11'),
('9d097c0d-5795-40f0-bd7d-80de3c02fd02', 'US', 'Amenity ID', 'Amenity ID', '2024-09-18 01:23:35', '2024-09-18 01:23:35'),
('9d097c0d-58e3-4824-be0b-df1f6a57e16d', 'US', 'HOA ID', 'HOA ID', '2024-09-18 01:23:35', '2024-09-18 01:23:35'),
('9d097c0d-5ef0-499c-8581-2eed4b27b595', 'ES', 'Amenity ID', 'Amenity ID', '2024-09-18 01:23:35', '2024-09-18 01:23:35'),
('9d097c0d-6147-4b3c-997f-36702ea4866f', 'ES', 'HOA ID', 'HOA ID', '2024-09-18 01:23:35', '2024-09-18 01:23:35'),
('9d097c0d-e94b-4594-a904-f73b4c5cb70e', 'US', 'Las Vegas Region ID', 'Las Vegas Region ID', '2024-09-18 01:23:35', '2024-09-18 01:23:35'),
('9d097c0d-ed94-4f07-9849-447bcd5e473e', 'ES', 'Las Vegas Region ID', 'Las Vegas Region ID', '2024-09-18 01:23:35', '2024-09-18 01:23:35'),
('9d097c0d-ef4f-4770-bd8c-49a8ca4c5966', 'US', 'Neighborhood ID', 'Neighborhood ID', '2024-09-18 01:23:35', '2024-09-18 01:23:35'),
('9d097c0d-f315-467a-88a1-caf94caf0d9d', 'ES', 'Neighborhood ID', 'Neighborhood ID', '2024-09-18 01:23:35', '2024-09-18 01:23:35'),
('9d097c0e-5f99-4e42-840c-d841d92f1919', 'US', 'Map Location', 'Map Location', '2024-09-18 01:23:35', '2024-09-18 01:23:35'),
('9d097c0e-62b2-4fb7-99d0-01f422c48fa7', 'ES', 'Map Location', 'Map Location', '2024-09-18 01:23:35', '2024-09-18 01:23:35'),
('9d097c0e-645e-4610-b113-d5488c030bd6', 'US', 'Files', 'Files', '2024-09-18 01:23:35', '2024-09-18 01:23:35'),
('9d097c0e-67c3-40e5-b264-3c4be8691ba4', 'ES', 'Files', 'Files', '2024-09-18 01:23:35', '2024-09-18 01:23:35'),
('9d097c0f-0118-4976-aa33-a2d0bcea03b3', 'US', 'Nearby Properties', 'Nearby Properties', '2024-09-18 01:23:36', '2024-09-18 01:23:36'),
('9d097c0f-048b-418c-b8d8-3d6365e04dbf', 'ES', 'Nearby Properties', 'Nearby Properties', '2024-09-18 01:23:36', '2024-09-18 01:23:36'),
('9d097c0f-07ec-44c4-9e82-3ec6c0c75fed', 'US', 'Legal Subdivision', 'Legal Subdivision', '2024-09-18 01:23:36', '2024-09-18 01:23:36'),
('9d097c0f-0b8e-4dd5-9091-52f57c3757e1', 'ES', 'Legal Subdivision', 'Legal Subdivision', '2024-09-18 01:23:36', '2024-09-18 01:23:36'),
('9d097c0f-5e31-4a66-bc41-07a138f352e2', 'US', 'Sub Association', 'Sub Association', '2024-09-18 01:23:36', '2024-09-18 01:23:36'),
('9d097c0f-6092-4ebc-972b-284313e27bdd', 'ES', 'Sub Association', 'Sub Association', '2024-09-18 01:23:36', '2024-09-18 01:23:36'),
('9d097c0f-62ee-4176-9fca-e50b11c5dfed', 'US', 'Masterplan', 'Masterplan', '2024-09-18 01:23:36', '2024-09-18 01:23:36'),
('9d097c0f-6672-4506-a5f1-84b7450c49dd', 'ES', 'Masterplan', 'Masterplan', '2024-09-18 01:23:36', '2024-09-18 01:23:36'),
('9d097c0f-ce28-4a7e-83e7-9d95e729e5b8', 'US', 'LID', 'LID', '2024-09-18 01:23:36', '2024-09-18 01:23:36'),
('9d097c0f-d261-4684-8596-13e41cba2db3', 'ES', 'LID', 'LID', '2024-09-18 01:23:36', '2024-09-18 01:23:36'),
('9d097c0f-d7dc-4ddd-b1ab-7971af0a08ca', 'US', 'CIC', 'CIC', '2024-09-18 01:23:36', '2024-09-18 01:23:36'),
('9d097c0f-db1b-4c77-ad4a-c9787c03da4f', 'ES', 'CIC', 'CIC', '2024-09-18 01:23:36', '2024-09-18 01:23:36'),
('9d097c10-3d0e-4261-a3a7-53d8232ccd78', 'US', 'SID/LID Fee', 'SID/LID Fee', '2024-09-18 01:23:37', '2024-09-18 01:23:37'),
('9d097c10-4018-49df-8324-c6366e0aca17', 'ES', 'SID/LID Fee', 'SID/LID Fee', '2024-09-18 01:23:37', '2024-09-18 01:23:37'),
('9d097c10-453f-4dab-96dd-247fe93eb116', 'US', 'CID', 'CID', '2024-09-18 01:23:37', '2024-09-18 01:23:37'),
('9d097c10-48b8-4d2b-a40e-210da7e4e258', 'ES', 'CID', 'CID', '2024-09-18 01:23:37', '2024-09-18 01:23:37'),
('9d097c10-976e-4c45-a48c-f6c44015649b', 'US', 'Proximity to Strip', 'Proximity to Strip', '2024-09-18 01:23:37', '2024-09-18 01:23:37'),
('9d097c10-99e3-4ddb-b089-4b5b6283ec47', 'ES', 'Proximity to Strip', 'Proximity to Strip', '2024-09-18 01:23:37', '2024-09-18 01:23:37'),
('9d097c10-9e02-4b91-b100-619b605fa02c', 'US', 'SID/LID Payment Frequency', 'SID/LID Payment Frequency', '2024-09-18 01:23:37', '2024-09-18 01:23:37'),
('9d097c10-a0ad-475c-b003-b5f17106420f', 'ES', 'SID/LID Payment Frequency', 'SID/LID Payment Frequency', '2024-09-18 01:23:37', '2024-09-18 01:23:37'),
('9d097c10-fdb7-4270-91bd-0aa576d80da1', 'US', 'Nearby Attractions', 'Nearby Attractions', '2024-09-18 01:23:37', '2024-09-18 01:23:37'),
('9d097c11-01ca-434f-80db-0912b0265364', 'ES', 'Nearby Attractions', 'Nearby Attractions', '2024-09-18 01:23:37', '2024-09-18 01:23:37'),
('9d097c11-0d11-40fa-84ba-b9fb6dc702f8', 'US', 'Proximity to Airport', 'Proximity to Airport', '2024-09-18 01:23:37', '2024-09-18 01:23:37'),
('9d097c11-1001-49c6-82e5-1aebb9e9d01e', 'ES', 'Proximity to Airport', 'Proximity to Airport', '2024-09-18 01:23:37', '2024-09-18 01:23:37'),
('9d097d4f-c685-405c-a8af-b5787c0dbbe5', 'US', 'Upload Images/Videos', 'Upload Images/Videos', '2024-09-18 01:27:06', '2024-09-18 01:27:06'),
('9d097d4f-cb03-4309-8483-f7b436c36a16', 'ES', 'Upload Images/Videos', 'Upload Images/Videos', '2024-09-18 01:27:06', '2024-09-18 01:27:06'),
('9d097d97-6923-4e6f-82e6-8612f99fd842', 'US', 'Create amenity', 'Create amenity', '2024-09-18 01:27:53', '2024-09-18 01:27:53'),
('9d097d97-6dd6-4803-a7da-b7d5a0464d7a', 'ES', 'Create amenity', 'Create amenity', '2024-09-18 01:27:53', '2024-09-18 01:27:53'),
('9d097eea-0c95-417c-82c1-0a781d26c7c0', 'US', 'Community saved successfully', 'Community saved successfully', '2024-09-18 01:31:35', '2024-09-18 01:31:35'),
('9d097eea-1011-42c5-8d51-504b218faa8c', 'ES', 'Community saved successfully', 'Community saved successfully', '2024-09-18 01:31:35', '2024-09-18 01:31:35'),
('9d097f23-e50e-4e09-9ab1-15947d51d75c', 'US', 'Amenity deleted successfully.', 'Amenity deleted successfully.', '2024-09-18 01:32:13', '2024-09-18 01:32:13'),
('9d097f23-eb4d-47e3-9de7-c3de121b4388', 'ES', 'Amenity deleted successfully.', 'Amenity deleted successfully.', '2024-09-18 01:32:13', '2024-09-18 01:32:13'),
('9d097fa2-e341-42de-bfbc-c5dc26258474', 'US', 'D', 'D', '2024-09-18 01:33:36', '2024-09-18 01:33:36'),
('9d097fa2-e7fb-40ff-ad23-cfcd9ffb7de2', 'ES', 'D', 'D', '2024-09-18 01:33:36', '2024-09-18 01:33:36'),
('9d097fa3-6272-41b2-a534-1b0f555d3b32', 'US', 'De', 'De', '2024-09-18 01:33:36', '2024-09-18 01:33:36'),
('9d097fa3-6953-41dc-8f91-1d5dbf7fa803', 'ES', 'De', 'De', '2024-09-18 01:33:36', '2024-09-18 01:33:36'),
('9d097fa3-c88b-4f0f-aaf5-29edda81921f', 'US', 'Des', 'Des', '2024-09-18 01:33:37', '2024-09-18 01:33:37'),
('9d097fa3-cde1-466f-8a0e-ea170e9ffe1e', 'ES', 'Des', 'Des', '2024-09-18 01:33:37', '2024-09-18 01:33:37'),
('9d097fa4-420e-4c72-b6b2-67c011781672', 'US', 'Desc', 'Desc', '2024-09-18 01:33:37', '2024-09-18 01:33:37'),
('9d097fa4-4703-4bf5-a2b1-ff5ac67a2dfb', 'ES', 'Desc', 'Desc', '2024-09-18 01:33:37', '2024-09-18 01:33:37'),
('9d097fa4-79ef-4be4-8b9a-1f5d1219034b', 'US', 'Desci', 'Desci', '2024-09-18 01:33:37', '2024-09-18 01:33:37'),
('9d097fa4-7ca8-417a-9d8e-c341146c3c32', 'ES', 'Desci', 'Desci', '2024-09-18 01:33:37', '2024-09-18 01:33:37'),
('9d097fa4-c20e-4fda-94d6-56fbc5d3265f', 'US', 'Descip', 'Descip', '2024-09-18 01:33:37', '2024-09-18 01:33:37'),
('9d097fa4-c6a8-48f6-9f7a-b1c542f48a9d', 'ES', 'Descip', 'Descip', '2024-09-18 01:33:37', '2024-09-18 01:33:37'),
('9d097fa5-0398-487d-904c-e1a91797b01a', 'US', 'Descipt', 'Descipt', '2024-09-18 01:33:37', '2024-09-18 01:33:37'),
('9d097fa5-0985-4db1-bdef-87707255a707', 'ES', 'Descipt', 'Descipt', '2024-09-18 01:33:37', '2024-09-18 01:33:37'),
('9d097fa5-6f64-4662-af44-6e7fedabc0d7', 'US', 'Desciptio', 'Desciptio', '2024-09-18 01:33:38', '2024-09-18 01:33:38'),
('9d097fa5-73ed-4517-8571-a283c85047ee', 'ES', 'Desciptio', 'Desciptio', '2024-09-18 01:33:38', '2024-09-18 01:33:38'),
('9d097fa5-b41c-4755-aca5-f3e49b11f39d', 'US', 'Desciption', 'Desciption', '2024-09-18 01:33:38', '2024-09-18 01:33:38'),
('9d097fa5-c1d3-4494-84a1-9c87518ad7e5', 'ES', 'Desciption', 'Desciption', '2024-09-18 01:33:38', '2024-09-18 01:33:38'),
('9d097fa6-a17f-4a77-8c5b-ddf924a19d71', 'US', 'Descipti', 'Descipti', '2024-09-18 01:33:38', '2024-09-18 01:33:38'),
('9d097fa6-a6c6-4477-bfc3-f7b8168419e8', 'ES', 'Descipti', 'Descipti', '2024-09-18 01:33:38', '2024-09-18 01:33:38'),
('9d097fa7-f9e0-4af2-be9e-fb9078c8dc99', 'US', 'Descr', 'Descr', '2024-09-18 01:33:39', '2024-09-18 01:33:39'),
('9d097fa7-fdfb-4a9a-a3f1-a728e846a5c7', 'ES', 'Descr', 'Descr', '2024-09-18 01:33:39', '2024-09-18 01:33:39'),
('9d097fa8-2714-4e38-aea4-b75796f32f3c', 'US', 'Descri', 'Descri', '2024-09-18 01:33:39', '2024-09-18 01:33:39'),
('9d097fa8-2c97-47e6-83d3-09a1fd3f3627', 'ES', 'Descri', 'Descri', '2024-09-18 01:33:39', '2024-09-18 01:33:39'),
('9d097fa8-bbf8-446e-896f-723ad0d4729c', 'US', 'Descrip', 'Descrip', '2024-09-18 01:33:40', '2024-09-18 01:33:40'),
('9d097fa8-c1b1-4006-94b8-858e397f2274', 'ES', 'Descrip', 'Descrip', '2024-09-18 01:33:40', '2024-09-18 01:33:40'),
('9d097fa8-f83d-4213-b80c-127f8bba8d43', 'US', 'Descript', 'Descript', '2024-09-18 01:33:40', '2024-09-18 01:33:40'),
('9d097fa8-fda3-4c16-b4fc-5b689987a997', 'ES', 'Descript', 'Descript', '2024-09-18 01:33:40', '2024-09-18 01:33:40'),
('9d097fa9-6e93-487a-b0e5-c85c0067cebc', 'US', 'Descripto', 'Descripto', '2024-09-18 01:33:40', '2024-09-18 01:33:40'),
('9d097fa9-73f5-44ee-ae08-2868d92933df', 'ES', 'Descripto', 'Descripto', '2024-09-18 01:33:40', '2024-09-18 01:33:40'),
('9d097fa9-eb11-44d7-b354-c0bf92f1c828', 'US', 'Descripti', 'Descripti', '2024-09-18 01:33:41', '2024-09-18 01:33:41'),
('9d097fa9-ef5c-407f-b17f-ebcd8c3e3967', 'ES', 'Descripti', 'Descripti', '2024-09-18 01:33:41', '2024-09-18 01:33:41'),
('9d097fa9-f329-4c8a-a164-c188a3270689', 'US', 'Descriptio', 'Descriptio', '2024-09-18 01:33:41', '2024-09-18 01:33:41'),
('9d097fa9-f659-4530-87ee-f86efd809538', 'ES', 'Descriptio', 'Descriptio', '2024-09-18 01:33:41', '2024-09-18 01:33:41'),
('9d097fe4-f2e1-479d-ba59-db564d989c49', 'US', 'Edit amenity', 'Edit amenity', '2024-09-18 01:34:19', '2024-09-18 01:34:19'),
('9d097fe4-f7e2-4b5f-bd9b-601f2ce3d4b4', 'ES', 'Edit amenity', 'Edit amenity', '2024-09-18 01:34:19', '2024-09-18 01:34:19'),
('9d097fe5-57e4-4cd7-9ee7-5fbc41f8ab18', 'US', 'Update', 'Update', '2024-09-18 01:34:20', '2024-09-18 01:34:20'),
('9d097fe5-5b9e-48c9-b64e-5217a823d822', 'ES', 'Update', 'Update', '2024-09-18 01:34:20', '2024-09-18 01:34:20'),
('9d0980a4-db0a-4769-a30b-26ce38c23859', 'US', 'Amenity saved successfully', 'Amenity saved successfully', '2024-09-18 01:36:25', '2024-09-18 01:36:25'),
('9d0980a4-e10e-4b4c-bcb1-9b0b2b03e831', 'ES', 'Amenity saved successfully', 'Amenity saved successfully', '2024-09-18 01:36:25', '2024-09-18 01:36:25'),
('9d0981e1-9060-4309-be04-dec704fcc4c7', 'US', 'Neighborhoods', 'Neighborhoods', '2024-09-18 01:39:53', '2024-09-18 01:39:53'),
('9d0981e1-953f-4839-ad91-9a1686cbe3ab', 'ES', 'Neighborhoods', 'Neighborhoods', '2024-09-18 01:39:53', '2024-09-18 01:39:53'),
('9d0981e1-9af1-4359-b42a-96ffa53a2089', 'US', 'Create neighborhood', 'Create neighborhood', '2024-09-18 01:39:53', '2024-09-18 01:39:53'),
('9d0981e1-9e9f-4946-8448-2e4a350ed649', 'ES', 'Create neighborhood', 'Create neighborhood', '2024-09-18 01:39:53', '2024-09-18 01:39:53'),
('9d0982ef-74ac-4aa8-b6b5-54000a995268', 'US', 'Created At', 'Created At', '2024-09-18 01:42:49', '2024-09-18 01:42:49'),
('9d0982ef-7936-41c8-9d8f-fbac6df3e819', 'ES', 'Created At', 'Created At', '2024-09-18 01:42:49', '2024-09-18 01:42:49'),
('9d0982ef-e5ee-4bb1-a9c1-620b5467838a', 'US', 'Updated At', 'Updated At', '2024-09-18 01:42:50', '2024-09-18 01:42:50'),
('9d0982ef-ed2b-4226-af91-7a974cba1674', 'ES', 'Updated At', 'Updated At', '2024-09-18 01:42:50', '2024-09-18 01:42:50'),
('9d0988c3-7181-4223-b966-8cef8c4f1efe', 'US', 'click here', 'click here', '2024-09-18 01:59:07', '2024-09-18 01:59:07'),
('9d0988c3-7183-4712-8309-2f2ecf884c7d', 'US', 'Drop files here or', 'Drop files here or', '2024-09-18 01:59:07', '2024-09-18 01:59:07'),
('9d0988c3-7909-461f-a88d-e3ecb7808784', 'ES', 'Drop files here or', 'Drop files here or', '2024-09-18 01:59:07', '2024-09-18 01:59:07'),
('9d0988c3-7948-4b2d-9dc1-472dbc90c9ba', 'ES', 'click here', 'click here', '2024-09-18 01:59:07', '2024-09-18 01:59:07'),
('9d0988c3-ec18-4d2b-86fb-7821eef025bd', 'US', 'to upload.', 'to upload.', '2024-09-18 01:59:08', '2024-09-18 01:59:08'),
('9d0988c3-f0b2-46dc-917c-ebb2ca79d4f1', 'ES', 'to upload.', 'to upload.', '2024-09-18 01:59:08', '2024-09-18 01:59:08'),
('9d0989ce-6b95-48aa-835c-dd28fae1d820', 'US', 'Upload Images/', 'Upload Images/', '2024-09-18 02:02:02', '2024-09-18 02:02:02'),
('9d0989ce-7015-49a5-b686-7600dd054110', 'ES', 'Upload Images/', 'Upload Images/', '2024-09-18 02:02:02', '2024-09-18 02:02:02'),
('9d0989ce-8b7b-4f37-bc01-eb39520357dd', 'US', 'Upload Images', 'Upload Images', '2024-09-18 02:02:02', '2024-09-18 02:02:02'),
('9d0989ce-8f87-4992-a084-5c9ee859882a', 'ES', 'Upload Images', 'Upload Images', '2024-09-18 02:02:02', '2024-09-18 02:02:02'),
('9d0989ce-df45-44f0-b749-56bc75766929', 'US', 'Upload Image', 'Upload Image', '2024-09-18 02:02:03', '2024-09-18 02:02:03'),
('9d0989ce-e4a7-485b-8337-2bab431d7745', 'ES', 'Upload Image', 'Upload Image', '2024-09-18 02:02:03', '2024-09-18 02:02:03'),
('9d098b0f-686f-4aa1-8fb2-e20b33b36075', 'US', 'Search by user', 'Search by user', '2024-09-18 02:05:33', '2024-09-18 02:05:33'),
('9d098b0f-6e02-441e-bf36-96bfee07035f', 'ES', 'Search by user', 'Search by user', '2024-09-18 02:05:33', '2024-09-18 02:05:33'),
('9d098b1d-c6c9-4a9f-b03e-874037622843', 'US', 'amenity', 'amenity', '2024-09-18 02:05:42', '2024-09-18 02:05:42'),
('9d098b1d-cc91-4f33-b4b5-9e45ab525608', 'ES', 'amenity', 'amenity', '2024-09-18 02:05:42', '2024-09-18 02:05:42'),
('9d098b20-1202-4082-9d9c-146982c47d67', 'US', 'menity', 'menity', '2024-09-18 02:05:44', '2024-09-18 02:05:44'),
('9d098b20-181a-484d-a0b0-948ab50dcf5f', 'ES', 'menity', 'menity', '2024-09-18 02:05:44', '2024-09-18 02:05:44'),
('9d098b20-93f2-45a8-9cea-ece0dfd4bb73', 'US', 'Amenity', 'Amenity', '2024-09-18 02:05:44', '2024-09-18 02:05:44'),
('9d098b20-98b5-4f6f-a2b9-40ad283432f2', 'ES', 'Amenity', 'Amenity', '2024-09-18 02:05:44', '2024-09-18 02:05:44'),
('9d098b24-692a-4768-afbb-6aab973d7cc7', 'US', 'Search by amenity', 'Search by amenity', '2024-09-18 02:05:46', '2024-09-18 02:05:46'),
('9d098b24-6d18-4f63-8dd3-6d8f9e6c5230', 'ES', 'Search by amenity', 'Search by amenity', '2024-09-18 02:05:46', '2024-09-18 02:05:46'),
('9d098d4f-f028-4b8b-9e69-348c88d4db02', 'US', 'Neighborhood saved successfully', 'Neighborhood saved successfully', '2024-09-18 02:11:50', '2024-09-18 02:11:50'),
('9d098d4f-f4cb-4504-90d7-26008489b451', 'ES', 'Neighborhood saved successfully', 'Neighborhood saved successfully', '2024-09-18 02:11:50', '2024-09-18 02:11:50'),
('9d098e50-afad-4e8b-9883-7f3b3dd31bb5', 'US', 'Edit neighborhood', 'Edit neighborhood', '2024-09-18 02:14:39', '2024-09-18 02:14:39'),
('9d098e50-b4c4-46c3-a895-eff1febc3225', 'ES', 'Edit neighborhood', 'Edit neighborhood', '2024-09-18 02:14:39', '2024-09-18 02:14:39'),
('9d099821-d946-476e-8b1a-9026d4b4641e', 'US', 'Region saved successfully', 'Region saved successfully', '2024-09-18 02:42:06', '2024-09-18 02:42:06'),
('9d099821-e22c-4398-9cef-21f6bc040216', 'ES', 'Region saved successfully', 'Region saved successfully', '2024-09-18 02:42:06', '2024-09-18 02:42:06'),
('9d099830-937e-4009-a1ee-e2d66699e55b', 'US', 'Edit region', 'Edit region', '2024-09-18 02:42:15', '2024-09-18 02:42:15'),
('9d099830-98bf-4f1f-ae82-51a06651f648', 'ES', 'Edit region', 'Edit region', '2024-09-18 02:42:15', '2024-09-18 02:42:15'),
('9d0998e5-6db9-4ed7-a7b6-15d27d63800c', 'US', 'Region deleted successfully.', 'Region deleted successfully.', '2024-09-18 02:44:14', '2024-09-18 02:44:14'),
('9d0998e5-7278-442d-8f2a-ad3971ff5604', 'ES', 'Region deleted successfully.', 'Region deleted successfully.', '2024-09-18 02:44:14', '2024-09-18 02:44:14'),
('9d09a863-e245-4eb9-b61d-f98a0231bcfc', 'US', 'Edit school', 'Edit school', '2024-09-18 03:27:33', '2024-09-18 03:27:33'),
('9d09a863-e8a6-44eb-8ed2-a026cfa8ab96', 'ES', 'Edit school', 'Edit school', '2024-09-18 03:27:33', '2024-09-18 03:27:33'),
('9d09a8db-06c1-4c6e-9c99-016909acc8c0', 'US', 'School saved successfully', 'School saved successfully', '2024-09-18 03:28:51', '2024-09-18 03:28:51'),
('9d09a8db-0e17-4ada-b64b-cfbb881bcc7d', 'ES', 'School saved successfully', 'School saved successfully', '2024-09-18 03:28:51', '2024-09-18 03:28:51'),
('9d09aa07-6ee4-4479-bb46-3e6118707996', 'US', 'School deleted successfully.', 'School deleted successfully.', '2024-09-18 03:32:08', '2024-09-18 03:32:08'),
('9d09aa07-765a-47ec-9c2f-46ee0200c5bf', 'ES', 'School deleted successfully.', 'School deleted successfully.', '2024-09-18 03:32:08', '2024-09-18 03:32:08'),
('9d09aaba-fb21-4854-b5c1-2c1dcff7ff2a', 'US', 'HOAs', 'HOAs', '2024-09-18 03:34:06', '2024-09-18 03:34:06'),
('9d09aabb-024d-43b7-a015-18df1f76f204', 'ES', 'HOAs', 'HOAs', '2024-09-18 03:34:06', '2024-09-18 03:34:06'),
('9d09aabb-1de1-4505-a7d2-42eb435925c8', 'US', 'Create HOA', 'Create HOA', '2024-09-18 03:34:06', '2024-09-18 03:34:06'),
('9d09aabb-2308-474e-b5aa-622626056341', 'ES', 'Create HOA', 'Create HOA', '2024-09-18 03:34:06', '2024-09-18 03:34:06'),
('9d09aabb-868f-4799-a96c-7e1844c72b4b', 'US', 'Fee', 'Fee', '2024-09-18 03:34:06', '2024-09-18 03:34:06'),
('9d09aabb-8a8e-4949-bfc6-8e6e1dac15a7', 'ES', 'Fee', 'Fee', '2024-09-18 03:34:06', '2024-09-18 03:34:06'),
('9d09aabb-e7c3-4331-bfd2-2087d9d3ff82', 'US', 'Master Plan', 'Master Plan', '2024-09-18 03:34:07', '2024-09-18 03:34:07'),
('9d09aabb-ebbe-4abc-8a02-ab775c7c9336', 'ES', 'Master Plan', 'Master Plan', '2024-09-18 03:34:07', '2024-09-18 03:34:07'),
('9d09aabb-ee0e-4c01-84c2-bdab49ea928a', 'US', 'Frequency', 'Frequency', '2024-09-18 03:34:07', '2024-09-18 03:34:07'),
('9d09aabb-f16c-423e-b6b1-334fbcd9e613', 'ES', 'Frequency', 'Frequency', '2024-09-18 03:34:07', '2024-09-18 03:34:07'),
('9d09ae58-e674-4cb9-bc3e-7555e79a4e60', 'US', 'M', 'M', '2024-09-18 03:44:13', '2024-09-18 03:44:13'),
('9d09ae58-ed2f-4875-9184-545c32271d7e', 'ES', 'M', 'M', '2024-09-18 03:44:13', '2024-09-18 03:44:13'),
('9d09ae59-392f-4426-ad9d-07d99e2048dc', 'US', 'Ma', 'Ma', '2024-09-18 03:44:13', '2024-09-18 03:44:13'),
('9d09ae59-4239-4b54-98fb-ead55cd44e98', 'ES', 'Ma', 'Ma', '2024-09-18 03:44:13', '2024-09-18 03:44:13'),
('9d09ae59-af59-4430-a2b1-281bfefe3608', 'US', 'Mas', 'Mas', '2024-09-18 03:44:13', '2024-09-18 03:44:13'),
('9d09ae59-b2a6-4a7d-848a-a2b74f60f8d2', 'ES', 'Mas', 'Mas', '2024-09-18 03:44:13', '2024-09-18 03:44:13'),
('9d09ae59-e31e-4060-aeef-981ba483a756', 'US', 'Mast', 'Mast', '2024-09-18 03:44:13', '2024-09-18 03:44:13'),
('9d09ae59-e5aa-4451-9729-68ac7041e3a2', 'ES', 'Mast', 'Mast', '2024-09-18 03:44:13', '2024-09-18 03:44:13'),
('9d09ae5a-3bb8-4335-b775-c76585a489b8', 'US', 'Maste', 'Maste', '2024-09-18 03:44:14', '2024-09-18 03:44:14'),
('9d09ae5a-4208-4677-859a-bbd2c3b74616', 'ES', 'Maste', 'Maste', '2024-09-18 03:44:14', '2024-09-18 03:44:14'),
('9d09ae5a-7164-4ede-ad11-dd758ee0e190', 'US', 'Master', 'Master', '2024-09-18 03:44:14', '2024-09-18 03:44:14'),
('9d09ae5a-75a5-4015-bdaf-522b5477301f', 'ES', 'Master', 'Master', '2024-09-18 03:44:14', '2024-09-18 03:44:14'),
('9d09ae5b-276f-417d-bc9b-cb0d757fcfcb', 'US', 'Master l', 'Master l', '2024-09-18 03:44:14', '2024-09-18 03:44:14'),
('9d09ae5b-2c1d-4e2a-bd32-fae707628068', 'ES', 'Master l', 'Master l', '2024-09-18 03:44:14', '2024-09-18 03:44:14'),
('9d09ae5c-303e-4e30-b528-dd4ae130fb0d', 'US', 'Master p', 'Master p', '2024-09-18 03:44:15', '2024-09-18 03:44:15'),
('9d09ae5c-350c-498b-a79e-8ecde896f747', 'ES', 'Master p', 'Master p', '2024-09-18 03:44:15', '2024-09-18 03:44:15'),
('9d09ae5c-ac06-463a-9f8a-08c0327181d7', 'US', 'Master pl', 'Master pl', '2024-09-18 03:44:15', '2024-09-18 03:44:15'),
('9d09ae5c-b29e-4ce3-8021-c79a9cca24bb', 'ES', 'Master pl', 'Master pl', '2024-09-18 03:44:15', '2024-09-18 03:44:15'),
('9d09ae5d-015e-4d5e-9368-0bc160ef2940', 'US', 'Master pla', 'Master pla', '2024-09-18 03:44:15', '2024-09-18 03:44:15'),
('9d09ae5d-06c3-4559-a26f-7dc791f2cc8e', 'ES', 'Master pla', 'Master pla', '2024-09-18 03:44:15', '2024-09-18 03:44:15'),
('9d09ae5d-646d-4761-8ab6-0fee0fc09851', 'US', 'Master plan', 'Master plan', '2024-09-18 03:44:16', '2024-09-18 03:44:16'),
('9d09ae5d-6748-4f5f-8ff1-f758954538e2', 'ES', 'Master plan', 'Master plan', '2024-09-18 03:44:16', '2024-09-18 03:44:16'),
('9d09ae66-79d6-471f-b19f-48355da2ba31', 'US', 'sub_association', 'sub_association', '2024-09-18 03:44:22', '2024-09-18 03:44:22'),
('9d09ae66-7e8a-47fd-9885-1f9b7e4b803b', 'ES', 'sub_association', 'sub_association', '2024-09-18 03:44:22', '2024-09-18 03:44:22'),
('9d09ae69-5edd-4b64-92c5-a5fe193490b0', 'US', 'ub_association', 'ub_association', '2024-09-18 03:44:24', '2024-09-18 03:44:24'),
('9d09ae69-63a0-4430-9833-c243768e9168', 'ES', 'ub_association', 'ub_association', '2024-09-18 03:44:24', '2024-09-18 03:44:24'),
('9d09ae69-edbb-4fe2-98d5-09f2db8aa82e', 'US', 'Sub_association', 'Sub_association', '2024-09-18 03:44:24', '2024-09-18 03:44:24'),
('9d09ae69-f190-43c1-8ee0-7c6e3af93c30', 'ES', 'Sub_association', 'Sub_association', '2024-09-18 03:44:24', '2024-09-18 03:44:24'),
('9d09ae6c-7094-4616-b03f-25ee6eb80c27', 'US', 'Sub association', 'Sub association', '2024-09-18 03:44:26', '2024-09-18 03:44:26'),
('9d09ae6c-74e3-4a15-914b-c68add0383fa', 'ES', 'Sub association', 'Sub association', '2024-09-18 03:44:26', '2024-09-18 03:44:26'),
('9d09b3e6-25f6-4909-b402-e7145c299f57', 'US', 'Hoa saved successfully', 'Hoa saved successfully', '2024-09-18 03:59:44', '2024-09-18 03:59:44'),
('9d09b3e6-34af-4930-8514-d1d299d81f04', 'ES', 'Hoa saved successfully', 'Hoa saved successfully', '2024-09-18 03:59:44', '2024-09-18 03:59:44'),
('9d09c729-96fe-4c12-8f08-9d1ed87768d1', 'US', 'F', 'F', '2024-09-18 04:53:36', '2024-09-18 04:53:36'),
('9d09c729-9dce-4fe3-b3cd-c45bb93ead9f', 'ES', 'F', 'F', '2024-09-18 04:53:36', '2024-09-18 04:53:36'),
('9d09c72a-4c61-4646-91b8-84270ccd4f61', 'US', 'Fe', 'Fe', '2024-09-18 04:53:37', '2024-09-18 04:53:37'),
('9d09c72a-4f82-4c23-9723-ab551592f6d1', 'ES', 'Fe', 'Fe', '2024-09-18 04:53:37', '2024-09-18 04:53:37'),
('9d09c731-7227-4280-87f7-f905e54b00e7', 'US', 'frequency', 'frequency', '2024-09-18 04:53:41', '2024-09-18 04:53:41'),
('9d09c731-76ed-4ec1-9a53-a0ec3cae8c40', 'ES', 'frequency', 'frequency', '2024-09-18 04:53:41', '2024-09-18 04:53:41'),
('9d09c733-57c3-4e7b-bf89-ff1270064be3', 'US', 'requency', 'requency', '2024-09-18 04:53:42', '2024-09-18 04:53:42'),
('9d09c733-5b0d-4376-bd13-10257b826222', 'ES', 'requency', 'requency', '2024-09-18 04:53:42', '2024-09-18 04:53:42'),
('9d09c754-bc20-462c-a3c7-139d3707d1fb', 'US', 'master_plan', 'master_plan', '2024-09-18 04:54:04', '2024-09-18 04:54:04'),
('9d09c754-be87-4126-a520-250c1c237c31', 'ES', 'master_plan', 'master_plan', '2024-09-18 04:54:04', '2024-09-18 04:54:04'),
('9d09c756-c9d8-40e3-a774-cd677feae1fc', 'US', 'master plan', 'master plan', '2024-09-18 04:54:06', '2024-09-18 04:54:06'),
('9d09c756-cc71-4c10-9335-94bde5d40701', 'ES', 'master plan', 'master plan', '2024-09-18 04:54:06', '2024-09-18 04:54:06'),
('9d09c759-24fb-4e67-bd16-a9fbe4a2970c', 'US', 'aster plan', 'aster plan', '2024-09-18 04:54:07', '2024-09-18 04:54:07'),
('9d09c759-27e1-4cfe-89f1-30a4ce651c0c', 'ES', 'aster plan', 'aster plan', '2024-09-18 04:54:07', '2024-09-18 04:54:07'),
('9d09c761-e55d-42a4-849c-cc7735b84aa1', 'US', 'Sub ssociation', 'Sub ssociation', '2024-09-18 04:54:13', '2024-09-18 04:54:13'),
('9d09c761-e7dc-4d76-b6bb-cb13bf28dd1d', 'ES', 'Sub ssociation', 'Sub ssociation', '2024-09-18 04:54:13', '2024-09-18 04:54:13'),
('9d09c763-179c-4ad5-b1d2-a378af753e20', 'US', 'Sub sssociation', 'Sub sssociation', '2024-09-18 04:54:14', '2024-09-18 04:54:14'),
('9d09c763-1ee1-448c-801b-93f8c339f361', 'ES', 'Sub sssociation', 'Sub sssociation', '2024-09-18 04:54:14', '2024-09-18 04:54:14'),
('9d09c809-3825-46d5-9a82-d0763059983c', 'US', 'Edit HOA', 'Edit HOA', '2024-09-18 04:56:03', '2024-09-18 04:56:03'),
('9d09c809-3e25-411e-b9cc-706cf8e38853', 'ES', 'Edit HOA', 'Edit HOA', '2024-09-18 04:56:03', '2024-09-18 04:56:03'),
('9d09c95f-d8ab-41e9-8455-4fc3a39f338f', 'US', 'Community deleted successfully.', 'Community deleted successfully.', '2024-09-18 04:59:47', '2024-09-18 04:59:47'),
('9d09c95f-dbb8-4b5d-b956-92d0351055d0', 'ES', 'Community deleted successfully.', 'Community deleted successfully.', '2024-09-18 04:59:47', '2024-09-18 04:59:47'),
('9d09d0a5-8c86-45ce-8c8f-528c178d8a39', 'US', 'Search by H', 'Search by H', '2024-09-18 05:20:07', '2024-09-18 05:20:07'),
('9d09d0a5-943a-4c3d-86c5-bc7a490b7194', 'ES', 'Search by H', 'Search by H', '2024-09-18 05:20:07', '2024-09-18 05:20:07'),
('9d09d0a5-aa64-462e-b8f9-494fb9dcbc00', 'US', 'Search by HO', 'Search by HO', '2024-09-18 05:20:07', '2024-09-18 05:20:07'),
('9d09d0a5-ae99-4b09-9b3c-8f383c36340e', 'ES', 'Search by HO', 'Search by HO', '2024-09-18 05:20:07', '2024-09-18 05:20:07'),
('9d09d0a5-fc45-495e-b704-683333f261c0', 'US', 'Search by HOA', 'Search by HOA', '2024-09-18 05:20:08', '2024-09-18 05:20:08'),
('9d09d0a5-ff44-4528-9456-ab2aa444fe3e', 'ES', 'Search by HOA', 'Search by HOA', '2024-09-18 05:20:08', '2024-09-18 05:20:08'),
('9d09d818-dc60-44b6-9742-4966ae6aa5d8', 'US', 'Search by neighborhood', 'Search by neighborhood', '2024-09-18 05:40:57', '2024-09-18 05:40:57'),
('9d09d818-e1b0-4614-bf8a-78b0b0673e92', 'ES', 'Search by neighborhood', 'Search by neighborhood', '2024-09-18 05:40:57', '2024-09-18 05:40:57'),
('9d09d842-1a0d-4f99-a9d4-6f02535e4fd5', 'US', 'Search by re', 'Search by re', '2024-09-18 05:41:24', '2024-09-18 05:41:24'),
('9d09d842-1e25-4872-b4c3-da4bba25c445', 'ES', 'Search by re', 'Search by re', '2024-09-18 05:41:24', '2024-09-18 05:41:24'),
('9d09d842-ce56-4b38-b7b9-5f929352a3c8', 'US', 'Search by reg', 'Search by reg', '2024-09-18 05:41:25', '2024-09-18 05:41:25'),
('9d09d842-d387-4ba4-b53e-0715d6c53c12', 'ES', 'Search by reg', 'Search by reg', '2024-09-18 05:41:25', '2024-09-18 05:41:25'),
('9d09d843-968b-4c50-bc24-4587718d42c3', 'US', 'Search by regi', 'Search by regi', '2024-09-18 05:41:25', '2024-09-18 05:41:25');
INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
('9d09d843-9913-4a6a-b8b6-730a2703bc4a', 'ES', 'Search by regi', 'Search by regi', '2024-09-18 05:41:25', '2024-09-18 05:41:25'),
('9d09d843-f245-4de3-b031-7d9b9af763ac', 'US', 'Search by regio', 'Search by regio', '2024-09-18 05:41:25', '2024-09-18 05:41:25'),
('9d09d843-f4bd-44ae-87be-2dba88588d82', 'ES', 'Search by regio', 'Search by regio', '2024-09-18 05:41:25', '2024-09-18 05:41:25'),
('9d09d844-4eb2-4958-bed2-4d48d69d9788', 'US', 'Search by region', 'Search by region', '2024-09-18 05:41:26', '2024-09-18 05:41:26'),
('9d09d844-587d-4a4e-93fc-7de678753407', 'ES', 'Search by region', 'Search by region', '2024-09-18 05:41:26', '2024-09-18 05:41:26'),
('9d09d8ae-03e1-4e68-ae48-298a7e7d1900', 'US', 'Las Vegas Region', 'Las Vegas Region', '2024-09-18 05:42:35', '2024-09-18 05:42:35'),
('9d09d8ae-07cf-49a8-8b86-710088000b0b', 'ES', 'Las Vegas Region', 'Las Vegas Region', '2024-09-18 05:42:35', '2024-09-18 05:42:35'),
('9d09d8b0-cf2c-4f6e-acd4-b6fb586aada8', 'US', 'Las Vegas Regions', 'Las Vegas Regions', '2024-09-18 05:42:37', '2024-09-18 05:42:37'),
('9d09d8b0-d648-4987-b0dc-7157cf3117c2', 'ES', 'Las Vegas Regions', 'Las Vegas Regions', '2024-09-18 05:42:37', '2024-09-18 05:42:37'),
('9d09e0d1-23de-4ce3-bdc1-6e7097393dbc', 'US', 'Remove file', 'Remove file', '2024-09-18 06:05:20', '2024-09-18 06:05:20'),
('9d09e0d1-23e2-4ec2-a3b1-d3e0b4a2c92a', 'US', 'Remove file', 'Remove file', '2024-09-18 06:05:20', '2024-09-18 06:05:20'),
('9d09e0d1-343d-448c-af5b-be7dac2ffe45', 'ES', 'Remove file', 'Remove file', '2024-09-18 06:05:20', '2024-09-18 06:05:20'),
('9d09e0d1-3451-4ece-9948-2340fa242dcd', 'ES', 'Remove file', 'Remove file', '2024-09-18 06:05:20', '2024-09-18 06:05:20'),
('9d09e796-0bbd-4eef-83c2-bfb0f7e0ce4c', 'US', 'Website name section', 'Website name section', '2024-09-18 06:24:16', '2024-09-18 06:24:16'),
('9d09e796-11c8-4049-8398-c23befd117c0', 'ES', 'Website name section', 'Website name section', '2024-09-18 06:24:16', '2024-09-18 06:24:16'),
('9d09e796-6713-46b1-840e-c2dfb11d3656', 'US', 'Youtube', 'Youtube', '2024-09-18 06:24:16', '2024-09-18 06:24:16'),
('9d09e796-6a0f-444b-82f4-834cc4056b63', 'ES', 'Youtube', 'Youtube', '2024-09-18 06:24:16', '2024-09-18 06:24:16'),
('9d09e796-6b1e-40b0-b15c-5954119cd773', 'US', 'Instagram', 'Instagram', '2024-09-18 06:24:16', '2024-09-18 06:24:16'),
('9d09e796-6ea7-4761-aeb5-5adb46fab4ee', 'ES', 'Instagram', 'Instagram', '2024-09-18 06:24:16', '2024-09-18 06:24:16'),
('9d09e796-c579-4e0d-841b-0e8da4c46dd7', 'US', 'Website phone', 'Website phone', '2024-09-18 06:24:16', '2024-09-18 06:24:16'),
('9d09e796-c57e-4bcf-ae17-cd5cfb611f60', 'US', 'Facebook', 'Facebook', '2024-09-18 06:24:16', '2024-09-18 06:24:16'),
('9d09e796-c7bc-4405-a824-a31b0ccc59b2', 'ES', 'Website phone', 'Website phone', '2024-09-18 06:24:16', '2024-09-18 06:24:16'),
('9d09e796-c7f0-4b5a-9ed3-2aff3b67ad64', 'ES', 'Facebook', 'Facebook', '2024-09-18 06:24:16', '2024-09-18 06:24:16'),
('9d09e797-0f28-4632-a610-6b3f3e7588b2', 'US', 'Website address', 'Website address', '2024-09-18 06:24:17', '2024-09-18 06:24:17'),
('9d09e797-117f-4006-a77f-e9c8a2c6450f', 'ES', 'Website address', 'Website address', '2024-09-18 06:24:17', '2024-09-18 06:24:17'),
('9d09e797-62c1-4360-86ef-98476868a6ea', 'US', 'Logo Section', 'Logo Section', '2024-09-18 06:24:17', '2024-09-18 06:24:17'),
('9d09e797-6853-45c9-bb11-0126b3c98ba6', 'ES', 'Logo Section', 'Logo Section', '2024-09-18 06:24:17', '2024-09-18 06:24:17'),
('9d09e797-ca07-42e2-9d35-f918155617a5', 'US', 'Carousel Section', 'Carousel Section', '2024-09-18 06:24:17', '2024-09-18 06:24:17'),
('9d09e797-cc6c-439d-a0cc-7764baa80a26', 'ES', 'Carousel Section', 'Carousel Section', '2024-09-18 06:24:17', '2024-09-18 06:24:17'),
('9d09e797-d5d7-4d47-bbd8-9e31512d4335', 'US', 'Uplaod video file', 'Uplaod video file', '2024-09-18 06:24:17', '2024-09-18 06:24:17'),
('9d09e797-d812-4f16-afbc-39ce88d4ab08', 'ES', 'Uplaod video file', 'Uplaod video file', '2024-09-18 06:24:17', '2024-09-18 06:24:17'),
('9d09e798-1d3d-4dd6-a06e-594ab3ae863a', 'US', 'The recommended resolutions for video are 1080p and 720p.', 'The recommended resolutions for video are 1080p and 720p.', '2024-09-18 06:24:17', '2024-09-18 06:24:17'),
('9d09e798-1f9b-4858-a676-71c8c6ce77ae', 'ES', 'The recommended resolutions for video are 1080p and 720p.', 'The recommended resolutions for video are 1080p and 720p.', '2024-09-18 06:24:17', '2024-09-18 06:24:17'),
('9d09e798-3031-4576-87b8-412820de4999', 'US', 'Open', 'Open', '2024-09-18 06:24:17', '2024-09-18 06:24:17'),
('9d09e798-3286-4b9d-abc6-a5d2e0fbd11c', 'ES', 'Open', 'Open', '2024-09-18 06:24:17', '2024-09-18 06:24:17'),
('9d09e798-7b83-4804-a718-26b412f59394', 'US', 'Modal opener', 'Modal opener', '2024-09-18 06:24:17', '2024-09-18 06:24:17'),
('9d09e798-7ef2-4c68-a0a4-bad0a0ca86ec', 'ES', 'Modal opener', 'Modal opener', '2024-09-18 06:24:17', '2024-09-18 06:24:17'),
('9d09e798-8e8f-4fed-82ac-fe4a919e27d6', 'US', 'Upload and crop the image', 'Upload and crop the image', '2024-09-18 06:24:18', '2024-09-18 06:24:18'),
('9d09e798-929f-4412-995f-7afcbb6584ea', 'ES', 'Upload and crop the image', 'Upload and crop the image', '2024-09-18 06:24:18', '2024-09-18 06:24:18'),
('9d09e798-dada-423b-87e9-696c54c0969c', 'US', 'Preview', 'Preview', '2024-09-18 06:24:18', '2024-09-18 06:24:18'),
('9d09e798-dd25-49c6-86c9-180035b7056c', 'ES', 'Preview', 'Preview', '2024-09-18 06:24:18', '2024-09-18 06:24:18'),
('9d09e798-f2f8-40a9-a0db-4f410d9838eb', 'US', 'Zoom In', 'Zoom In', '2024-09-18 06:24:18', '2024-09-18 06:24:18'),
('9d09e798-f507-49c5-b82d-955de0314738', 'ES', 'Zoom In', 'Zoom In', '2024-09-18 06:24:18', '2024-09-18 06:24:18'),
('9d09e799-4eab-4642-9609-f39518e0d607', 'US', 'Zoom Out', 'Zoom Out', '2024-09-18 06:24:18', '2024-09-18 06:24:18'),
('9d09e799-51eb-46c2-98e5-9df9db5c21ea', 'ES', 'Zoom Out', 'Zoom Out', '2024-09-18 06:24:18', '2024-09-18 06:24:18'),
('9d09e799-5e4a-4e51-9e56-65d9954825cc', 'US', 'Move Left', 'Move Left', '2024-09-18 06:24:18', '2024-09-18 06:24:18'),
('9d09e799-6166-4f6d-8f1f-261c18214562', 'ES', 'Move Left', 'Move Left', '2024-09-18 06:24:18', '2024-09-18 06:24:18'),
('9d09e799-c59f-48bf-afcc-f01ac9dfecf6', 'US', 'Move Right', 'Move Right', '2024-09-18 06:24:18', '2024-09-18 06:24:18'),
('9d09e799-c7d8-4e5a-82ba-8e1a51b37a83', 'ES', 'Move Right', 'Move Right', '2024-09-18 06:24:18', '2024-09-18 06:24:18'),
('9d09e799-d173-4c1b-a9ea-1d2d0fa214ad', 'US', 'Move Up', 'Move Up', '2024-09-18 06:24:18', '2024-09-18 06:24:18'),
('9d09e799-d3c7-40ec-8837-d365a0b76d0d', 'ES', 'Move Up', 'Move Up', '2024-09-18 06:24:18', '2024-09-18 06:24:18'),
('9d09e79a-2988-484f-ac4e-aec1c7311ea1', 'US', 'Move Down', 'Move Down', '2024-09-18 06:24:19', '2024-09-18 06:24:19'),
('9d09e79a-2d0d-4764-ab7f-98260a90bb9b', 'ES', 'Move Down', 'Move Down', '2024-09-18 06:24:19', '2024-09-18 06:24:19'),
('9d09e79a-377b-4cc6-8911-b0fe7c0a880a', 'US', 'Rotate -90deg', 'Rotate -90deg', '2024-09-18 06:24:19', '2024-09-18 06:24:19'),
('9d09e79a-3a23-4897-907e-b6bb58dd7f09', 'ES', 'Rotate -90deg', 'Rotate -90deg', '2024-09-18 06:24:19', '2024-09-18 06:24:19'),
('9d09e79a-85c5-4f63-a659-4882e895b852', 'US', 'Flip X', 'Flip X', '2024-09-18 06:24:19', '2024-09-18 06:24:19'),
('9d09e79a-8868-4599-bbbb-4a9b67df92b2', 'ES', 'Flip X', 'Flip X', '2024-09-18 06:24:19', '2024-09-18 06:24:19'),
('9d09e79a-93be-474c-bf62-75eb51c7f679', 'US', 'Flip Y', 'Flip Y', '2024-09-18 06:24:19', '2024-09-18 06:24:19'),
('9d09e79a-9613-42cd-afaf-a4dad480074b', 'ES', 'Flip Y', 'Flip Y', '2024-09-18 06:24:19', '2024-09-18 06:24:19'),
('9d09e79a-df90-4731-99fb-044262c9c260', 'US', 'Reset', 'Reset', '2024-09-18 06:24:19', '2024-09-18 06:24:19'),
('9d09e79a-e31e-4605-9107-f3bfe388abd6', 'ES', 'Reset', 'Reset', '2024-09-18 06:24:19', '2024-09-18 06:24:19'),
('9d09e79a-ec7b-4ae3-96d9-c7629197cc18', 'US', 'Crop', 'Crop', '2024-09-18 06:24:19', '2024-09-18 06:24:19'),
('9d09e79a-efad-4523-b0b6-9cb84d54aa74', 'ES', 'Crop', 'Crop', '2024-09-18 06:24:19', '2024-09-18 06:24:19'),
('9d09e79b-477b-4db3-bb01-c2181f75b340', 'US', 'Global Seo Section', 'Global Seo Section', '2024-09-18 06:24:19', '2024-09-18 06:24:19'),
('9d09e79b-4c82-4520-b6f7-33e741e4efd2', 'ES', 'Global Seo Section', 'Global Seo Section', '2024-09-18 06:24:19', '2024-09-18 06:24:19'),
('9d09e79b-a4dc-4889-988e-45933cdfffcb', 'US', 'Keywords', 'Keywords', '2024-09-18 06:24:20', '2024-09-18 06:24:20'),
('9d09e79b-a936-4ef5-a4a3-0df2d67a9ee5', 'ES', 'Keywords', 'Keywords', '2024-09-18 06:24:20', '2024-09-18 06:24:20'),
('9d0bb064-7fda-4fd2-a73f-7c4dc02e1f57', 'US', 'Edit community', 'Edit community', '2024-09-19 03:41:35', '2024-09-19 03:41:35'),
('9d0bb064-8b9d-40b0-9d5f-3c08b770ca7f', 'ES', 'Edit community', 'Edit community', '2024-09-19 03:41:35', '2024-09-19 03:41:35'),
('9d0bb065-4896-436b-b99a-3cdf3e9d8be7', 'US', 'Upload main image', 'Upload main image', '2024-09-19 03:41:36', '2024-09-19 03:41:36'),
('9d0bb065-5325-4732-bf5e-5d74bfb43180', 'ES', 'Upload main image', 'Upload main image', '2024-09-19 03:41:36', '2024-09-19 03:41:36'),
('9d0bc28a-c455-4960-86bf-1a971f7911ae', 'US', 'Details', 'Details', '2024-09-19 04:32:20', '2024-09-19 04:32:20'),
('9d0bc28a-cd5b-45ab-8485-9c6be73bf9c1', 'ES', 'Details', 'Details', '2024-09-19 04:32:20', '2024-09-19 04:32:20'),
('9d0bc28b-752d-4a95-ac43-f69778943b29', 'US', 'Homes', 'Homes', '2024-09-19 04:32:21', '2024-09-19 04:32:21'),
('9d0bc28b-7c0d-419b-8f65-853f6c67a171', 'ES', 'Homes', 'Homes', '2024-09-19 04:32:21', '2024-09-19 04:32:21'),
('9d0bc4e3-0438-4a78-820a-72fdda3ab39e', 'US', 'communities', 'communities', '2024-09-19 04:38:54', '2024-09-19 04:38:54'),
('9d0bc4e3-0d30-4042-93f0-3a7c510c8ee0', 'ES', 'communities', 'communities', '2024-09-19 04:38:54', '2024-09-19 04:38:54'),
('9d0bc4e5-17b5-4000-b1c2-6983c19069cf', 'US', 'ommunities', 'ommunities', '2024-09-19 04:38:55', '2024-09-19 04:38:55'),
('9d0bc4e5-1dec-4ce9-ad93-ae0cbd44dd72', 'ES', 'ommunities', 'ommunities', '2024-09-19 04:38:55', '2024-09-19 04:38:55'),
('9d1795de-5092-4462-97bc-4c6f1192583b', 'US', 'Payments', 'Payments', '2024-09-25 01:37:22', '2024-09-25 01:37:22'),
('9d1795de-5093-46db-9faa-84606011d0f8', 'US', 'Bookings', 'Bookings', '2024-09-25 01:37:22', '2024-09-25 01:37:22'),
('9d1795df-34bc-45c1-9de8-650d5bff0091', 'ES', 'Payments', 'Payments', '2024-09-25 01:37:22', '2024-09-25 01:37:22'),
('9d1795df-34fd-4216-969d-129283a359b8', 'ES', 'Bookings', 'Bookings', '2024-09-25 01:37:22', '2024-09-25 01:37:22'),
('9d1795df-c65b-4f31-b297-f87859f19894', 'US', 'Why choose', 'Why choose', '2024-09-25 01:37:22', '2024-09-25 01:37:22'),
('9d1795df-cceb-49d6-888e-06ad1f19c79a', 'ES', 'Why choose', 'Why choose', '2024-09-25 01:37:22', '2024-09-25 01:37:22'),
('9d1795df-cd02-4c2f-8b62-c222835176e8', 'US', 'PDF Downloaded Users', 'PDF Downloaded Users', '2024-09-25 01:37:22', '2024-09-25 01:37:22'),
('9d1795df-d28d-420b-a88e-28ca0a835ccb', 'ES', 'PDF Downloaded Users', 'PDF Downloaded Users', '2024-09-25 01:37:22', '2024-09-25 01:37:22'),
('9d1795e0-90d8-4e2d-b4f6-e3f7139a66d8', 'US', 'Pages', 'Pages', '2024-09-25 01:37:23', '2024-09-25 01:37:23'),
('9d1795e0-9382-415c-891e-0e6a86aa8897', 'US', 'Tour booking user email', 'Tour booking user email', '2024-09-25 01:37:23', '2024-09-25 01:37:23'),
('9d1795e0-9847-4f68-93b5-db3daf8886e0', 'ES', 'Pages', 'Pages', '2024-09-25 01:37:23', '2024-09-25 01:37:23'),
('9d1795e0-99cc-4017-ba4a-da0142526bed', 'ES', 'Tour booking user email', 'Tour booking user email', '2024-09-25 01:37:23', '2024-09-25 01:37:23'),
('9d1795e1-5f61-4556-be21-40c9623c0f3b', 'US', 'Tour booking system email', 'Tour booking system email', '2024-09-25 01:37:23', '2024-09-25 01:37:23'),
('9d1795e1-6066-4a15-9098-64f6d1457a6d', 'US', 'Subscription email', 'Subscription email', '2024-09-25 01:37:23', '2024-09-25 01:37:23'),
('9d1795e1-6574-48e6-b567-b5f55bd15f79', 'ES', 'Tour booking system email', 'Tour booking system email', '2024-09-25 01:37:23', '2024-09-25 01:37:23'),
('9d1795e1-665e-4896-b141-3c3575b5eb63', 'ES', 'Subscription email', 'Subscription email', '2024-09-25 01:37:23', '2024-09-25 01:37:23'),
('9d17971b-81f5-4c4a-9d3a-b7171054c2a8', 'US', 'Edit builder', 'Edit builder', '2024-09-25 01:40:49', '2024-09-25 01:40:49'),
('9d17971b-888f-4a86-a6d4-ae1980950f25', 'ES', 'Edit builder', 'Edit builder', '2024-09-25 01:40:49', '2024-09-25 01:40:49'),
('9d17b241-064c-4b90-a773-1b8a8fe6b7ef', 'US', 'Incentives', 'Incentives', '2024-09-25 02:56:44', '2024-09-25 02:56:44'),
('9d17b241-064c-4cfe-a572-d7427726cb4a', 'US', 'Create Incentive', 'Create Incentive', '2024-09-25 02:56:44', '2024-09-25 02:56:44'),
('9d17b242-1024-4a8b-a182-5e72b328167a', 'ES', 'Incentives', 'Incentives', '2024-09-25 02:56:44', '2024-09-25 02:56:44'),
('9d17b242-105f-4226-aace-f50fba185b08', 'ES', 'Create Incentive', 'Create Incentive', '2024-09-25 02:56:44', '2024-09-25 02:56:44'),
('9d17b242-8aab-4cc7-8df0-1c52cb283e59', 'US', 'Search by home', 'Search by home', '2024-09-25 02:56:45', '2024-09-25 02:56:45'),
('9d17b242-8e59-41ad-836c-b3b544e645ea', 'ES', 'Search by home', 'Search by home', '2024-09-25 02:56:45', '2024-09-25 02:56:45'),
('9d17d195-2365-425a-b6fb-9a40e1960716', 'US', 'Create Home', 'Create Home', '2024-09-25 04:24:20', '2024-09-25 04:24:20'),
('9d17d195-2acb-42f3-a7dc-6aa2639cdd03', 'ES', 'Create Home', 'Create Home', '2024-09-25 04:24:20', '2024-09-25 04:24:20'),
('9d17d195-72f2-4f2f-8d61-4c83173b13df', 'US', 'Search by community', 'Search by community', '2024-09-25 04:24:20', '2024-09-25 04:24:20'),
('9d17d195-75ae-4739-8df5-374ef1d8bcfe', 'ES', 'Search by community', 'Search by community', '2024-09-25 04:24:20', '2024-09-25 04:24:20'),
('9d17d195-931e-40e1-87e5-f89080d1bf38', 'US', 'Address', 'Address', '2024-09-25 04:24:20', '2024-09-25 04:24:20'),
('9d17d195-9558-4c70-b2fb-d9d8c94b3c4e', 'ES', 'Address', 'Address', '2024-09-25 04:24:20', '2024-09-25 04:24:20'),
('9d17d93c-bec5-4256-86ce-a4c4eb15ee54', 'US', 'City', 'City', '2024-09-25 04:45:44', '2024-09-25 04:45:44'),
('9d17d93c-c970-4e58-9fbb-9a5a9b423e3e', 'ES', 'City', 'City', '2024-09-25 04:45:44', '2024-09-25 04:45:44'),
('9d17d93d-46e5-4c77-b874-4f2d3a76fc34', 'US', 'State', 'State', '2024-09-25 04:45:44', '2024-09-25 04:45:44'),
('9d17d93d-4cbf-429d-8a33-9bc33c3ff134', 'ES', 'State', 'State', '2024-09-25 04:45:44', '2024-09-25 04:45:44'),
('9d17d93d-536b-4fb6-8e93-5d9a16cd8e56', 'US', 'ZIP Code', 'ZIP Code', '2024-09-25 04:45:44', '2024-09-25 04:45:44'),
('9d17d93d-577c-4be1-ac41-f56f788161f4', 'ES', 'ZIP Code', 'ZIP Code', '2024-09-25 04:45:44', '2024-09-25 04:45:44'),
('9d17d93d-c958-48f8-8648-f1b0eac4fd5d', 'US', 'Square Feet', 'Square Feet', '2024-09-25 04:45:45', '2024-09-25 04:45:45'),
('9d17d93d-ca53-4d37-922a-8d7445d7bf44', 'US', 'Bedrooms', 'Bedrooms', '2024-09-25 04:45:45', '2024-09-25 04:45:45'),
('9d17d93d-cd5d-46c3-87e9-b6bee1e9aebd', 'ES', 'Square Feet', 'Square Feet', '2024-09-25 04:45:45', '2024-09-25 04:45:45'),
('9d17d93d-ce82-413a-8c72-2214ddf6acbd', 'ES', 'Bedrooms', 'Bedrooms', '2024-09-25 04:45:45', '2024-09-25 04:45:45'),
('9d17d93e-2c48-4a46-a259-494b26f3e131', 'US', 'Property Type', 'Property Type', '2024-09-25 04:45:45', '2024-09-25 04:45:45'),
('9d17d93e-2f82-4b3a-a5c8-ed8d49388d9c', 'ES', 'Property Type', 'Property Type', '2024-09-25 04:45:45', '2024-09-25 04:45:45'),
('9d17d93e-3345-48e7-9908-8bf08985884c', 'US', 'Lot Size', 'Lot Size', '2024-09-25 04:45:45', '2024-09-25 04:45:45'),
('9d17d93e-37b9-45ca-83eb-4ba9c62e7ffe', 'ES', 'Lot Size', 'Lot Size', '2024-09-25 04:45:45', '2024-09-25 04:45:45'),
('9d17d93e-938a-4159-86d8-3e5622336f90', 'US', 'Year Built', 'Year Built', '2024-09-25 04:45:45', '2024-09-25 04:45:45'),
('9d17d93e-95bb-4302-a5a1-851ac84d95fb', 'ES', 'Year Built', 'Year Built', '2024-09-25 04:45:45', '2024-09-25 04:45:45'),
('9d17d93e-97fd-4186-8eeb-5eca63eebbf8', 'US', 'Listing Type', 'Listing Type', '2024-09-25 04:45:45', '2024-09-25 04:45:45'),
('9d17d93e-9bbc-48ac-a55f-2ed0f67031e0', 'ES', 'Listing Type', 'Listing Type', '2024-09-25 04:45:45', '2024-09-25 04:45:45'),
('9d17d93e-f635-43fd-814d-d9e30b132210', 'US', 'Select CIC', 'Select CIC', '2024-09-25 04:45:45', '2024-09-25 04:45:45'),
('9d17d93e-f968-46b9-98f8-6ccb37c8a5b5', 'ES', 'Select CIC', 'Select CIC', '2024-09-25 04:45:45', '2024-09-25 04:45:45'),
('9d17d93f-009d-4cd0-b573-00c9f14c6489', 'US', 'Association Fee', 'Association Fee', '2024-09-25 04:45:45', '2024-09-25 04:45:45'),
('9d17d93f-0309-4036-98e0-e29bfcf941b6', 'ES', 'Association Fee', 'Association Fee', '2024-09-25 04:45:45', '2024-09-25 04:45:45'),
('9d17d93f-4bf4-4deb-8db0-dcbe25930c50', 'US', 'No', 'No', '2024-09-25 04:45:46', '2024-09-25 04:45:46'),
('9d17d93f-4e19-4599-90da-d3651cf2109c', 'ES', 'No', 'No', '2024-09-25 04:45:46', '2024-09-25 04:45:46'),
('9d17d93f-5e11-47d3-bdfb-8480c95d8fbc', 'US', 'Yes', 'Yes', '2024-09-25 04:45:46', '2024-09-25 04:45:46'),
('9d17d93f-603c-4943-91de-2ae7e7dfeec3', 'ES', 'Yes', 'Yes', '2024-09-25 04:45:46', '2024-09-25 04:45:46'),
('9d17d93f-a099-411f-af21-7ac0fecc907d', 'US', 'Property Features', 'Property Features', '2024-09-25 04:45:46', '2024-09-25 04:45:46'),
('9d17d93f-a33b-4c8d-bbaa-49884310d38c', 'ES', 'Property Features', 'Property Features', '2024-09-25 04:45:46', '2024-09-25 04:45:46'),
('9d17d93f-b97a-49fa-9fd6-816b6785607f', 'US', 'School ID', 'School ID', '2024-09-25 04:45:46', '2024-09-25 04:45:46'),
('9d17d93f-bc8e-42d3-82f9-466dfa62a3bd', 'ES', 'School ID', 'School ID', '2024-09-25 04:45:46', '2024-09-25 04:45:46'),
('9d17d940-0679-4e51-9537-1a1b544bac1d', 'US', 'Kitchen Pantry Type', 'Kitchen Pantry Type', '2024-09-25 04:45:46', '2024-09-25 04:45:46'),
('9d17d940-0a5a-452e-9d82-e7f6da04c5ae', 'ES', 'Kitchen Pantry Type', 'Kitchen Pantry Type', '2024-09-25 04:45:46', '2024-09-25 04:45:46'),
('9d17d940-1991-4808-880b-495c135b9a3c', 'US', 'Fireplace Type', 'Fireplace Type', '2024-09-25 04:45:46', '2024-09-25 04:45:46'),
('9d17d940-1c2f-4e99-8e3b-47be42680cd3', 'ES', 'Fireplace Type', 'Fireplace Type', '2024-09-25 04:45:46', '2024-09-25 04:45:46'),
('9d17d940-7b09-4219-90eb-241dc026acf6', 'US', 'Select Reach In', 'Select Reach In', '2024-09-25 04:45:46', '2024-09-25 04:45:46'),
('9d17d940-7f54-416f-bd2b-a17771518649', 'ES', 'Select Reach In', 'Select Reach In', '2024-09-25 04:45:46', '2024-09-25 04:45:46'),
('9d17d940-8dad-4920-b24e-1d115f44d92e', 'US', 'Reach In', 'Reach In', '2024-09-25 04:45:46', '2024-09-25 04:45:46'),
('9d17d940-9132-443b-86f2-72fe9392576d', 'ES', 'Reach In', 'Reach In', '2024-09-25 04:45:46', '2024-09-25 04:45:46'),
('9d17d941-d748-4290-880b-20d782db7eb6', 'US', 'Select Walk In', 'Select Walk In', '2024-09-25 04:45:47', '2024-09-25 04:45:47'),
('9d17d941-e08d-462c-b987-59d280469744', 'ES', 'Select Walk In', 'Select Walk In', '2024-09-25 04:45:47', '2024-09-25 04:45:47'),
('9d17d942-036e-4af1-a58d-761c93a28a0f', 'US', 'Walk In', 'Walk In', '2024-09-25 04:45:47', '2024-09-25 04:45:47'),
('9d17d942-08d7-41d2-8d83-428af7b4852e', 'ES', 'Walk In', 'Walk In', '2024-09-25 04:45:47', '2024-09-25 04:45:47'),
('9d17d943-4ec3-48de-8eb3-94ffa973c35d', 'US', 'Laundry Closet', 'Laundry Closet', '2024-09-25 04:45:48', '2024-09-25 04:45:48'),
('9d17d943-5403-4131-a298-e7a002ac012f', 'ES', 'Laundry Closet', 'Laundry Closet', '2024-09-25 04:45:48', '2024-09-25 04:45:48'),
('9d17d944-189e-465a-90f1-e1157f2b77c3', 'US', 'Bedroom Location', 'Bedroom Location', '2024-09-25 04:45:49', '2024-09-25 04:45:49'),
('9d17d944-1de6-4058-a819-7d75473f3998', 'ES', 'Bedroom Location', 'Bedroom Location', '2024-09-25 04:45:49', '2024-09-25 04:45:49'),
('9d17d944-6377-4129-be16-3a81fefb7627', 'US', 'Closet Location', 'Closet Location', '2024-09-25 04:45:49', '2024-09-25 04:45:49'),
('9d17d944-6b07-4686-85d4-9a7e97a252b1', 'ES', 'Closet Location', 'Closet Location', '2024-09-25 04:45:49', '2024-09-25 04:45:49'),
('9d17d945-aa58-4916-8880-889cc06cdcba', 'US', 'Bathroom Status', 'Bathroom Status', '2024-09-25 04:45:50', '2024-09-25 04:45:50'),
('9d17d945-b091-4a95-a4d6-88dd687dbccd', 'ES', 'Bathroom Status', 'Bathroom Status', '2024-09-25 04:45:50', '2024-09-25 04:45:50'),
('9d17d945-c94f-4bba-902a-42077ab901dc', 'US', 'Bathroom Type', 'Bathroom Type', '2024-09-25 04:45:50', '2024-09-25 04:45:50'),
('9d17d945-cf8b-4bc4-8b42-b5f0651bdcf7', 'ES', 'Bathroom Type', 'Bathroom Type', '2024-09-25 04:45:50', '2024-09-25 04:45:50'),
('9d17d949-bd88-435c-8375-420227d1f5c9', 'US', 'Water Features', 'Water Features', '2024-09-25 04:45:52', '2024-09-25 04:45:52'),
('9d17d949-bdb3-4a2d-b3de-5a527850c325', 'US', 'Pool Shape', 'Pool Shape', '2024-09-25 04:45:52', '2024-09-25 04:45:52'),
('9d17d949-c2ea-4636-b770-083156811b24', 'ES', 'Pool Shape', 'Pool Shape', '2024-09-25 04:45:52', '2024-09-25 04:45:52'),
('9d17d949-c321-41dd-bbc5-dd710c9bd95d', 'ES', 'Water Features', 'Water Features', '2024-09-25 04:45:52', '2024-09-25 04:45:52'),
('9d17d94a-3c10-40f4-815d-514310269b10', 'US', 'Spa', 'Spa', '2024-09-25 04:45:53', '2024-09-25 04:45:53'),
('9d17d94a-4229-45e3-b1ba-f4fa652309a7', 'ES', 'Spa', 'Spa', '2024-09-25 04:45:53', '2024-09-25 04:45:53'),
('9d17d94a-4afc-4824-b3f3-6d643278ad6e', 'US', 'Pool Status', 'Pool Status', '2024-09-25 04:45:53', '2024-09-25 04:45:53'),
('9d17d94a-5e34-487c-ab26-7aa68e0a89d6', 'ES', 'Pool Status', 'Pool Status', '2024-09-25 04:45:53', '2024-09-25 04:45:53'),
('9d17d94b-4233-4986-af85-f976287091c4', 'US', 'Fencing Material', 'Fencing Material', '2024-09-25 04:45:53', '2024-09-25 04:45:53'),
('9d17d94b-485e-412b-97e6-e73dbd904eee', 'ES', 'Fencing Material', 'Fencing Material', '2024-09-25 04:45:53', '2024-09-25 04:45:53'),
('9d17d94b-5414-449f-92e1-d9df224d60ea', 'US', 'Select Spa', 'Select Spa', '2024-09-25 04:45:54', '2024-09-25 04:45:54'),
('9d17d94b-57dc-44bb-b838-012084331433', 'ES', 'Select Spa', 'Select Spa', '2024-09-25 04:45:54', '2024-09-25 04:45:54'),
('9d17d94b-ddae-4085-b213-fce011d4ddfc', 'US', 'Parking Enclosure', 'Parking Enclosure', '2024-09-25 04:45:54', '2024-09-25 04:45:54'),
('9d17d94b-e0cd-4fec-9fa3-67d15c74d01e', 'ES', 'Parking Enclosure', 'Parking Enclosure', '2024-09-25 04:45:54', '2024-09-25 04:45:54'),
('9d17d94b-f180-42ed-834b-3f67c4636419', 'US', 'Fencing Status', 'Fencing Status', '2024-09-25 04:45:54', '2024-09-25 04:45:54'),
('9d17d94b-f5df-4319-9fd9-6f32ae8951c3', 'ES', 'Fencing Status', 'Fencing Status', '2024-09-25 04:45:54', '2024-09-25 04:45:54'),
('9d17d94c-426d-4677-b9b0-c82d47113e8e', 'US', 'Select Private Bath', 'Select Private Bath', '2024-09-25 04:45:54', '2024-09-25 04:45:54'),
('9d17d94c-4551-4339-b28e-e4a0f1a30261', 'ES', 'Select Private Bath', 'Select Private Bath', '2024-09-25 04:45:54', '2024-09-25 04:45:54'),
('9d17d94c-518f-4650-8b23-d5a93187317a', 'US', 'Private Bath', 'Private Bath', '2024-09-25 04:45:54', '2024-09-25 04:45:54'),
('9d17d94c-5519-4939-bcb5-cac05e819d7b', 'ES', 'Private Bath', 'Private Bath', '2024-09-25 04:45:54', '2024-09-25 04:45:54'),
('9d17d94c-a08a-48e1-a4d5-a6cd557c7e35', 'US', 'Select Outdoor Shower', 'Select Outdoor Shower', '2024-09-25 04:45:54', '2024-09-25 04:45:54'),
('9d17d94c-a38c-4eed-a495-2fab8f9b5288', 'ES', 'Select Outdoor Shower', 'Select Outdoor Shower', '2024-09-25 04:45:54', '2024-09-25 04:45:54'),
('9d17d94c-a897-4c78-a18c-75e78c60001f', 'US', 'Outdoor Shower', 'Outdoor Shower', '2024-09-25 04:45:54', '2024-09-25 04:45:54'),
('9d17d94c-ab4d-4f4b-b1f9-d28988a68b34', 'ES', 'Outdoor Shower', 'Outdoor Shower', '2024-09-25 04:45:54', '2024-09-25 04:45:54'),
('9d17d94d-0360-4cef-a290-82e56d19daf9', 'US', 'Landscape Maintenance', 'Landscape Maintenance', '2024-09-25 04:45:55', '2024-09-25 04:45:55'),
('9d17d94d-0373-4c1b-8f3c-7c2236fa5bfd', 'US', 'Foundation Conditions', 'Foundation Conditions', '2024-09-25 04:45:55', '2024-09-25 04:45:55'),
('9d17d94d-0647-471a-bd04-6eb9fb70c642', 'ES', 'Landscape Maintenance', 'Landscape Maintenance', '2024-09-25 04:45:55', '2024-09-25 04:45:55'),
('9d17d94d-0681-43dd-83f8-38aa38472618', 'ES', 'Foundation Conditions', 'Foundation Conditions', '2024-09-25 04:45:55', '2024-09-25 04:45:55'),
('9d17e08d-94a0-4859-89a0-a8b656497052', 'US', 'Search by School', 'Search by School', '2024-09-25 05:06:12', '2024-09-25 05:06:12'),
('9d17e08d-94a2-49bf-a594-7b65599086de', 'US', 'Search by School', 'Search by School', '2024-09-25 05:06:12', '2024-09-25 05:06:12'),
('9d17e08e-ca9f-46bd-a1b0-2dc4a9303fc5', 'ES', 'Search by School', 'Search by School', '2024-09-25 05:06:12', '2024-09-25 05:06:12'),
('9d17e08e-cacf-4e65-99e1-e97a1f90d5a0', 'ES', 'Search by School', 'Search by School', '2024-09-25 05:06:12', '2024-09-25 05:06:12'),
('9d17ed6a-090c-4659-97da-a6154ada2b53', 'US', 'Property saved successfully', 'Property saved successfully', '2024-09-25 05:42:09', '2024-09-25 05:42:09'),
('9d17ed6a-0cb4-4a3b-95a7-75731ea4d122', 'ES', 'Property saved successfully', 'Property saved successfully', '2024-09-25 05:42:09', '2024-09-25 05:42:09'),
('9d17ee67-6459-4085-9d0f-791adbdb7575', 'US', 'Add new property', 'Add new property', '2024-09-25 05:44:55', '2024-09-25 05:44:55'),
('9d17ee67-6628-4f39-9cdd-246d41fdbf0b', 'US', 'Add new property', 'Add new property', '2024-09-25 05:44:55', '2024-09-25 05:44:55'),
('9d17ee67-69f5-460a-9842-01e763ac9be7', 'ES', 'Add new property', 'Add new property', '2024-09-25 05:44:55', '2024-09-25 05:44:55'),
('9d17ee67-6a37-4ac4-a5ca-7afcb42f8f8f', 'ES', 'Add new property', 'Add new property', '2024-09-25 05:44:55', '2024-09-25 05:44:55'),
('9d17eea4-3054-483a-b415-64bbc84d9ee4', 'US', 'Edit Home', 'Edit Home', '2024-09-25 05:45:35', '2024-09-25 05:45:35'),
('9d17eea4-3311-44d0-a06b-88833ebecf20', 'ES', 'Edit Home', 'Edit Home', '2024-09-25 05:45:35', '2024-09-25 05:45:35'),
('9d17f037-810e-4312-bd43-44ab1335d296', 'US', 'Properties', 'Properties', '2024-09-25 05:49:59', '2024-09-25 05:49:59'),
('9d17f037-8656-4cb6-b518-cc14065514a8', 'US', 'Properties', 'Properties', '2024-09-25 05:49:59', '2024-09-25 05:49:59'),
('9d17f037-8743-4569-8aae-81af0d9cec9b', 'ES', 'Properties', 'Properties', '2024-09-25 05:49:59', '2024-09-25 05:49:59'),
('9d17f037-8b48-4535-a300-57598ca463e1', 'ES', 'Properties', 'Properties', '2024-09-25 05:49:59', '2024-09-25 05:49:59'),
('9d17f048-1c6f-4d65-9ad8-f67596fc1ab5', 'US', 'Edit Property', 'Edit Property', '2024-09-25 05:50:10', '2024-09-25 05:50:10'),
('9d17f048-201d-4fb6-9059-aa30f79d7ef0', 'ES', 'Edit Property', 'Edit Property', '2024-09-25 05:50:10', '2024-09-25 05:50:10'),
('9d17f50c-b0f8-400b-ad7a-1a28c505d071', 'US', 'Feature Name', 'Feature Name', '2024-09-25 06:03:30', '2024-09-25 06:03:30'),
('9d17f50c-b0f8-4788-b89e-3e9ca977aae1', 'US', 'Feature ID', 'Feature ID', '2024-09-25 06:03:30', '2024-09-25 06:03:30'),
('9d17f50c-ba33-4e56-b3c9-5c12be895dff', 'ES', 'Feature ID', 'Feature ID', '2024-09-25 06:03:30', '2024-09-25 06:03:30'),
('9d17f50c-ba9e-4c8a-a934-c47a0e7317ca', 'ES', 'Feature Name', 'Feature Name', '2024-09-25 06:03:30', '2024-09-25 06:03:30'),
('9d17f50d-6b49-4697-b2f9-1c61224b6268', 'US', 'Walk-In Closet', 'Walk-In Closet', '2024-09-25 06:03:31', '2024-09-25 06:03:31'),
('9d17f50d-6c73-4bac-9046-8ac861df896c', 'US', 'Reach-In Closet', 'Reach-In Closet', '2024-09-25 06:03:31', '2024-09-25 06:03:31'),
('9d17f50d-6f56-4a0a-b09b-0c3118160551', 'ES', 'Walk-In Closet', 'Walk-In Closet', '2024-09-25 06:03:31', '2024-09-25 06:03:31'),
('9d17f50d-7038-46f8-989a-005757647787', 'ES', 'Reach-In Closet', 'Reach-In Closet', '2024-09-25 06:03:31', '2024-09-25 06:03:31'),
('9d198a4e-1ecd-4c22-af93-99fcb0c2a1a0', 'US', 'Search office by name', 'Search office by name', '2024-09-26 00:56:41', '2024-09-26 00:56:41'),
('9d198a4e-1ed2-4f24-be8a-a700a2c13235', 'US', 'Create office', 'Create office', '2024-09-26 00:56:41', '2024-09-26 00:56:41'),
('9d198a4f-4070-42bc-b85c-9ad81e94e05e', 'ES', 'Create office', 'Create office', '2024-09-26 00:56:41', '2024-09-26 00:56:41'),
('9d198a4f-40b7-4841-8e31-0cbae72ce913', 'ES', 'Search office by name', 'Search office by name', '2024-09-26 00:56:41', '2024-09-26 00:56:41'),
('9d19e03e-80ad-48ca-a9cc-758f1ceab57c', 'US', 'Create Property', 'Create Property', '2024-09-26 04:56:59', '2024-09-26 04:56:59'),
('9d19e03e-80ae-443d-8821-4cff648cdf99', 'US', 'Create Property', 'Create Property', '2024-09-26 04:56:59', '2024-09-26 04:56:59'),
('9d19e03f-74c2-45ea-92a6-73c38117fb1d', 'ES', 'Create Property', 'Create Property', '2024-09-26 04:56:59', '2024-09-26 04:56:59'),
('9d19e03f-74f8-49d9-943f-7834d45189b0', 'ES', 'Create Property', 'Create Property', '2024-09-26 04:56:59', '2024-09-26 04:56:59'),
('9d19e075-f164-4559-b944-60cb0688d5ed', 'US', 'L Date', 'L Date', '2024-09-26 04:57:35', '2024-09-26 04:57:35'),
('9d19e075-f693-4f64-b584-3f06ef22999e', 'ES', 'L Date', 'L Date', '2024-09-26 04:57:35', '2024-09-26 04:57:35'),
('9d19e076-bbaf-4bed-a4d3-97c2884b747b', 'US', 'Li Date', 'Li Date', '2024-09-26 04:57:36', '2024-09-26 04:57:36'),
('9d19e076-c303-4ac7-8280-c0b2d1c53d1e', 'ES', 'Li Date', 'Li Date', '2024-09-26 04:57:36', '2024-09-26 04:57:36'),
('9d19e077-6c20-4294-a235-4c33ac1c119d', 'US', 'Lia Date', 'Lia Date', '2024-09-26 04:57:36', '2024-09-26 04:57:36'),
('9d19e077-7583-4a34-a619-ad624b88976e', 'ES', 'Lia Date', 'Lia Date', '2024-09-26 04:57:36', '2024-09-26 04:57:36'),
('9d19e078-8d28-4a66-b5bd-3d532e6677e6', 'US', 'Liating Date', 'Liating Date', '2024-09-26 04:57:37', '2024-09-26 04:57:37'),
('9d19e078-95c4-46ba-bffb-1785fa1f6636', 'ES', 'Liating Date', 'Liating Date', '2024-09-26 04:57:37', '2024-09-26 04:57:37'),
('9d19e07b-20b8-4c28-b3a1-abb3cba48784', 'US', 'Liatin Date', 'Liatin Date', '2024-09-26 04:57:39', '2024-09-26 04:57:39'),
('9d19e07b-26e6-4d9e-8742-496a7af6f6fe', 'ES', 'Liatin Date', 'Liatin Date', '2024-09-26 04:57:39', '2024-09-26 04:57:39'),
('9d19e07b-a669-49bc-b667-b7416fb2fb84', 'US', 'Liati Date', 'Liati Date', '2024-09-26 04:57:39', '2024-09-26 04:57:39'),
('9d19e07b-aa8f-422b-91c8-61458e8e5752', 'ES', 'Liati Date', 'Liati Date', '2024-09-26 04:57:39', '2024-09-26 04:57:39'),
('9d19e07b-f92e-4fed-8d36-569190378b39', 'US', 'Liat Date', 'Liat Date', '2024-09-26 04:57:39', '2024-09-26 04:57:39'),
('9d19e07b-fbf4-4747-be42-e9f9cec81973', 'ES', 'Liat Date', 'Liat Date', '2024-09-26 04:57:39', '2024-09-26 04:57:39'),
('9d19e07c-e9de-4c33-b732-9130b82d91c7', 'US', 'Lis Date', 'Lis Date', '2024-09-26 04:57:40', '2024-09-26 04:57:40'),
('9d19e07c-eff8-4162-ac49-b45cc4ddeaf4', 'ES', 'Lis Date', 'Lis Date', '2024-09-26 04:57:40', '2024-09-26 04:57:40'),
('9d19e07d-73d0-4910-9092-39cbdfe13d96', 'US', 'Listing Date', 'Listing Date', '2024-09-26 04:57:40', '2024-09-26 04:57:40'),
('9d19e07d-76d8-4d75-94e8-2005683110d5', 'ES', 'Listing Date', 'Listing Date', '2024-09-26 04:57:40', '2024-09-26 04:57:40'),
('9d19e168-cf77-41d9-b0b9-41b9a926ea67', 'US', 'Search by cic', 'Search by cic', '2024-09-26 05:00:14', '2024-09-26 05:00:14'),
('9d19e168-d50e-458d-8f33-e2aa338db6e9', 'ES', 'Search by cic', 'Search by cic', '2024-09-26 05:00:14', '2024-09-26 05:00:14'),
('9d19e1d0-fe60-4d72-85f7-08fff8c74413', 'US', 'Search by reach_in', 'Search by reach_in', '2024-09-26 05:01:23', '2024-09-26 05:01:23'),
('9d19e1d1-0241-4444-b544-9b0c1a8e4ab0', 'ES', 'Search by reach_in', 'Search by reach_in', '2024-09-26 05:01:23', '2024-09-26 05:01:23'),
('9d19e1db-14f1-4021-a4a5-43a41a36af2a', 'US', 'S', 'S', '2024-09-26 05:01:29', '2024-09-26 05:01:29'),
('9d19e1db-1a51-4958-80e2-e49d8bc505d4', 'ES', 'S', 'S', '2024-09-26 05:01:29', '2024-09-26 05:01:29'),
('9d19e1db-db53-430d-a814-b750b4f1dcc1', 'US', 'Se', 'Se', '2024-09-26 05:01:30', '2024-09-26 05:01:30'),
('9d19e1db-dffd-4346-979b-1fda7a5705fe', 'ES', 'Se', 'Se', '2024-09-26 05:01:30', '2024-09-26 05:01:30'),
('9d19e1dc-7c8a-4e7d-820f-06b49685227f', 'US', 'Sele', 'Sele', '2024-09-26 05:01:30', '2024-09-26 05:01:30'),
('9d19e1dc-83e4-4521-a716-7fc240a793cb', 'ES', 'Sele', 'Sele', '2024-09-26 05:01:30', '2024-09-26 05:01:30'),
('9d19e1dd-24ef-4e04-9848-7b9562148173', 'US', 'Selec', 'Selec', '2024-09-26 05:01:31', '2024-09-26 05:01:31'),
('9d19e1dd-299d-44d2-a9d4-db674b725eaa', 'ES', 'Selec', 'Selec', '2024-09-26 05:01:31', '2024-09-26 05:01:31'),
('9d19e1de-3563-4692-b15c-1a9f8a134853', 'US', 'Select', 'Select', '2024-09-26 05:01:31', '2024-09-26 05:01:31'),
('9d19e1de-3b8a-4e5e-811d-14336a6edc73', 'ES', 'Select', 'Select', '2024-09-26 05:01:31', '2024-09-26 05:01:31'),
('9d19e1df-5563-4e81-881b-a38292c4c032', 'US', 'Select O', 'Select O', '2024-09-26 05:01:32', '2024-09-26 05:01:32'),
('9d19e1df-59e6-43ef-8589-b2bc1fa52a21', 'ES', 'Select O', 'Select O', '2024-09-26 05:01:32', '2024-09-26 05:01:32'),
('9d19e1df-e886-4016-be3c-2b7ce81d6591', 'US', 'Select Op', 'Select Op', '2024-09-26 05:01:32', '2024-09-26 05:01:32'),
('9d19e1df-eae3-41d2-902d-36d6f2b851df', 'ES', 'Select Op', 'Select Op', '2024-09-26 05:01:32', '2024-09-26 05:01:32'),
('9d19e1e0-7aed-4c80-bd30-8f728d7dce90', 'US', 'Select Optin', 'Select Optin', '2024-09-26 05:01:33', '2024-09-26 05:01:33'),
('9d19e1e0-84d4-4786-aea1-c5f0c81d3541', 'ES', 'Select Optin', 'Select Optin', '2024-09-26 05:01:33', '2024-09-26 05:01:33'),
('9d19e1e1-d9da-454d-870b-4e02fb68d917', 'US', 'Select Opti', 'Select Opti', '2024-09-26 05:01:34', '2024-09-26 05:01:34'),
('9d19e1e1-de47-4c2c-931d-3f346811f7dd', 'ES', 'Select Opti', 'Select Opti', '2024-09-26 05:01:34', '2024-09-26 05:01:34'),
('9d19e1e2-3451-4d21-a937-9981362b0d92', 'US', 'Select Optio', 'Select Optio', '2024-09-26 05:01:34', '2024-09-26 05:01:34'),
('9d19e1e2-38e8-492c-977e-229b9db6edf8', 'ES', 'Select Optio', 'Select Optio', '2024-09-26 05:01:34', '2024-09-26 05:01:34'),
('9d19e1e2-8d5f-45f9-8d48-6be15ff55db0', 'US', 'Select Option', 'Select Option', '2024-09-26 05:01:34', '2024-09-26 05:01:34'),
('9d19e1e2-9024-40b1-ba9b-8dc06a29b85e', 'ES', 'Select Option', 'Select Option', '2024-09-26 05:01:34', '2024-09-26 05:01:34'),
('9d19e1ea-2ef3-412e-a555-8ce37aabe21f', 'US', 'Sel', 'Sel', '2024-09-26 05:01:39', '2024-09-26 05:01:39'),
('9d19e1ea-33ce-4bf5-8ca2-b23bc75a31e8', 'ES', 'Sel', 'Sel', '2024-09-26 05:01:39', '2024-09-26 05:01:39'),
('9d19e1ea-d5d8-4f59-b45d-404ca379a6ce', 'US', 'Selse', 'Selse', '2024-09-26 05:01:40', '2024-09-26 05:01:40'),
('9d19e1ea-daff-4dd4-8fb3-e402a86ab7f6', 'ES', 'Selse', 'Selse', '2024-09-26 05:01:40', '2024-09-26 05:01:40'),
('9d19e1eb-8234-4d18-bd77-967c55f633ee', 'US', 'Sels', 'Sels', '2024-09-26 05:01:40', '2024-09-26 05:01:40'),
('9d19e1eb-8723-4985-8cd7-4e0aa9f758d1', 'ES', 'Sels', 'Sels', '2024-09-26 05:01:40', '2024-09-26 05:01:40'),
('9d19e1ed-f242-4344-90e6-027eb149e662', 'US', 'Select op', 'Select op', '2024-09-26 05:01:42', '2024-09-26 05:01:42'),
('9d19e1ed-f620-465d-8fbe-d9fb45e1f27d', 'ES', 'Select op', 'Select op', '2024-09-26 05:01:42', '2024-09-26 05:01:42'),
('9d19e1ee-41c5-412d-b7b1-245550647c0a', 'US', 'Select opti', 'Select opti', '2024-09-26 05:01:42', '2024-09-26 05:01:42'),
('9d19e1ee-44c8-490f-ad25-fda331859691', 'ES', 'Select opti', 'Select opti', '2024-09-26 05:01:42', '2024-09-26 05:01:42'),
('9d19e1ee-a2f5-45b8-98b0-d37fe8e0e213', 'US', 'Select optio', 'Select optio', '2024-09-26 05:01:42', '2024-09-26 05:01:42'),
('9d19e1ee-a78f-4ce2-8735-dac2594869f2', 'ES', 'Select optio', 'Select optio', '2024-09-26 05:01:42', '2024-09-26 05:01:42'),
('9d19e1ef-873c-4252-8194-12904e12a80a', 'US', 'Select option', 'Select option', '2024-09-26 05:01:43', '2024-09-26 05:01:43'),
('9d19e1ef-8bb0-45b6-9d0f-ef51d8eb6d78', 'ES', 'Select option', 'Select option', '2024-09-26 05:01:43', '2024-09-26 05:01:43'),
('9d19ed41-8c33-4987-8fc2-53526e1b38e2', 'US', 'Load More', 'Load More', '2024-09-26 05:33:22', '2024-09-26 05:33:22'),
('9d19ed41-93ca-4031-8a83-998bb863a6d8', 'ES', 'Load More', 'Load More', '2024-09-26 05:33:22', '2024-09-26 05:33:22'),
('9d24cbe1-426a-4020-b356-d66723af62ca', 'US', 'Subscribe', 'Subscribe', '2024-10-01 15:14:11', '2024-10-01 15:14:11'),
('9d24cbe4-0ed1-4f89-a797-f9900c72bbc3', 'ES', 'Subscribe', 'Subscribe', '2024-10-01 15:14:11', '2024-10-01 15:14:11'),
('9d24d509-f783-497e-89b3-227a5cdfc3cf', 'US', 'Carousel updated successfully.', 'Carousel updated successfully.', '2024-10-01 15:39:45', '2024-10-01 15:39:45'),
('9d24d509-fce9-4645-8dfc-eb2a9d7dd356', 'ES', 'Carousel updated successfully.', 'Carousel updated successfully.', '2024-10-01 15:39:45', '2024-10-01 15:39:45'),
('9d24d564-c1f8-4215-ba58-a7e98b3dd8bb', 'US', 'Website info section updated successfully.', 'Website info section updated successfully.', '2024-10-01 15:40:45', '2024-10-01 15:40:45'),
('9d24d564-c733-442e-a343-7fbe0360caa0', 'ES', 'Website info section updated successfully.', 'Website info section updated successfully.', '2024-10-01 15:40:45', '2024-10-01 15:40:45'),
('9d24d6cc-8752-49e4-9ff6-000d076d0e04', 'US', 'European getaways', 'European getaways', '2024-10-01 15:44:41', '2024-10-01 15:44:41'),
('9d24d6cc-8934-4d94-ac59-e8d9de1edf1a', 'US', 'Flash Sale', 'Flash Sale', '2024-10-01 15:44:41', '2024-10-01 15:44:41'),
('9d24d6cc-8fbc-444f-9552-1e1f30072bbe', 'ES', 'European getaways', 'European getaways', '2024-10-01 15:44:41', '2024-10-01 15:44:41'),
('9d24d6cc-8fe4-4a56-a671-691e07e57609', 'ES', 'Flash Sale', 'Flash Sale', '2024-10-01 15:44:41', '2024-10-01 15:44:41'),
('9d259b52-82ed-42f2-936e-102333f9d589', 'US', 'home_main_image', 'home_main_image', '2024-10-02 00:54:12', '2024-10-02 00:54:12'),
('9d259b52-8bfd-46ac-8a1f-837fb434643a', 'ES', 'home_main_image', 'home_main_image', '2024-10-02 00:54:12', '2024-10-02 00:54:12'),
('9d259b54-ad27-41d8-bfa1-3cca647bd615', 'US', 'ome_main_image', 'ome_main_image', '2024-10-02 00:54:13', '2024-10-02 00:54:13'),
('9d259b54-b1f0-4f7a-a8df-88c53f4922ff', 'ES', 'ome_main_image', 'ome_main_image', '2024-10-02 00:54:13', '2024-10-02 00:54:13'),
('9d259b55-06e2-413b-81fd-24e622bd1974', 'US', 'Home_main_image', 'Home_main_image', '2024-10-02 00:54:13', '2024-10-02 00:54:13'),
('9d259b55-0d14-46cd-a2b3-d2882d29a865', 'ES', 'Home_main_image', 'Home_main_image', '2024-10-02 00:54:13', '2024-10-02 00:54:13'),
('9d259b58-1cca-42f0-b847-88b3165114e0', 'US', 'Home main_image', 'Home main_image', '2024-10-02 00:54:15', '2024-10-02 00:54:15'),
('9d259b58-21c9-47c6-a485-70ddf14fb1e0', 'ES', 'Home main_image', 'Home main_image', '2024-10-02 00:54:15', '2024-10-02 00:54:15'),
('9d259b5a-ef8b-4b53-85e6-42992193248c', 'US', 'Home main image', 'Home main image', '2024-10-02 00:54:17', '2024-10-02 00:54:17'),
('9d259b5a-f3e0-459e-9d0e-c59c8e604dbd', 'ES', 'Home main image', 'Home main image', '2024-10-02 00:54:17', '2024-10-02 00:54:17'),
('9d259e5e-850f-4ce2-b90b-af56cb460bae', 'US', 'Upload Images/Videos f', 'Upload Images/Videos f', '2024-10-02 01:02:43', '2024-10-02 01:02:43'),
('9d259e5e-a963-46cd-b62a-041d6335b692', 'ES', 'Upload Images/Videos f', 'Upload Images/Videos f', '2024-10-02 01:02:43', '2024-10-02 01:02:43'),
('9d259e5f-fa14-4b96-a4c2-b813341be26f', 'US', 'Upload Images/Videos fro', 'Upload Images/Videos fro', '2024-10-02 01:02:44', '2024-10-02 01:02:44'),
('9d259e60-00f7-4296-bb5d-b91048f0ffc2', 'ES', 'Upload Images/Videos fro', 'Upload Images/Videos fro', '2024-10-02 01:02:44', '2024-10-02 01:02:44'),
('9d259e60-2e5f-4dcc-b95e-8d3f6bd9c59a', 'US', 'Upload Images/Videos fro t', 'Upload Images/Videos fro t', '2024-10-02 01:02:44', '2024-10-02 01:02:44'),
('9d259e60-37f3-4820-8ee4-de9e2995a0fc', 'ES', 'Upload Images/Videos fro t', 'Upload Images/Videos fro t', '2024-10-02 01:02:44', '2024-10-02 01:02:44'),
('9d259e61-1e47-4446-8719-add39835ed11', 'US', 'Upload Images/Videos fro th', 'Upload Images/Videos fro th', '2024-10-02 01:02:45', '2024-10-02 01:02:45'),
('9d259e61-23cd-4741-8f03-6c59dbe044c5', 'ES', 'Upload Images/Videos fro th', 'Upload Images/Videos fro th', '2024-10-02 01:02:45', '2024-10-02 01:02:45'),
('9d259e62-5fd5-4a50-a68f-921f4d0b1ffe', 'US', 'Upload Images/Videos for', 'Upload Images/Videos for', '2024-10-02 01:02:45', '2024-10-02 01:02:45'),
('9d259e62-645c-47c1-ac98-67ebeae7c1ba', 'ES', 'Upload Images/Videos for', 'Upload Images/Videos for', '2024-10-02 01:02:45', '2024-10-02 01:02:45'),
('9d259e66-28dc-477b-bcc9-305254e876dc', 'US', 'Upload Images/Videos for the pr', 'Upload Images/Videos for the pr', '2024-10-02 01:02:48', '2024-10-02 01:02:48'),
('9d259e66-2c1b-40e7-a50d-ea6484257460', 'ES', 'Upload Images/Videos for the pr', 'Upload Images/Videos for the pr', '2024-10-02 01:02:48', '2024-10-02 01:02:48'),
('9d259e66-72c3-43f0-a285-0709b552d786', 'US', 'Upload Images/Videos for the pro', 'Upload Images/Videos for the pro', '2024-10-02 01:02:48', '2024-10-02 01:02:48'),
('9d259e66-75bc-47fc-897f-050098f19975', 'ES', 'Upload Images/Videos for the pro', 'Upload Images/Videos for the pro', '2024-10-02 01:02:48', '2024-10-02 01:02:48'),
('9d259e66-a211-4c51-b610-c2c052249057', 'US', 'Upload Images/Videos for the prop', 'Upload Images/Videos for the prop', '2024-10-02 01:02:48', '2024-10-02 01:02:48'),
('9d259e66-a553-47c2-9464-154664bb50af', 'ES', 'Upload Images/Videos for the prop', 'Upload Images/Videos for the prop', '2024-10-02 01:02:48', '2024-10-02 01:02:48'),
('9d259e68-41df-4f79-a509-92c397020997', 'US', 'Upload Images/Videos for the prope', 'Upload Images/Videos for the prope', '2024-10-02 01:02:49', '2024-10-02 01:02:49'),
('9d259e68-445c-4d7f-b934-8e1bed3888c9', 'ES', 'Upload Images/Videos for the prope', 'Upload Images/Videos for the prope', '2024-10-02 01:02:49', '2024-10-02 01:02:49'),
('9d259e68-7985-478f-85f5-a08fb0ad9e60', 'US', 'Upload Images/Videos for the propert', 'Upload Images/Videos for the propert', '2024-10-02 01:02:49', '2024-10-02 01:02:49'),
('9d259e68-7c14-4ca9-9d71-62b46bb548b0', 'ES', 'Upload Images/Videos for the propert', 'Upload Images/Videos for the propert', '2024-10-02 01:02:49', '2024-10-02 01:02:49'),
('9d259e68-975a-4563-81f5-3a7db264d0ea', 'US', 'Upload Images/Videos for the property', 'Upload Images/Videos for the property', '2024-10-02 01:02:50', '2024-10-02 01:02:50'),
('9d259e68-99ce-4ad3-b4ee-26e65f9d5a42', 'ES', 'Upload Images/Videos for the property', 'Upload Images/Videos for the property', '2024-10-02 01:02:50', '2024-10-02 01:02:50'),
('9d260c91-21da-41af-add1-ea1b6a7eb402', 'US', 'Property deleted successfully.', 'Property deleted successfully.', '2024-10-02 06:10:52', '2024-10-02 06:10:52'),
('9d260c92-59bc-4375-898f-21e165d5ecb8', 'ES', 'Property deleted successfully.', 'Property deleted successfully.', '2024-10-02 06:10:52', '2024-10-02 06:10:52'),
('9d2631e0-07f9-4aea-93e7-9cf7ac049e27', 'US', 'promises', 'promises', '2024-10-02 07:55:10', '2024-10-02 07:55:10'),
('9d2631e0-1295-47c7-84ec-e3d50aedd161', 'ES', 'promises', 'promises', '2024-10-02 07:55:10', '2024-10-02 07:55:10'),
('9d2631e0-d549-44c7-94bf-e4c9d2bdda65', 'US', 'Add new prmise', 'Add new prmise', '2024-10-02 07:55:11', '2024-10-02 07:55:11'),
('9d2631e0-dca3-4628-a6bc-d85c345748a0', 'ES', 'Add new prmise', 'Add new prmise', '2024-10-02 07:55:11', '2024-10-02 07:55:11'),
('9d2631e1-01b7-4e59-b647-4a0841610d8a', 'US', 'Search by promise', 'Search by promise', '2024-10-02 07:55:11', '2024-10-02 07:55:11'),
('9d2631e1-0613-48ae-a281-97fb05f213b9', 'ES', 'Search by promise', 'Search by promise', '2024-10-02 07:55:11', '2024-10-02 07:55:11'),
('9d2631e1-862f-4c05-b350-36b1dbe80f27', 'US', 'Icon', 'Icon', '2024-10-02 07:55:11', '2024-10-02 07:55:11'),
('9d2631e1-8d74-4bbc-8f48-c891b591ffea', 'ES', 'Icon', 'Icon', '2024-10-02 07:55:11', '2024-10-02 07:55:11'),
('9d2632a2-580d-4545-9c3e-859d8f51a3cc', 'US', 'Promise added successfully', 'Promise added successfully', '2024-10-02 07:57:18', '2024-10-02 07:57:18'),
('9d2632a2-5ff8-4a28-8adc-0444cebc70f2', 'ES', 'Promise added successfully', 'Promise added successfully', '2024-10-02 07:57:18', '2024-10-02 07:57:18'),
('9d263df5-b77d-4285-ba26-de011e931bc9', 'US', 'Carousel deleted successfully.', 'Carousel deleted successfully.', '2024-10-02 08:28:58', '2024-10-02 08:28:58'),
('9d263df5-c416-4548-ae29-d95c97f5a058', 'ES', 'Carousel deleted successfully.', 'Carousel deleted successfully.', '2024-10-02 08:28:58', '2024-10-02 08:28:58'),
('9d26497d-1ac2-4a00-ac34-782991ab7a65', 'US', 'Co', 'Co', '2024-10-02 09:01:12', '2024-10-02 09:01:12'),
('9d26497d-218c-4291-bfd0-a0daa6f73fbb', 'ES', 'Co', 'Co', '2024-10-02 09:01:12', '2024-10-02 09:01:12'),
('9d26497e-d08c-4352-9c24-e8beff5714ac', 'US', 'Comm', 'Comm', '2024-10-02 09:01:13', '2024-10-02 09:01:13'),
('9d26497e-d884-4b4c-93e8-7d2d6fa897fe', 'ES', 'Comm', 'Comm', '2024-10-02 09:01:13', '2024-10-02 09:01:13'),
('9d26497f-b918-4434-a141-0fd7f0139f23', 'US', 'Commun', 'Commun', '2024-10-02 09:01:14', '2024-10-02 09:01:14'),
('9d26497f-bd8f-41fe-88f0-bd337c0c2db6', 'ES', 'Commun', 'Commun', '2024-10-02 09:01:14', '2024-10-02 09:01:14'),
('9d264980-4036-4d1c-b25b-ae35e39aa250', 'US', 'Communi', 'Communi', '2024-10-02 09:01:14', '2024-10-02 09:01:14'),
('9d264980-4704-407c-aee0-182525435275', 'ES', 'Communi', 'Communi', '2024-10-02 09:01:14', '2024-10-02 09:01:14'),
('9d264982-9b41-4b28-a263-6ba97bf67cc6', 'US', 'Search by Community', 'Search by Community', '2024-10-02 09:01:16', '2024-10-02 09:01:16'),
('9d264982-9f9d-493c-9ca3-2d82d8a0227c', 'ES', 'Search by Community', 'Search by Community', '2024-10-02 09:01:16', '2024-10-02 09:01:16'),
('9d267ad3-402e-4374-acb9-0c82b70f8525', 'US', 'Qu', 'Qu', '2024-10-02 11:19:09', '2024-10-02 11:19:09'),
('9d267ad3-402f-4ad1-8f10-fe9968cf8d41', 'US', 'Q', 'Q', '2024-10-02 11:19:09', '2024-10-02 11:19:09'),
('9d267ad3-5cc1-4576-9c8f-a52b348ecb44', 'ES', 'Qu', 'Qu', '2024-10-02 11:19:09', '2024-10-02 11:19:09'),
('9d267ad3-5cdb-4593-bd9e-738676615885', 'ES', 'Q', 'Q', '2024-10-02 11:19:09', '2024-10-02 11:19:09'),
('9d267ad3-dbd0-4768-94a0-9911506c65ef', 'US', 'Quic', 'Quic', '2024-10-02 11:19:10', '2024-10-02 11:19:10'),
('9d267ad3-dbf2-4ba1-adf2-6861e2f6f90f', 'US', 'Qui', 'Qui', '2024-10-02 11:19:10', '2024-10-02 11:19:10'),
('9d267ad3-df5a-45d7-ac6b-ae1a1a6f3a33', 'ES', 'Qui', 'Qui', '2024-10-02 11:19:10', '2024-10-02 11:19:10'),
('9d267ad3-df8a-4350-b030-cb4b179168cc', 'ES', 'Quic', 'Quic', '2024-10-02 11:19:10', '2024-10-02 11:19:10'),
('9d267ad4-5fba-4431-bfce-b3a8753679f8', 'US', 'Quick', 'Quick', '2024-10-02 11:19:10', '2024-10-02 11:19:10'),
('9d267ad4-625c-415c-bb32-768db60392b3', 'US', 'Quick', 'Quick', '2024-10-02 11:19:10', '2024-10-02 11:19:10'),
('9d267ad4-64c2-4f58-b6ee-a9646c402a46', 'ES', 'Quick', 'Quick', '2024-10-02 11:19:10', '2024-10-02 11:19:10'),
('9d267ad4-68b6-416d-b9b9-e7fedde9bb0e', 'ES', 'Quick', 'Quick', '2024-10-02 11:19:10', '2024-10-02 11:19:10'),
('9d267ad5-5d3b-4652-8654-3baf2c7a1c8e', 'US', 'Quick M', 'Quick M', '2024-10-02 11:19:11', '2024-10-02 11:19:11'),
('9d267ad5-62e6-4fb0-8fca-f5922c5d772b', 'ES', 'Quick M', 'Quick M', '2024-10-02 11:19:11', '2024-10-02 11:19:11'),
('9d267ad5-babb-4378-b99e-4e52afd8c29a', 'US', 'Quick Mov', 'Quick Mov', '2024-10-02 11:19:11', '2024-10-02 11:19:11'),
('9d267ad5-bece-4483-a012-378b32f1470b', 'ES', 'Quick Mov', 'Quick Mov', '2024-10-02 11:19:11', '2024-10-02 11:19:11'),
('9d267ad6-71b7-49ad-9faf-16d759589845', 'US', 'Quick Move', 'Quick Move', '2024-10-02 11:19:11', '2024-10-02 11:19:11'),
('9d267ad6-757f-40c6-b933-07cf8eb5c921', 'ES', 'Quick Move', 'Quick Move', '2024-10-02 11:19:11', '2024-10-02 11:19:11'),
('9d267ad7-7adf-47f1-801a-54f614f3f46f', 'US', 'Quick Move &', 'Quick Move &', '2024-10-02 11:19:12', '2024-10-02 11:19:12'),
('9d267ad7-8340-4be4-a029-df90428077a6', 'ES', 'Quick Move &', 'Quick Move &', '2024-10-02 11:19:12', '2024-10-02 11:19:12'),
('9d267ad8-31cd-4708-9a2e-a354fa274892', 'US', 'Quick Move & h', 'Quick Move & h', '2024-10-02 11:19:13', '2024-10-02 11:19:13'),
('9d267ad8-35af-44b6-b864-a811e6ab4f4e', 'ES', 'Quick Move & h', 'Quick Move & h', '2024-10-02 11:19:13', '2024-10-02 11:19:13'),
('9d267ad8-7dd8-4e3a-81d5-5a286f6904fe', 'US', 'Quick Move & ho', 'Quick Move & ho', '2024-10-02 11:19:13', '2024-10-02 11:19:13'),
('9d267ad8-8483-4aa4-bacd-94d9266de44c', 'ES', 'Quick Move & ho', 'Quick Move & ho', '2024-10-02 11:19:13', '2024-10-02 11:19:13'),
('9d267ad8-ef8a-4999-b3f1-eaaaad4578b5', 'US', 'Quick Move & hom', 'Quick Move & hom', '2024-10-02 11:19:13', '2024-10-02 11:19:13'),
('9d267ad8-f472-4de8-9b5f-e51d11319a4d', 'ES', 'Quick Move & hom', 'Quick Move & hom', '2024-10-02 11:19:13', '2024-10-02 11:19:13'),
('9d267ada-d13e-4239-8b3c-e6d2af661d59', 'US', 'Quick Move I', 'Quick Move I', '2024-10-02 11:19:14', '2024-10-02 11:19:14'),
('9d267ada-d7c3-4db1-b545-8ca467fc29f7', 'ES', 'Quick Move I', 'Quick Move I', '2024-10-02 11:19:14', '2024-10-02 11:19:14'),
('9d267adb-194d-4dbd-834f-51bba52d676b', 'US', 'Quick Move In', 'Quick Move In', '2024-10-02 11:19:14', '2024-10-02 11:19:14'),
('9d267adb-1dc6-40c5-acf1-44d1914317dd', 'ES', 'Quick Move In', 'Quick Move In', '2024-10-02 11:19:14', '2024-10-02 11:19:14'),
('9d267adb-ade3-4ea4-9555-63eebcacefc6', 'US', 'Quick Move In H', 'Quick Move In H', '2024-10-02 11:19:15', '2024-10-02 11:19:15'),
('9d267adb-b065-4bcf-9ff7-5752b8bb9afd', 'ES', 'Quick Move In H', 'Quick Move In H', '2024-10-02 11:19:15', '2024-10-02 11:19:15'),
('9d267adb-e8d4-4926-bdad-a086fb3901d4', 'US', 'Quick Move In Hom', 'Quick Move In Hom', '2024-10-02 11:19:15', '2024-10-02 11:19:15'),
('9d267adb-eb73-42f8-bc10-f13eff57a2ce', 'ES', 'Quick Move In Hom', 'Quick Move In Hom', '2024-10-02 11:19:15', '2024-10-02 11:19:15'),
('9d267adc-1088-4e94-8282-7d3e73c46530', 'US', 'Quick Move In Home', 'Quick Move In Home', '2024-10-02 11:19:15', '2024-10-02 11:19:15'),
('9d267adc-1326-4b68-94e2-6e032c406fe3', 'ES', 'Quick Move In Home', 'Quick Move In Home', '2024-10-02 11:19:15', '2024-10-02 11:19:15'),
('9d267adc-5319-4ab4-84f2-b9e54273a2b0', 'US', 'Quick Move In Homes', 'Quick Move In Homes', '2024-10-02 11:19:15', '2024-10-02 11:19:15'),
('9d267adc-55cf-4f38-a1c5-195a540c79a9', 'ES', 'Quick Move In Homes', 'Quick Move In Homes', '2024-10-02 11:19:15', '2024-10-02 11:19:15'),
('9d267ae4-c8f4-4fba-9260-20f3a42d3d1e', 'US', 'L', 'L', '2024-10-02 11:19:21', '2024-10-02 11:19:21'),
('9d267ae4-ccd3-4b6c-b409-992d1dd6fb7d', 'ES', 'L', 'L', '2024-10-02 11:19:21', '2024-10-02 11:19:21'),
('9d267ae5-3a2b-4349-9734-aaac5f268363', 'US', 'La', 'La', '2024-10-02 11:19:21', '2024-10-02 11:19:21'),
('9d267ae5-3d70-49c5-8578-64664f3e2e6d', 'ES', 'La', 'La', '2024-10-02 11:19:21', '2024-10-02 11:19:21'),
('9d267ae6-1931-435f-a445-3c6272df6d2c', 'US', 'Las', 'Las', '2024-10-02 11:19:22', '2024-10-02 11:19:22'),
('9d267ae6-1e8a-467a-a483-c4687c60fd67', 'ES', 'Las', 'Las', '2024-10-02 11:19:22', '2024-10-02 11:19:22'),
('9d267ae7-4d3d-4425-86f7-562972f439cb', 'US', 'Las V', 'Las V', '2024-10-02 11:19:22', '2024-10-02 11:19:22'),
('9d267ae7-50eb-431c-92f1-0b7146f8e46f', 'ES', 'Las V', 'Las V', '2024-10-02 11:19:22', '2024-10-02 11:19:22');
INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
('9d267ae7-e58a-4342-8a1a-f9474552514f', 'US', 'Las Ve', 'Las Ve', '2024-10-02 11:19:23', '2024-10-02 11:19:23'),
('9d267ae7-e9e7-418a-9313-13e8e26b8318', 'ES', 'Las Ve', 'Las Ve', '2024-10-02 11:19:23', '2024-10-02 11:19:23'),
('9d267ae9-247c-414b-ba8f-ea34db453e1d', 'US', 'Las Veg', 'Las Veg', '2024-10-02 11:19:24', '2024-10-02 11:19:24'),
('9d267ae9-29d4-4209-84ae-76dfa39ee18f', 'ES', 'Las Veg', 'Las Veg', '2024-10-02 11:19:24', '2024-10-02 11:19:24'),
('9d267ae9-f61f-45d7-ba48-b5fb4ae58a85', 'US', 'Las Vegar', 'Las Vegar', '2024-10-02 11:19:24', '2024-10-02 11:19:24'),
('9d267ae9-fadb-469b-b00f-388913fe0a13', 'ES', 'Las Vegar', 'Las Vegar', '2024-10-02 11:19:24', '2024-10-02 11:19:24'),
('9d267aeb-49ad-47f3-884d-629e9f5f54d2', 'US', 'Las Vegas', 'Las Vegas', '2024-10-02 11:19:25', '2024-10-02 11:19:25'),
('9d267aeb-4dae-4e52-a4f8-d42102c5ec80', 'ES', 'Las Vegas', 'Las Vegas', '2024-10-02 11:19:25', '2024-10-02 11:19:25'),
('9d267b42-83f8-461e-bb11-1568e172a2e0', 'US', 'QDiscover Your Dream Home', 'QDiscover Your Dream Home', '2024-10-02 11:20:22', '2024-10-02 11:20:22'),
('9d267b42-88c1-48ee-8f74-33bc5639885c', 'ES', 'QDiscover Your Dream Home', 'QDiscover Your Dream Home', '2024-10-02 11:20:22', '2024-10-02 11:20:22'),
('9d267b44-e2c6-40ac-bf21-a3ef03174cf6', 'US', 'Discover Your Dream Home', 'Discover Your Dream Home', '2024-10-02 11:20:24', '2024-10-02 11:20:24'),
('9d267b44-f115-48f0-adc8-7c9e942cffd9', 'ES', 'Discover Your Dream Home', 'Discover Your Dream Home', '2024-10-02 11:20:24', '2024-10-02 11:20:24'),
('9d267b4f-64f7-41c5-a961-e489a754a45e', 'US', 'Quick Move-Ins in Las Vegas', 'Quick Move-Ins in Las Vegas', '2024-10-02 11:20:31', '2024-10-02 11:20:31'),
('9d267b4f-6939-4df3-9907-0079f068f0e8', 'ES', 'Quick Move-Ins in Las Vegas', 'Quick Move-Ins in Las Vegas', '2024-10-02 11:20:31', '2024-10-02 11:20:31'),
('9d267b7e-1608-40f2-bfaf-d5d4aaac77f0', 'US', 'Quick Move-Ins', 'Quick Move-Ins', '2024-10-02 11:21:01', '2024-10-02 11:21:01'),
('9d267b7e-1e37-4806-a05c-6041c1e85280', 'ES', 'Quick Move-Ins', 'Quick Move-Ins', '2024-10-02 11:21:01', '2024-10-02 11:21:01'),
('9d267bec-8a9a-493f-8226-6f0881162cbf', 'US', 'Logo updated successfully.', 'Logo updated successfully.', '2024-10-02 11:22:14', '2024-10-02 11:22:14'),
('9d267bec-90cb-41f7-98b6-5b097cd02b45', 'ES', 'Logo updated successfully.', 'Logo updated successfully.', '2024-10-02 11:22:14', '2024-10-02 11:22:14'),
('9d26a525-3ff7-4ff0-860a-aa27623eefc5', 'US', 'Optional', 'Optional', '2024-10-02 13:17:30', '2024-10-02 13:17:30'),
('9d26a526-294e-4f67-a687-b52bce2c957b', 'ES', 'Optional', 'Optional', '2024-10-02 13:17:30', '2024-10-02 13:17:30'),
('9d26a588-4a38-4aa1-8f81-243dc5ea81e7', 'US', 'Included', 'Included', '2024-10-02 13:18:34', '2024-10-02 13:18:34'),
('9d26a588-4fb7-4ba9-80e3-f7170a5ab398', 'ES', 'Included', 'Included', '2024-10-02 13:18:34', '2024-10-02 13:18:34'),
('9d26a59f-6ab9-4d84-ae02-1034ed8424de', 'US', 'I', 'I', '2024-10-02 13:18:50', '2024-10-02 13:18:50'),
('9d26a59f-74ee-490a-915c-2fb5fcb76881', 'ES', 'I', 'I', '2024-10-02 13:18:50', '2024-10-02 13:18:50'),
('9d26a5a0-703c-4a79-b10c-1f2474b28c2d', 'US', 'Is', 'Is', '2024-10-02 13:18:50', '2024-10-02 13:18:50'),
('9d26a5a0-76f8-460d-83c4-6db24623e2df', 'ES', 'Is', 'Is', '2024-10-02 13:18:50', '2024-10-02 13:18:50'),
('9d26a5a0-bae9-46bd-9ee0-f29ac1eac05f', 'US', 'Is thi', 'Is thi', '2024-10-02 13:18:50', '2024-10-02 13:18:50'),
('9d26a5a0-bf72-4050-8348-68f5ee6f3fe3', 'ES', 'Is thi', 'Is thi', '2024-10-02 13:18:50', '2024-10-02 13:18:50'),
('9d26a5a1-8d3a-4022-a699-9069e573c72d', 'US', 'Is this', 'Is this', '2024-10-02 13:18:51', '2024-10-02 13:18:51'),
('9d26a5a1-93b6-4b09-9f4b-812652ed6734', 'ES', 'Is this', 'Is this', '2024-10-02 13:18:51', '2024-10-02 13:18:51'),
('9d26a5a2-55b5-4d04-9fdc-c75e82d0a6bf', 'US', 'Is this ope', 'Is this ope', '2024-10-02 13:18:51', '2024-10-02 13:18:51'),
('9d26a5a2-5957-4e8e-a4b1-7c8d232409a9', 'ES', 'Is this ope', 'Is this ope', '2024-10-02 13:18:51', '2024-10-02 13:18:51'),
('9d26a5a3-ca06-4e40-8f4c-a664ca5d1633', 'US', 'Is this open', 'Is this open', '2024-10-02 13:18:52', '2024-10-02 13:18:52'),
('9d26a5a3-ce45-4cb6-93fd-269072d4add7', 'ES', 'Is this open', 'Is this open', '2024-10-02 13:18:52', '2024-10-02 13:18:52'),
('9d26a5a4-6316-4bfe-a342-6519f5eda77a', 'US', 'Is this open house', 'Is this open house', '2024-10-02 13:18:53', '2024-10-02 13:18:53'),
('9d26a5a4-6694-4fe4-93bc-2b44841958be', 'ES', 'Is this open house', 'Is this open house', '2024-10-02 13:18:53', '2024-10-02 13:18:53'),
('9d26a5a4-6b0c-441b-9fbd-7bb663f6cda5', 'US', 'Is this open h', 'Is this open h', '2024-10-02 13:18:53', '2024-10-02 13:18:53'),
('9d26a5a4-6f4e-4027-a22b-e603e3b94053', 'ES', 'Is this open h', 'Is this open h', '2024-10-02 13:18:53', '2024-10-02 13:18:53'),
('9d26a5a8-cbfd-4fba-a52c-43b78bdc2452', 'US', 'N', 'N', '2024-10-02 13:18:56', '2024-10-02 13:18:56'),
('9d26a5a8-cf2d-4eb8-8fd2-2bfb8f29cccd', 'ES', 'N', 'N', '2024-10-02 13:18:56', '2024-10-02 13:18:56'),
('9d26a695-203a-4ced-87f5-7ffb5a754ff7', 'US', 'Tour dates', 'Tour dates', '2024-10-02 13:21:31', '2024-10-02 13:21:31'),
('9d26a695-2856-412e-92ad-a576066923b4', 'ES', 'Tour dates', 'Tour dates', '2024-10-02 13:21:31', '2024-10-02 13:21:31'),
('9d26a695-3578-4cdb-b6dd-7c3cb47bb3e8', 'US', 'Dates', 'Dates', '2024-10-02 13:21:31', '2024-10-02 13:21:31'),
('9d26a695-3c04-4a4d-9410-3bf450fce1c7', 'ES', 'Dates', 'Dates', '2024-10-02 13:21:31', '2024-10-02 13:21:31'),
('9d26a695-c8e8-4273-b469-35cc4da5aa10', 'US', 'Infants', 'Infants', '2024-10-02 13:21:31', '2024-10-02 13:21:31'),
('9d26a695-cf3b-485b-8107-d1a883c8f68f', 'ES', 'Infants', 'Infants', '2024-10-02 13:21:31', '2024-10-02 13:21:31'),
('9d26a695-d1ac-4609-b692-c6dff776360a', 'US', 'Children', 'Children', '2024-10-02 13:21:31', '2024-10-02 13:21:31'),
('9d26a695-d8ce-4aa9-a79d-f7113a436aa1', 'ES', 'Children', 'Children', '2024-10-02 13:21:31', '2024-10-02 13:21:31'),
('9d26a696-519d-4ad1-b50d-4460cec76a3e', 'US', 'Adults', 'Adults', '2024-10-02 13:21:31', '2024-10-02 13:21:31'),
('9d26a696-5601-4fdc-a81b-59e1b42919f8', 'ES', 'Adults', 'Adults', '2024-10-02 13:21:31', '2024-10-02 13:21:31'),
('9d26a7ef-bae1-4de3-ad0e-a4da6558444e', 'US', 'Date', 'Date', '2024-10-02 13:25:18', '2024-10-02 13:25:18'),
('9d26a7ef-c834-4e97-99d3-a1a7f80c1a49', 'ES', 'Date', 'Date', '2024-10-02 13:25:18', '2024-10-02 13:25:18'),
('9d26a817-1a91-407e-b290-1f050965b53c', 'US', 'description', 'description', '2024-10-02 13:25:44', '2024-10-02 13:25:44'),
('9d26a817-1da3-489b-9a82-eec6d42326da', 'ES', 'description', 'description', '2024-10-02 13:25:44', '2024-10-02 13:25:44'),
('9d26a81c-b496-4e2e-a2df-9d3097ac5552', 'US', 'escription', 'escription', '2024-10-02 13:25:47', '2024-10-02 13:25:47'),
('9d26a81c-b8e7-43b8-9ceb-36ec9f91f7cb', 'ES', 'escription', 'escription', '2024-10-02 13:25:47', '2024-10-02 13:25:47'),
('9d26a81d-a91f-47d4-b8a9-73e51639a6f8', 'US', 'Sescription', 'Sescription', '2024-10-02 13:25:48', '2024-10-02 13:25:48'),
('9d26a81d-ac44-4509-b8f9-46663fd6b0e5', 'ES', 'Sescription', 'Sescription', '2024-10-02 13:25:48', '2024-10-02 13:25:48'),
('9d26aa0d-e72c-4bc3-8a20-9c20a40fda8c', 'US', 'start_time', 'start_time', '2024-10-02 13:31:13', '2024-10-02 13:31:13'),
('9d26aa0d-f626-4e39-a9ce-dfd477fd3506', 'ES', 'start_time', 'start_time', '2024-10-02 13:31:13', '2024-10-02 13:31:13'),
('9d26aa0f-f311-4814-bcb9-a349bee5866a', 'US', 'Start_time', 'Start_time', '2024-10-02 13:31:14', '2024-10-02 13:31:14'),
('9d26aa0f-f89e-4a3e-943f-77c5eec6c7b6', 'ES', 'Start_time', 'Start_time', '2024-10-02 13:31:14', '2024-10-02 13:31:14'),
('9d26aa12-4528-40e5-8ebc-3390fc2aad49', 'US', 'Start time', 'Start time', '2024-10-02 13:31:16', '2024-10-02 13:31:16'),
('9d26aa12-488e-4caa-bd27-fc97dcbcac30', 'ES', 'Start time', 'Start time', '2024-10-02 13:31:16', '2024-10-02 13:31:16'),
('9d26aa2e-8f66-4334-94c9-671b7db35ecb', 'US', 'end_time', 'end_time', '2024-10-02 13:31:34', '2024-10-02 13:31:34'),
('9d26aa2e-95ad-4c6b-a036-55b18ed3110f', 'ES', 'end_time', 'end_time', '2024-10-02 13:31:34', '2024-10-02 13:31:34'),
('9d26aa30-2813-4452-989c-accf83273dbe', 'US', 'nd_time', 'nd_time', '2024-10-02 13:31:36', '2024-10-02 13:31:36'),
('9d26aa30-2c5b-4a4f-9976-99b9d515c7af', 'ES', 'nd_time', 'nd_time', '2024-10-02 13:31:36', '2024-10-02 13:31:36'),
('9d26aa31-15d1-4617-aea6-dd64ace131a5', 'US', 'End_time', 'End_time', '2024-10-02 13:31:36', '2024-10-02 13:31:36'),
('9d26aa31-1a1a-4daa-9212-7f1cf73c4ad7', 'ES', 'End_time', 'End_time', '2024-10-02 13:31:36', '2024-10-02 13:31:36'),
('9d26aa33-00a3-47ce-b973-c05cf07c54e4', 'US', 'Endtime', 'Endtime', '2024-10-02 13:31:37', '2024-10-02 13:31:37'),
('9d26aa33-059b-4a56-b879-68aba324c754', 'ES', 'Endtime', 'Endtime', '2024-10-02 13:31:37', '2024-10-02 13:31:37'),
('9d26aa33-8d17-4c81-ae6e-5a2002cf41bc', 'US', 'End time', 'End time', '2024-10-02 13:31:38', '2024-10-02 13:31:38'),
('9d26aa33-90b1-4731-8a11-10868f42b277', 'ES', 'End time', 'End time', '2024-10-02 13:31:38', '2024-10-02 13:31:38'),
('9d26b7f7-56ed-47db-a243-b150d423b717', 'US', 'Property saved as open House successfully', 'Property saved as open House successfully', '2024-10-02 14:10:07', '2024-10-02 14:10:07'),
('9d26b7f7-5b80-4a64-a57d-eff7a83e09e2', 'ES', 'Property saved as open House successfully', 'Property saved as open House successfully', '2024-10-02 14:10:07', '2024-10-02 14:10:07'),
('9d26bffc-5e50-4d6b-a276-0252a7700b7e', 'US', 'Da', 'Da', '2024-10-02 14:32:33', '2024-10-02 14:32:33'),
('9d26bffc-7df4-451e-bf41-112553b038f9', 'ES', 'Da', 'Da', '2024-10-02 14:32:33', '2024-10-02 14:32:33'),
('9d26bffc-8c26-46f3-b776-0109fbc355bc', 'US', 'Dat', 'Dat', '2024-10-02 14:32:33', '2024-10-02 14:32:33'),
('9d26bffc-94c9-43da-9cfc-a14e5fd05ff5', 'ES', 'Dat', 'Dat', '2024-10-02 14:32:33', '2024-10-02 14:32:33'),
('9d26c03d-8eef-421a-ba2b-20a4a8a19b57', 'US', 'Sa', 'Sa', '2024-10-02 14:33:15', '2024-10-02 14:33:15'),
('9d26c03d-94d7-46de-9cbe-048708588831', 'ES', 'Sa', 'Sa', '2024-10-02 14:33:15', '2024-10-02 14:33:15'),
('9d26c03d-e437-4a4b-88f7-d0d88dcef155', 'US', 'Sat', 'Sat', '2024-10-02 14:33:16', '2024-10-02 14:33:16'),
('9d26c03d-eb12-4c4b-909f-e683f2bf4275', 'ES', 'Sat', 'Sat', '2024-10-02 14:33:16', '2024-10-02 14:33:16'),
('9d26c03e-b4d3-4ba9-b1ac-988a1dc1aa00', 'US', 'St', 'St', '2024-10-02 14:33:16', '2024-10-02 14:33:16'),
('9d26c03e-ba05-4abb-a621-78155329b868', 'ES', 'St', 'St', '2024-10-02 14:33:16', '2024-10-02 14:33:16'),
('9d26c03f-2027-46a7-b69e-09976c9125d9', 'US', 'Sta', 'Sta', '2024-10-02 14:33:16', '2024-10-02 14:33:16'),
('9d26c03f-2405-4b3a-bf9f-599796d328a7', 'ES', 'Sta', 'Sta', '2024-10-02 14:33:16', '2024-10-02 14:33:16'),
('9d26c03f-5ff9-4636-980a-a6d5f496d0b8', 'US', 'Star', 'Star', '2024-10-02 14:33:16', '2024-10-02 14:33:16'),
('9d26c03f-65a2-4cd5-b3aa-8556df0c8b44', 'ES', 'Star', 'Star', '2024-10-02 14:33:16', '2024-10-02 14:33:16'),
('9d26c040-0696-4a91-80e9-f760ba749d29', 'US', 'Start', 'Start', '2024-10-02 14:33:17', '2024-10-02 14:33:17'),
('9d26c040-0c0e-4220-b7c6-b5b3119da68e', 'ES', 'Start', 'Start', '2024-10-02 14:33:17', '2024-10-02 14:33:17'),
('9d26c041-1221-4779-94d4-e6d76cd05ead', 'US', 'Start date', 'Start date', '2024-10-02 14:33:18', '2024-10-02 14:33:18'),
('9d26c041-16c0-4d9f-b4df-9cdd3f23d15f', 'ES', 'Start date', 'Start date', '2024-10-02 14:33:18', '2024-10-02 14:33:18'),
('9d26c041-e620-461f-948c-bb5a1a646437', 'US', 'Start dat', 'Start dat', '2024-10-02 14:33:18', '2024-10-02 14:33:18'),
('9d26c041-ecdd-4b1e-84ac-d27e44a9b686', 'ES', 'Start dat', 'Start dat', '2024-10-02 14:33:18', '2024-10-02 14:33:18'),
('9d26c042-70a2-495f-b7d1-ca637f1090f4', 'US', 'Start da', 'Start da', '2024-10-02 14:33:18', '2024-10-02 14:33:18'),
('9d26c042-7430-4eb5-bfa2-d2b23956b47e', 'ES', 'Start da', 'Start da', '2024-10-02 14:33:18', '2024-10-02 14:33:18'),
('9d26c042-8400-4e9f-b851-ce4339533f41', 'US', 'Start d', 'Start d', '2024-10-02 14:33:19', '2024-10-02 14:33:19'),
('9d26c042-875e-46f5-a6b6-dd48920d1567', 'ES', 'Start d', 'Start d', '2024-10-02 14:33:19', '2024-10-02 14:33:19'),
('9d26c043-1737-4e41-9fa2-fea2f952e5b2', 'US', 'Start t', 'Start t', '2024-10-02 14:33:19', '2024-10-02 14:33:19'),
('9d26c043-19da-4886-8d6a-5780370541dc', 'US', 'Start tm', 'Start tm', '2024-10-02 14:33:19', '2024-10-02 14:33:19'),
('9d26c043-1a9f-4454-850e-e1d5d3310244', 'ES', 'Start t', 'Start t', '2024-10-02 14:33:19', '2024-10-02 14:33:19'),
('9d26c043-1d52-4e4d-afc8-dbbac6a041f9', 'ES', 'Start tm', 'Start tm', '2024-10-02 14:33:19', '2024-10-02 14:33:19'),
('9d26c044-2178-4650-884f-a1cbfe82c1ad', 'US', 'Start tim', 'Start tim', '2024-10-02 14:33:20', '2024-10-02 14:33:20'),
('9d26c044-23f7-4736-9efd-ebd00ecf6f63', 'ES', 'Start tim', 'Start tim', '2024-10-02 14:33:20', '2024-10-02 14:33:20'),
('9d26c04b-0c20-4dd2-b45a-39873fcc2290', 'US', 'E time', 'E time', '2024-10-02 14:33:24', '2024-10-02 14:33:24'),
('9d26c04b-1073-4152-8066-248bfe814fd9', 'ES', 'E time', 'E time', '2024-10-02 14:33:24', '2024-10-02 14:33:24'),
('9d26c04c-4aa7-4f21-8f0b-d297cda0af1c', 'US', 'En time', 'En time', '2024-10-02 14:33:25', '2024-10-02 14:33:25'),
('9d26c04c-4dd2-4dfa-b14e-fb0d6619cebc', 'ES', 'En time', 'En time', '2024-10-02 14:33:25', '2024-10-02 14:33:25'),
('9d26c22a-3621-4a12-be76-f0a356f59f1c', 'US', 'Property removed as open House', 'Property removed as open House', '2024-10-02 14:38:38', '2024-10-02 14:38:38'),
('9d26c22a-3d47-4f9b-a5c0-2e87d670f8b1', 'ES', 'Property removed as open House', 'Property removed as open House', '2024-10-02 14:38:38', '2024-10-02 14:38:38'),
('9d26c526-0318-4ff4-9977-3c74a908d1e7', 'US', 'O', 'O', '2024-10-02 14:46:59', '2024-10-02 14:46:59'),
('9d26c526-0824-42d9-93a7-933033e5e0ec', 'ES', 'O', 'O', '2024-10-02 14:46:59', '2024-10-02 14:46:59'),
('9d26c526-24c6-40d4-bf76-353ed9984414', 'US', 'Op', 'Op', '2024-10-02 14:46:59', '2024-10-02 14:46:59'),
('9d26c526-289b-45e2-8c7e-3fba3f13592d', 'ES', 'Op', 'Op', '2024-10-02 14:46:59', '2024-10-02 14:46:59'),
('9d26c527-7a9a-47fb-81ee-ac5824d1c3c0', 'US', 'Ope', 'Ope', '2024-10-02 14:47:00', '2024-10-02 14:47:00'),
('9d26c527-7fc0-41db-aa70-e487120e9303', 'ES', 'Ope', 'Ope', '2024-10-02 14:47:00', '2024-10-02 14:47:00'),
('9d26c528-95c3-44b3-816e-a07101deba6c', 'US', 'Open h', 'Open h', '2024-10-02 14:47:00', '2024-10-02 14:47:00'),
('9d26c528-a59f-48dc-9f99-ab1b0f331e60', 'ES', 'Open h', 'Open h', '2024-10-02 14:47:00', '2024-10-02 14:47:00'),
('9d26c529-dba7-484b-8fb9-0332161c66d9', 'US', 'Open hpise', 'Open hpise', '2024-10-02 14:47:01', '2024-10-02 14:47:01'),
('9d26c529-dba9-4abf-8301-33bbcda48eba', 'US', 'Open hpise', 'Open hpise', '2024-10-02 14:47:01', '2024-10-02 14:47:01'),
('9d26c529-e151-422b-96a2-46720d875683', 'ES', 'Open hpise', 'Open hpise', '2024-10-02 14:47:01', '2024-10-02 14:47:01'),
('9d26c529-e185-4ab4-aaff-eb5271855e1d', 'ES', 'Open hpise', 'Open hpise', '2024-10-02 14:47:01', '2024-10-02 14:47:01'),
('9d26c52a-9b36-4f61-ba5c-ef0d9f5f668c', 'US', 'Open hpis', 'Open hpis', '2024-10-02 14:47:02', '2024-10-02 14:47:02'),
('9d26c52a-a036-4a1e-a506-103dba716879', 'ES', 'Open hpis', 'Open hpis', '2024-10-02 14:47:02', '2024-10-02 14:47:02'),
('9d26c52b-3342-41ca-b7a7-e247007fefc3', 'US', 'Open hpi', 'Open hpi', '2024-10-02 14:47:02', '2024-10-02 14:47:02'),
('9d26c52b-37e7-4e25-8c76-9c973d3626bc', 'ES', 'Open hpi', 'Open hpi', '2024-10-02 14:47:02', '2024-10-02 14:47:02'),
('9d26c52b-f899-42e0-b503-a72f938482e6', 'US', 'Open houes', 'Open houes', '2024-10-02 14:47:03', '2024-10-02 14:47:03'),
('9d26c52b-f8dd-40c7-9ebf-d4f54e086d64', 'US', 'Open hou', 'Open hou', '2024-10-02 14:47:03', '2024-10-02 14:47:03'),
('9d26c52b-fdb8-4a6a-9c50-bba29efece0d', 'ES', 'Open houes', 'Open houes', '2024-10-02 14:47:03', '2024-10-02 14:47:03'),
('9d26c52b-fee1-4ceb-bf85-f7766fb08f1e', 'ES', 'Open hou', 'Open hou', '2024-10-02 14:47:03', '2024-10-02 14:47:03'),
('9d26c52c-bd41-4489-a4a7-1ed8cd3c6c24', 'US', 'Open houes i', 'Open houes i', '2024-10-02 14:47:03', '2024-10-02 14:47:03'),
('9d26c52c-c326-4e07-9016-209339b7f73c', 'ES', 'Open houes i', 'Open houes i', '2024-10-02 14:47:03', '2024-10-02 14:47:03'),
('9d26c52d-aa86-4d3c-bfba-2c561f931923', 'US', 'Open houes in', 'Open houes in', '2024-10-02 14:47:04', '2024-10-02 14:47:04'),
('9d26c52d-b053-4a81-bb60-a29381d75da2', 'ES', 'Open houes in', 'Open houes in', '2024-10-02 14:47:04', '2024-10-02 14:47:04'),
('9d26c52d-c01c-49cf-b5ac-7c153d332e6c', 'US', 'Open houes inf', 'Open houes inf', '2024-10-02 14:47:04', '2024-10-02 14:47:04'),
('9d26c52d-cc7b-4100-8b71-33bb73537138', 'ES', 'Open houes inf', 'Open houes inf', '2024-10-02 14:47:04', '2024-10-02 14:47:04'),
('9d26c52e-692a-4a8b-b92d-13d5b8819c29', 'US', 'Open houes infor', 'Open houes infor', '2024-10-02 14:47:04', '2024-10-02 14:47:04'),
('9d26c52e-8a36-4a30-b883-dcdbee3ea212', 'ES', 'Open houes infor', 'Open houes infor', '2024-10-02 14:47:04', '2024-10-02 14:47:04'),
('9d26c52f-de4c-4e86-97c4-d66b8f5ccc41', 'US', 'Open houes infora', 'Open houes infora', '2024-10-02 14:47:05', '2024-10-02 14:47:05'),
('9d26c52f-e4ab-4200-b505-80c467dc286f', 'ES', 'Open houes infora', 'Open houes infora', '2024-10-02 14:47:05', '2024-10-02 14:47:05'),
('9d26c533-408f-4ba4-b53f-61b7347bbb52', 'US', 'Open houes information', 'Open houes information', '2024-10-02 14:47:07', '2024-10-02 14:47:07'),
('9d26c533-496b-4447-89b6-b63283a3ed0f', 'ES', 'Open houes information', 'Open houes information', '2024-10-02 14:47:07', '2024-10-02 14:47:07'),
('9d26d28e-1e4e-4d68-8fb5-f9bb3f6f89e5', 'US', 'DROP US A LINE', 'DROP US A LINE', '2024-10-02 15:24:28', '2024-10-02 15:24:28'),
('9d26d28e-2e6c-4bcd-91ab-bc3f5ee8add4', 'ES', 'DROP US A LINE', 'DROP US A LINE', '2024-10-02 15:24:28', '2024-10-02 15:24:28'),
('9d26d28e-788a-4e3b-8e7f-f4d550a071fd', 'US', 'Your Full Name', 'Your Full Name', '2024-10-02 15:24:28', '2024-10-02 15:24:28'),
('9d26d28e-7d01-4aa6-a576-193af566842c', 'ES', 'Your Full Name', 'Your Full Name', '2024-10-02 15:24:28', '2024-10-02 15:24:28'),
('9d26d28e-a2bd-40d2-9e4b-bd35f9f28d8a', 'US', 'Send', 'Send', '2024-10-02 15:24:28', '2024-10-02 15:24:28'),
('9d26d28e-a606-4a8f-91b8-4fc9dc663474', 'ES', 'Send', 'Send', '2024-10-02 15:24:28', '2024-10-02 15:24:28'),
('9d26d5e5-7a43-4137-aaff-f3f5f384d2f8', 'US', 'Create Blog Post', 'Create Blog Post', '2024-10-02 15:33:49', '2024-10-02 15:33:49'),
('9d26d5e5-7f64-4a3e-94a8-bd396c2d5df3', 'ES', 'Create Blog Post', 'Create Blog Post', '2024-10-02 15:33:49', '2024-10-02 15:33:49'),
('9d26e0c7-3ce4-444f-b01d-4382767f2d96', 'US', 'Profile', 'Profile', '2024-10-02 16:04:15', '2024-10-02 16:04:15'),
('9d26e0c7-3ce5-4e33-ae22-9c67109ac310', 'US', 'Overview', 'Overview', '2024-10-02 16:04:15', '2024-10-02 16:04:15'),
('9d26e0c8-06d7-4c6a-8adf-2af319eead24', 'ES', 'Profile', 'Profile', '2024-10-02 16:04:15', '2024-10-02 16:04:15'),
('9d26e0c8-06ff-4207-893c-9eed3b4db261', 'ES', 'Overview', 'Overview', '2024-10-02 16:04:15', '2024-10-02 16:04:15'),
('9d26e0c8-75f0-40b8-95ff-15ff431c6deb', 'US', 'Change password', 'Change password', '2024-10-02 16:04:15', '2024-10-02 16:04:15'),
('9d26e0c8-75fe-4f8a-83c7-35a7e0bd4e34', 'US', 'Edit profile', 'Edit profile', '2024-10-02 16:04:15', '2024-10-02 16:04:15'),
('9d26e0c8-7a24-472e-a1bf-582e00bd5c71', 'ES', 'Change password', 'Change password', '2024-10-02 16:04:15', '2024-10-02 16:04:15'),
('9d26e0c8-7aa4-445f-97f7-168078b9f7d3', 'ES', 'Edit profile', 'Edit profile', '2024-10-02 16:04:15', '2024-10-02 16:04:15'),
('9d26e0c8-ca86-46bf-9bbb-50a176a65a43', 'US', 'Role', 'Role', '2024-10-02 16:04:15', '2024-10-02 16:04:15'),
('9d26e0c8-cb00-4113-ac85-8f7228232a3c', 'US', 'Profile details', 'Profile details', '2024-10-02 16:04:15', '2024-10-02 16:04:15'),
('9d26e0c8-cce5-48fe-a3ea-22184902eb68', 'ES', 'Role', 'Role', '2024-10-02 16:04:15', '2024-10-02 16:04:15'),
('9d26e0c8-cd58-4709-afd1-4a7e013bf9f4', 'ES', 'Profile details', 'Profile details', '2024-10-02 16:04:15', '2024-10-02 16:04:15'),
('9d26e0c9-8843-410f-8c8d-9f3710651acf', 'US', 'Save changes', 'Save changes', '2024-10-02 16:04:16', '2024-10-02 16:04:16'),
('9d26e0c9-8ba3-4e05-8d75-4470dec6356c', 'US', 'Profile image', 'Profile image', '2024-10-02 16:04:16', '2024-10-02 16:04:16'),
('9d26e0c9-8ce3-4bd8-83d1-2619b2d8c87b', 'ES', 'Save changes', 'Save changes', '2024-10-02 16:04:16', '2024-10-02 16:04:16'),
('9d26e0c9-9045-4ec1-977e-30c269959af1', 'ES', 'Profile image', 'Profile image', '2024-10-02 16:04:16', '2024-10-02 16:04:16'),
('9d26e0ca-1458-4361-a2cf-b133bc2268e1', 'US', 'Current password', 'Current password', '2024-10-02 16:04:16', '2024-10-02 16:04:16'),
('9d26e0ca-176b-403c-9a57-c30f507e0fd9', 'ES', 'Current password', 'Current password', '2024-10-02 16:04:16', '2024-10-02 16:04:16'),
('9d26e0ca-1f2a-4fb2-9910-82bc2bf12b92', 'US', 'New password', 'New password', '2024-10-02 16:04:16', '2024-10-02 16:04:16'),
('9d26e0ca-21ab-47b6-8939-0467e23016cb', 'ES', 'New password', 'New password', '2024-10-02 16:04:16', '2024-10-02 16:04:16'),
('9d26e239-86cf-4a3e-ac96-020cb8ea5a4f', 'US', 'Logos updated successfully.', 'Logos updated successfully.', '2024-10-02 16:08:17', '2024-10-02 16:08:17'),
('9d26e239-8af1-41dc-ab95-7341557c7464', 'ES', 'Logos updated successfully.', 'Logos updated successfully.', '2024-10-02 16:08:17', '2024-10-02 16:08:17'),
('9d27f87f-3e93-435f-8d75-0cf0350f640b', 'US', 'Passengers', 'Passengers', '2024-10-03 05:06:24', '2024-10-03 05:06:24'),
('9d27f87f-3e93-4a23-ae45-2c881a44ad2f', 'US', 'Select a day to go to next step', 'Select a day to go to next step', '2024-10-03 05:06:24', '2024-10-03 05:06:24'),
('9d27f880-6dab-4018-b294-1e5514bd8b61', 'ES', 'Select a day to go to next step', 'Select a day to go to next step', '2024-10-03 05:06:24', '2024-10-03 05:06:24'),
('9d27f880-6db7-4372-9fa3-94391684b810', 'ES', 'Passengers', 'Passengers', '2024-10-03 05:06:24', '2024-10-03 05:06:24'),
('9d27f880-f013-4139-a0f7-bb0bca200a17', 'US', 'Apply', 'Apply', '2024-10-03 05:06:24', '2024-10-03 05:06:24'),
('9d27f880-f457-4ab6-85f2-f43ee78576ea', 'ES', 'Apply', 'Apply', '2024-10-03 05:06:24', '2024-10-03 05:06:24'),
('9d280b3c-3865-407a-820b-697460c8a3cf', 'US', 'P', 'P', '2024-10-03 05:58:47', '2024-10-03 05:58:47'),
('9d280b3c-3866-479b-a198-4d0a6d69a8d9', 'US', 'Ph', 'Ph', '2024-10-03 05:58:47', '2024-10-03 05:58:47'),
('9d280b3c-4de6-4f1a-98c1-325282528a90', 'ES', 'P', 'P', '2024-10-03 05:58:47', '2024-10-03 05:58:47'),
('9d280b3c-4df8-40e5-8631-f81fa649d0b1', 'ES', 'Ph', 'Ph', '2024-10-03 05:58:47', '2024-10-03 05:58:47'),
('9d280b3c-d318-4df5-bc22-80cfd816f235', 'US', 'Photo', 'Photo', '2024-10-03 05:58:47', '2024-10-03 05:58:47'),
('9d280b3c-d83c-4606-99c7-61f84ce42efa', 'ES', 'Photo', 'Photo', '2024-10-03 05:58:47', '2024-10-03 05:58:47'),
('9d280b3c-dced-4581-ba14-45ed070d9057', 'US', 'Pho', 'Pho', '2024-10-03 05:58:47', '2024-10-03 05:58:47'),
('9d280b3c-e543-4695-9b64-6be04bed5e39', 'ES', 'Pho', 'Pho', '2024-10-03 05:58:47', '2024-10-03 05:58:47'),
('9d280b3e-5a8b-43e5-9907-87d1984249a6', 'US', 'Photo G', 'Photo G', '2024-10-03 05:58:48', '2024-10-03 05:58:48'),
('9d280b3e-5fdd-49fc-8f95-dca3a02eb069', 'ES', 'Photo G', 'Photo G', '2024-10-03 05:58:48', '2024-10-03 05:58:48'),
('9d280b3e-d3b8-49e5-8804-79479170b448', 'US', 'Photo Ga', 'Photo Ga', '2024-10-03 05:58:49', '2024-10-03 05:58:49'),
('9d280b3e-d967-4ddc-b480-a943fcf3ca85', 'ES', 'Photo Ga', 'Photo Ga', '2024-10-03 05:58:49', '2024-10-03 05:58:49'),
('9d280b3f-0b68-4b72-a79f-e4b63ea7122f', 'US', 'Photo Gal', 'Photo Gal', '2024-10-03 05:58:49', '2024-10-03 05:58:49'),
('9d280b3f-0e9c-4d9f-9ff3-c55ae5434106', 'ES', 'Photo Gal', 'Photo Gal', '2024-10-03 05:58:49', '2024-10-03 05:58:49'),
('9d280b3f-5c74-4dd4-ab79-e35dcb26332b', 'US', 'Photo Galle', 'Photo Galle', '2024-10-03 05:58:49', '2024-10-03 05:58:49'),
('9d280b3f-619c-4377-8c0d-0e0ba4bd5717', 'ES', 'Photo Galle', 'Photo Galle', '2024-10-03 05:58:49', '2024-10-03 05:58:49'),
('9d280b3f-9924-485c-9ffc-aeaaf9607e37', 'US', 'Photo Gallery', 'Photo Gallery', '2024-10-03 05:58:49', '2024-10-03 05:58:49'),
('9d280b3f-9e47-4ec4-95ef-6013ae846c3b', 'ES', 'Photo Gallery', 'Photo Gallery', '2024-10-03 05:58:49', '2024-10-03 05:58:49'),
('9d280cc4-5b20-4497-ae4b-7dfe318e076a', 'US', 'HOA Name', 'HOA Name', '2024-10-03 06:03:04', '2024-10-03 06:03:04'),
('9d280cc4-5b26-4127-ab41-654f44a1044a', 'US', 'Community Name', 'Community Name', '2024-10-03 06:03:04', '2024-10-03 06:03:04'),
('9d280cc4-6b2a-47c8-9cbb-2f671cf8f55e', 'ES', 'HOA Name', 'HOA Name', '2024-10-03 06:03:04', '2024-10-03 06:03:04'),
('9d280cc4-6b5d-4756-b9c6-f7a1d9d554f3', 'ES', 'Community Name', 'Community Name', '2024-10-03 06:03:04', '2024-10-03 06:03:04'),
('9d280cc5-44c3-40bb-a61c-bf436f5bdf93', 'US', 'School Name', 'School Name', '2024-10-03 06:03:05', '2024-10-03 06:03:05'),
('9d280cc5-4888-484f-ae03-2645567ae6fe', 'US', 'Open House Date', 'Open House Date', '2024-10-03 06:03:05', '2024-10-03 06:03:05'),
('9d280cc5-4d71-403b-b162-dc34f67ebaa5', 'ES', 'School Name', 'School Name', '2024-10-03 06:03:05', '2024-10-03 06:03:05'),
('9d280cc5-51c6-405c-9132-3f65855c8367', 'ES', 'Open House Date', 'Open House Date', '2024-10-03 06:03:05', '2024-10-03 06:03:05'),
('9d280cc6-0056-4c4f-9c2d-c4162902464a', 'US', 'Open House Description', 'Open House Description', '2024-10-03 06:03:05', '2024-10-03 06:03:05'),
('9d280cc6-0332-465f-bd0c-b083f49e67f6', 'US', 'Open House Time', 'Open House Time', '2024-10-03 06:03:05', '2024-10-03 06:03:05'),
('9d280cc6-0661-4a06-8244-2d07e82fe6b1', 'ES', 'Open House Description', 'Open House Description', '2024-10-03 06:03:05', '2024-10-03 06:03:05'),
('9d280cc6-08bc-4a5a-98a5-75bfdccebebb', 'ES', 'Open House Time', 'Open House Time', '2024-10-03 06:03:05', '2024-10-03 06:03:05'),
('9d29ff35-b240-49ed-8228-a2839f3a6e8d', 'US', 'Trip hightlight', 'Trip hightlight', '2024-10-04 05:16:49', '2024-10-04 05:16:49'),
('9d29ff35-c3f4-40e0-9459-33dc2b6a2614', 'US', 'Tour highlights', 'Tour highlights', '2024-10-04 05:16:49', '2024-10-04 05:16:49'),
('9d29ff35-c8ea-4b47-ab80-56b2fd23010e', 'ES', 'Trip hightlight', 'Trip hightlight', '2024-10-04 05:16:49', '2024-10-04 05:16:49'),
('9d29ff35-c9d0-4b02-a03f-0043757054a7', 'ES', 'Tour highlights', 'Tour highlights', '2024-10-04 05:16:49', '2024-10-04 05:16:49'),
('9d2a087c-8249-45c7-96ba-8701e4a02f0d', 'US', 'Search h', 'Search h', '2024-10-04 05:42:45', '2024-10-04 05:42:45'),
('9d2a087c-824c-4632-86c1-95d80874c65a', 'US', 'Search h', 'Search h', '2024-10-04 05:42:45', '2024-10-04 05:42:45'),
('9d2a087c-966f-427d-ab02-d20d06331893', 'ES', 'Search h', 'Search h', '2024-10-04 05:42:45', '2024-10-04 05:42:45'),
('9d2a087c-9686-4ffa-93a8-9f52b7e28493', 'ES', 'Search h', 'Search h', '2024-10-04 05:42:45', '2024-10-04 05:42:45'),
('9d2a087d-1dae-40c0-8e8e-69d488b646e1', 'US', 'Search ho', 'Search ho', '2024-10-04 05:42:46', '2024-10-04 05:42:46'),
('9d2a087d-2205-4710-a36a-c9191de91f22', 'ES', 'Search ho', 'Search ho', '2024-10-04 05:42:46', '2024-10-04 05:42:46'),
('9d2a087d-2589-4989-b67a-9ca988785738', 'US', 'Search ho', 'Search ho', '2024-10-04 05:42:46', '2024-10-04 05:42:46'),
('9d2a087d-2a78-4dcf-b9bf-8dd81ade66d2', 'ES', 'Search ho', 'Search ho', '2024-10-04 05:42:46', '2024-10-04 05:42:46'),
('9d2a087d-98dd-4c66-87c2-5fe9635b9251', 'US', 'Search home', 'Search home', '2024-10-04 05:42:46', '2024-10-04 05:42:46'),
('9d2a087d-9cf3-444d-84d5-de08d38b378f', 'ES', 'Search home', 'Search home', '2024-10-04 05:42:46', '2024-10-04 05:42:46'),
('9d2a087d-a179-4c38-a50c-bea61d195e8e', 'US', 'Search hom', 'Search hom', '2024-10-04 05:42:46', '2024-10-04 05:42:46'),
('9d2a087d-a66e-4246-951e-afc284215207', 'ES', 'Search hom', 'Search hom', '2024-10-04 05:42:46', '2024-10-04 05:42:46'),
('9d2a087e-6c65-4e51-8ed8-dc1e8f81ac8b', 'US', 'Search homes', 'Search homes', '2024-10-04 05:42:46', '2024-10-04 05:42:46'),
('9d2a087e-72e0-4bc2-9fa2-23597acbfafd', 'ES', 'Search homes', 'Search homes', '2024-10-04 05:42:46', '2024-10-04 05:42:46'),
('9d2a087e-7b3c-4294-ac55-c24e8dbcbdf3', 'US', 'Search homes', 'Search homes', '2024-10-04 05:42:46', '2024-10-04 05:42:46'),
('9d2a087e-7fe8-46b8-9b29-1d98d536e1c4', 'ES', 'Search homes', 'Search homes', '2024-10-04 05:42:46', '2024-10-04 05:42:46'),
('9d2a0a98-9f04-4f75-af34-2b3a29314466', 'US', 'Tour', 'Tour', '2024-10-04 05:48:39', '2024-10-04 05:48:39'),
('9d2a0a98-acd2-46cf-aab8-05d68ca1a85a', 'ES', 'Tour', 'Tour', '2024-10-04 05:48:39', '2024-10-04 05:48:39'),
('9d2a0a9a-15d9-488e-9a08-269306163b9a', 'US', 'To', 'To', '2024-10-04 05:48:40', '2024-10-04 05:48:40'),
('9d2a0a9a-1b16-4d75-8496-187bff30d44d', 'ES', 'To', 'To', '2024-10-04 05:48:40', '2024-10-04 05:48:40'),
('9d2a0a9c-7e45-449d-8c8c-d2f271f09edd', 'US', 'A', 'A', '2024-10-04 05:48:42', '2024-10-04 05:48:42'),
('9d2a0a9c-8f32-4fe0-b5aa-27259a983776', 'ES', 'A', 'A', '2024-10-04 05:48:42', '2024-10-04 05:48:42'),
('9d2a0a9c-ddc2-48f9-9cf2-1c36df5ddfdc', 'US', 'Ad', 'Ad', '2024-10-04 05:48:42', '2024-10-04 05:48:42'),
('9d2a0a9c-e23f-4e04-810d-4e637e245c4a', 'ES', 'Ad', 'Ad', '2024-10-04 05:48:42', '2024-10-04 05:48:42'),
('9d2a0a9d-3f8e-40ae-aa2b-dd2d58d762f5', 'US', 'Adv', 'Adv', '2024-10-04 05:48:42', '2024-10-04 05:48:42'),
('9d2a0a9d-448f-4536-84ec-2c036c94b945', 'ES', 'Adv', 'Adv', '2024-10-04 05:48:42', '2024-10-04 05:48:42'),
('9d2a0a9e-21bd-45ee-a4d5-a637d92855ff', 'US', 'Adva', 'Adva', '2024-10-04 05:48:43', '2024-10-04 05:48:43'),
('9d2a0a9e-2687-4dd9-9340-ec4a66752b85', 'ES', 'Adva', 'Adva', '2024-10-04 05:48:43', '2024-10-04 05:48:43'),
('9d2a0a9f-22e8-4c19-84fa-9c5050373b25', 'US', 'Advan', 'Advan', '2024-10-04 05:48:43', '2024-10-04 05:48:43'),
('9d2a0a9f-2855-4398-b2fc-595f6ce5cdfd', 'ES', 'Advan', 'Advan', '2024-10-04 05:48:43', '2024-10-04 05:48:43'),
('9d2a0a9f-74d7-4c4c-bd75-fb281879ad2b', 'US', 'Advanc', 'Advanc', '2024-10-04 05:48:44', '2024-10-04 05:48:44'),
('9d2a0a9f-783b-4341-a638-95e0d8e3bb5f', 'ES', 'Advanc', 'Advanc', '2024-10-04 05:48:44', '2024-10-04 05:48:44'),
('9d2a0a9f-d125-4375-98d3-15049d50d1bf', 'US', 'Advance', 'Advance', '2024-10-04 05:48:44', '2024-10-04 05:48:44'),
('9d2a0a9f-d6fb-4cbb-ad84-9d6d7734c5ac', 'ES', 'Advance', 'Advance', '2024-10-04 05:48:44', '2024-10-04 05:48:44'),
('9d2a0aa0-6b69-4923-9722-71d90d50bb22', 'US', 'Advance S', 'Advance S', '2024-10-04 05:48:44', '2024-10-04 05:48:44'),
('9d2a0aa0-7025-4a5e-9c6d-518d61eec916', 'ES', 'Advance S', 'Advance S', '2024-10-04 05:48:44', '2024-10-04 05:48:44'),
('9d2a0aa0-a292-429c-9983-de3da95740a3', 'US', 'Advance Se', 'Advance Se', '2024-10-04 05:48:44', '2024-10-04 05:48:44'),
('9d2a0aa0-a735-460f-87fe-1fcfa4b3ae83', 'ES', 'Advance Se', 'Advance Se', '2024-10-04 05:48:44', '2024-10-04 05:48:44'),
('9d2a0aa1-0031-44fe-8c58-25a826a2fe56', 'US', 'Advance Sera', 'Advance Sera', '2024-10-04 05:48:45', '2024-10-04 05:48:45'),
('9d2a0aa1-0271-4c05-a1a4-c32222b31ca0', 'ES', 'Advance Sera', 'Advance Sera', '2024-10-04 05:48:45', '2024-10-04 05:48:45'),
('9d2a0aa1-28df-43ea-9a07-b2ee0199b651', 'US', 'Advance Serac', 'Advance Serac', '2024-10-04 05:48:45', '2024-10-04 05:48:45'),
('9d2a0aa1-2cd1-497b-8b73-23476457bb09', 'ES', 'Advance Serac', 'Advance Serac', '2024-10-04 05:48:45', '2024-10-04 05:48:45'),
('9d2a0aa1-b04e-498f-84fa-2c6e3ba205fc', 'US', 'Advance Serach', 'Advance Serach', '2024-10-04 05:48:45', '2024-10-04 05:48:45'),
('9d2a0aa1-b833-47c5-a32d-7e07b8a662f1', 'ES', 'Advance Serach', 'Advance Serach', '2024-10-04 05:48:45', '2024-10-04 05:48:45'),
('9d2a0aa4-9be5-45ae-b3c5-dab0df423d6a', 'US', 'Advance F', 'Advance F', '2024-10-04 05:48:47', '2024-10-04 05:48:47'),
('9d2a0aa4-9f24-4b29-94ea-94a9fd67429a', 'ES', 'Advance F', 'Advance F', '2024-10-04 05:48:47', '2024-10-04 05:48:47'),
('9d2a0aa4-c085-40d1-8800-60ad11f6117e', 'US', 'Advance Fl', 'Advance Fl', '2024-10-04 05:48:47', '2024-10-04 05:48:47'),
('9d2a0aa4-c395-4c0e-b8af-f88a69c504d6', 'ES', 'Advance Fl', 'Advance Fl', '2024-10-04 05:48:47', '2024-10-04 05:48:47'),
('9d2a0aa5-d874-4c04-b02e-85917d39b9ef', 'US', 'Advance Fi', 'Advance Fi', '2024-10-04 05:48:48', '2024-10-04 05:48:48'),
('9d2a0aa5-e34a-4014-bc60-45e7bd72237d', 'ES', 'Advance Fi', 'Advance Fi', '2024-10-04 05:48:48', '2024-10-04 05:48:48'),
('9d2a0aa6-44ac-4786-bece-d4ce06fb8e24', 'US', 'Advance Fil', 'Advance Fil', '2024-10-04 05:48:48', '2024-10-04 05:48:48'),
('9d2a0aa6-4d59-4988-9276-320c6a015a5c', 'ES', 'Advance Fil', 'Advance Fil', '2024-10-04 05:48:48', '2024-10-04 05:48:48'),
('9d2a0aa6-a512-4249-994f-a2195f09f990', 'US', 'Advance Filt', 'Advance Filt', '2024-10-04 05:48:48', '2024-10-04 05:48:48'),
('9d2a0aa6-a7c6-4934-9855-5885eae5c97e', 'ES', 'Advance Filt', 'Advance Filt', '2024-10-04 05:48:48', '2024-10-04 05:48:48'),
('9d2a0aa6-d986-4c2f-91f3-dc66775a0938', 'US', 'Advance Filter', 'Advance Filter', '2024-10-04 05:48:48', '2024-10-04 05:48:48'),
('9d2a0aa6-e147-4b3b-80b9-fb576c2a8683', 'ES', 'Advance Filter', 'Advance Filter', '2024-10-04 05:48:48', '2024-10-04 05:48:48'),
('9d2a0aba-a6a9-48f9-970a-2add12430c77', 'US', 'Advance Filte', 'Advance Filte', '2024-10-04 05:49:01', '2024-10-04 05:49:01'),
('9d2a0aba-aa88-4ff2-84d0-10693d5bef2d', 'ES', 'Advance Filte', 'Advance Filte', '2024-10-04 05:49:01', '2024-10-04 05:49:01'),
('9d2a0b13-4d90-40d4-9d20-c4a6e8577b2e', 'US', 'Upate record', 'Upate record', '2024-10-04 05:50:00', '2024-10-04 05:50:00'),
('9d2a0b13-5456-4b4d-bfd8-f315caa096ba', 'ES', 'Upate record', 'Upate record', '2024-10-04 05:50:00', '2024-10-04 05:50:00'),
('9d2a1018-92d1-4327-ba06-ac2f1f68b413', 'US', 'Sea', 'Sea', '2024-10-04 06:04:02', '2024-10-04 06:04:02'),
('9d2a1018-9d25-4e8b-bcf8-58419f2818a6', 'ES', 'Sea', 'Sea', '2024-10-04 06:04:02', '2024-10-04 06:04:02'),
('9d2a1019-69e1-4d02-be17-0d4b258b00e5', 'US', 'Sear', 'Sear', '2024-10-04 06:04:02', '2024-10-04 06:04:02'),
('9d2a1019-76e8-48b2-9364-705471118fdd', 'ES', 'Sear', 'Sear', '2024-10-04 06:04:02', '2024-10-04 06:04:02'),
('9d2a1019-8db4-447f-a2cf-0de92791b80b', 'US', 'Searc', 'Searc', '2024-10-04 06:04:02', '2024-10-04 06:04:02'),
('9d2a1019-92f3-46cf-aee6-10889d6b1747', 'ES', 'Searc', 'Searc', '2024-10-04 06:04:02', '2024-10-04 06:04:02'),
('9d2a101a-9e53-45de-a892-66894f65c7d8', 'US', 'Searcg', 'Searcg', '2024-10-04 06:04:03', '2024-10-04 06:04:03'),
('9d2a101a-a24c-46fa-92f1-4324953af06c', 'US', 'Searcg', 'Searcg', '2024-10-04 06:04:03', '2024-10-04 06:04:03'),
('9d2a101a-a6d6-4fe6-ac8b-706a54c2bb05', 'ES', 'Searcg', 'Searcg', '2024-10-04 06:04:03', '2024-10-04 06:04:03'),
('9d2a101a-aac9-4d77-ba91-9e717eb24cdf', 'ES', 'Searcg', 'Searcg', '2024-10-04 06:04:03', '2024-10-04 06:04:03'),
('9d2a101b-85af-4236-929a-d4da88483950', 'US', 'Searcj', 'Searcj', '2024-10-04 06:04:04', '2024-10-04 06:04:04'),
('9d2a101b-877b-4aed-95b4-f11d0c3cc620', 'US', 'Searcj', 'Searcj', '2024-10-04 06:04:04', '2024-10-04 06:04:04'),
('9d2a101b-8c44-4910-926c-e39a8a71592c', 'ES', 'Searcj', 'Searcj', '2024-10-04 06:04:04', '2024-10-04 06:04:04'),
('9d2a101b-8ee2-42d1-9551-36889b73c40f', 'ES', 'Searcj', 'Searcj', '2024-10-04 06:04:04', '2024-10-04 06:04:04'),
('9d2a34c5-dd71-442d-8eda-c90639adec85', 'US', 'Searching', 'Searching', '2024-10-04 07:46:35', '2024-10-04 07:46:35'),
('9d2a34c5-ee4c-49f0-a463-c21a0010c2af', 'ES', 'Searching', 'Searching', '2024-10-04 07:46:35', '2024-10-04 07:46:35'),
('9d2a3b5b-8d94-474e-9e39-fed2ab134dbb', 'US', 'Searched data successfully', 'Searched data successfully', '2024-10-04 08:05:00', '2024-10-04 08:05:00'),
('9d2a3b5b-b652-475c-9886-6b57e57961db', 'ES', 'Searched data successfully', 'Searched data successfully', '2024-10-04 08:05:00', '2024-10-04 08:05:00'),
('9d2a7b56-6081-461a-841f-dec11a98ed3c', 'US', 'No data found!', 'No data found!', '2024-10-04 11:03:54', '2024-10-04 11:03:54'),
('9d2a7b56-7a0a-42d5-9fc0-8be6b44c2132', 'ES', 'No data found!', 'No data found!', '2024-10-04 11:03:54', '2024-10-04 11:03:54'),
('9d2a7bbc-196e-4852-81c3-6d152a6d50a8', 'US', 'No matching data was found based on the provided search criteria!', 'No matching data was found based on the provided search criteria!', '2024-10-04 11:05:01', '2024-10-04 11:05:01'),
('9d2a7bbc-22e1-4b91-b134-e5b0834f9a2e', 'ES', 'No matching data was found based on the provided search criteria!', 'No matching data was found based on the provided search criteria!', '2024-10-04 11:05:01', '2024-10-04 11:05:01'),
('9d2ad2a0-8ab6-4058-8a10-78b3e6ed14c6', 'US', 'escriptions', 'escriptions', '2024-10-04 15:07:59', '2024-10-04 15:07:59'),
('9d2ad2a0-8ab7-444a-9782-936066dc962f', 'US', 'descriptions', 'descriptions', '2024-10-04 15:07:59', '2024-10-04 15:07:59'),
('9d2ad2a1-4a32-4178-b70c-d2a43975c26a', 'ES', 'escriptions', 'escriptions', '2024-10-04 15:07:59', '2024-10-04 15:07:59'),
('9d2ad2a1-4ab8-40c3-abaa-d4adcbbe3fb8', 'ES', 'descriptions', 'descriptions', '2024-10-04 15:07:59', '2024-10-04 15:07:59'),
('9d2ad3b7-1151-4661-bc25-ae5815bac584', 'US', 'Incentive saved successfully', 'Incentive saved successfully', '2024-10-04 15:11:01', '2024-10-04 15:11:01'),
('9d2ad3b7-1503-4b6a-b511-99d61ce98f19', 'ES', 'Incentive saved successfully', 'Incentive saved successfully', '2024-10-04 15:11:01', '2024-10-04 15:11:01'),
('9d2ad4e8-b893-4d5a-b9a6-d35c5edeaa2d', 'US', 'Edit Incentive', 'Edit Incentive', '2024-10-04 15:14:22', '2024-10-04 15:14:22'),
('9d2ad4e8-c582-4b32-b4c9-53db77e6ff50', 'ES', 'Edit Incentive', 'Edit Incentive', '2024-10-04 15:14:22', '2024-10-04 15:14:22'),
('9d2ad532-f012-45a0-a705-ec5e123dc3c9', 'US', 'Incentive deleted successfully.', 'Incentive deleted successfully.', '2024-10-04 15:15:10', '2024-10-04 15:15:10'),
('9d2ad532-f5dd-43b6-a6d5-5a0ceb172589', 'ES', 'Incentive deleted successfully.', 'Incentive deleted successfully.', '2024-10-04 15:15:10', '2024-10-04 15:15:10'),
('9d2ad842-f89a-4066-91c4-cabfb9004d6d', 'US', 'Search by incentive', 'Search by incentive', '2024-10-04 15:23:44', '2024-10-04 15:23:44'),
('9d2ad843-00c3-44be-8d5a-99af0fa1f7bf', 'ES', 'Search by incentive', 'Search by incentive', '2024-10-04 15:23:44', '2024-10-04 15:23:44'),
('9d2ad845-5930-4eaa-8959-7f96f61e86a4', 'US', 'Search by incentives', 'Search by incentives', '2024-10-04 15:23:46', '2024-10-04 15:23:46'),
('9d2ad845-5dd0-4ed7-9075-b0bc11294d16', 'ES', 'Search by incentives', 'Search by incentives', '2024-10-04 15:23:46', '2024-10-04 15:23:46'),
('9d2ad99a-b5a1-4360-8c3c-add33195a4c9', 'US', 'incentives', 'incentives', '2024-10-04 15:27:29', '2024-10-04 15:27:29'),
('9d2ad99a-c726-4f9c-b009-2c08503800a6', 'ES', 'incentives', 'incentives', '2024-10-04 15:27:29', '2024-10-04 15:27:29'),
('9d2ad99d-b25d-4c6c-aa1e-b9d7b5963420', 'US', 'ncentives', 'ncentives', '2024-10-04 15:27:31', '2024-10-04 15:27:31'),
('9d2ad99d-b97f-4dd6-86f9-74cc69267133', 'ES', 'ncentives', 'ncentives', '2024-10-04 15:27:31', '2024-10-04 15:27:31'),
('9d2bc391-71a6-42a5-87df-d126d20d7923', 'US', 'In', 'In', '2024-10-05 02:21:42', '2024-10-05 02:21:42'),
('9d2bc391-71a6-4477-ac7f-3c9310cbcedf', 'US', 'In', 'In', '2024-10-05 02:21:42', '2024-10-05 02:21:42'),
('9d2bc391-84e0-4a5a-b810-40a1c8033b28', 'ES', 'In', 'In', '2024-10-05 02:21:42', '2024-10-05 02:21:42'),
('9d2bc391-86bf-4b4c-acb4-b169f99a74e1', 'ES', 'In', 'In', '2024-10-05 02:21:42', '2024-10-05 02:21:42'),
('9d2bc392-57fc-493a-a109-3e07fbe1fd30', 'US', 'Inv', 'Inv', '2024-10-05 02:21:43', '2024-10-05 02:21:43'),
('9d2bc392-5db3-49c8-bb73-9debc29d31f2', 'ES', 'Inv', 'Inv', '2024-10-05 02:21:43', '2024-10-05 02:21:43'),
('9d2bc392-722f-4af2-9818-34609baad36b', 'US', 'Inve', 'Inve', '2024-10-05 02:21:43', '2024-10-05 02:21:43'),
('9d2bc392-7851-4f0d-9bc5-aef10f1dbf63', 'ES', 'Inve', 'Inve', '2024-10-05 02:21:43', '2024-10-05 02:21:43'),
('9d2bc393-02ab-4565-abbc-6b4ea3802379', 'US', 'Inver', 'Inver', '2024-10-05 02:21:43', '2024-10-05 02:21:43'),
('9d2bc393-0799-467a-a89e-7c458d99abd3', 'ES', 'Inver', 'Inver', '2024-10-05 02:21:43', '2024-10-05 02:21:43'),
('9d2bc393-3494-4c1c-8e59-e99b128440e9', 'US', 'Ince', 'Ince', '2024-10-05 02:21:43', '2024-10-05 02:21:43'),
('9d2bc393-3abc-479c-887a-92910ce5b94e', 'ES', 'Ince', 'Ince', '2024-10-05 02:21:43', '2024-10-05 02:21:43'),
('9d2bc394-0d91-425f-845d-68e4f6f9292a', 'US', 'Incent', 'Incent', '2024-10-05 02:21:44', '2024-10-05 02:21:44'),
('9d2bc394-118a-4c48-b994-57e3a001b7fa', 'ES', 'Incent', 'Incent', '2024-10-05 02:21:44', '2024-10-05 02:21:44'),
('9d2bf163-6c45-4d87-828a-bde42a3d49e4', 'US', 'how much', 'how much', '2024-10-05 04:29:49', '2024-10-05 04:29:49'),
('9d2bf163-7ce6-404c-bb63-265e25d78f28', 'ES', 'how much', 'how much', '2024-10-05 04:29:49', '2024-10-05 04:29:49'),
('9d2bf22b-0ccd-499f-9fad-11859e540395', 'US', 'H', 'H', '2024-10-05 04:32:00', '2024-10-05 04:32:00'),
('9d2bf22b-1603-487a-b634-2d6322114fed', 'ES', 'H', 'H', '2024-10-05 04:32:00', '2024-10-05 04:32:00'),
('9d2bf22b-9708-43fc-80ba-61200a77b3c3', 'US', 'Ho', 'Ho', '2024-10-05 04:32:00', '2024-10-05 04:32:00'),
('9d2bf22b-9f41-4538-bbd1-7f53e0ea5be1', 'ES', 'Ho', 'Ho', '2024-10-05 04:32:00', '2024-10-05 04:32:00'),
('9d2bf22c-06e4-4e11-952c-509b849a0218', 'US', 'Hoe', 'Hoe', '2024-10-05 04:32:01', '2024-10-05 04:32:01'),
('9d2bf22c-10a9-4906-b0be-b31e395605b5', 'ES', 'Hoe', 'Hoe', '2024-10-05 04:32:01', '2024-10-05 04:32:01'),
('9d2bf22c-ddaf-4238-bb45-c85438aa0390', 'US', 'How', 'How', '2024-10-05 04:32:01', '2024-10-05 04:32:01'),
('9d2bf22c-e326-4a8f-92c5-ad97d754ce84', 'ES', 'How', 'How', '2024-10-05 04:32:01', '2024-10-05 04:32:01'),
('9d2bf22d-250b-4da3-9a7a-74f31ad37fe1', 'US', 'How m', 'How m', '2024-10-05 04:32:02', '2024-10-05 04:32:02'),
('9d2bf22d-2a5f-461c-aac9-0bf248eb8755', 'ES', 'How m', 'How m', '2024-10-05 04:32:02', '2024-10-05 04:32:02'),
('9d2bf22d-a245-4cb6-997f-d0babbbffcb8', 'US', 'How mu', 'How mu', '2024-10-05 04:32:02', '2024-10-05 04:32:02'),
('9d2bf22d-a6a0-4d71-9787-1acd600273f3', 'ES', 'How mu', 'How mu', '2024-10-05 04:32:02', '2024-10-05 04:32:02'),
('9d2bf22d-d630-42ce-ab34-99cc47d3746e', 'US', 'How muc', 'How muc', '2024-10-05 04:32:02', '2024-10-05 04:32:02'),
('9d2bf22d-d995-40b9-8d2a-edd4e7705931', 'ES', 'How muc', 'How muc', '2024-10-05 04:32:02', '2024-10-05 04:32:02'),
('9d2bf22e-2b48-48fe-9033-76252a17ad5c', 'US', 'How much', 'How much', '2024-10-05 04:32:02', '2024-10-05 04:32:02'),
('9d2bf22e-2e88-4502-9c87-895fbc5712f5', 'ES', 'How much', 'How much', '2024-10-05 04:32:02', '2024-10-05 04:32:02'),
('9d2bf309-699c-4754-9733-87fe3300b63d', 'US', 'ow much', 'ow much', '2024-10-05 04:34:26', '2024-10-05 04:34:26'),
('9d2bf309-752b-4c5c-b0dc-bdd89b1b1cb0', 'ES', 'ow much', 'ow much', '2024-10-05 04:34:26', '2024-10-05 04:34:26'),
('9d2c8bc5-15cd-4317-aafa-8daeda861a20', 'US', 'Sending', 'Sending', '2024-10-05 11:41:31', '2024-10-05 11:41:31'),
('9d2c8bc5-b8fe-4ef7-b69f-ddb91d6fc4b8', 'ES', 'Sending', 'Sending', '2024-10-05 11:41:31', '2024-10-05 11:41:31'),
('9d2c8c0a-4eff-4aae-b1a8-3b85a1d48efd', 'US', 'Message Sent successfully.', 'Message Sent successfully.', '2024-10-05 11:42:16', '2024-10-05 11:42:16'),
('9d2c8c0a-5170-4ca6-ad42-494c40752db8', 'ES', 'Message Sent successfully.', 'Message Sent successfully.', '2024-10-05 11:42:16', '2024-10-05 11:42:16'),
('9d2c8d4a-6480-436d-9a8c-e25a69a85ffd', 'US', 'Reply', 'Reply', '2024-10-05 11:45:45', '2024-10-05 11:45:45'),
('9d2c8d4a-7cfc-42ef-9e4b-ca03c61692b8', 'ES', 'Reply', 'Reply', '2024-10-05 11:45:45', '2024-10-05 11:45:45'),
('9d2c8d4a-e0d6-4bfd-8989-1a25a8b6c600', 'US', 'User message', 'User message', '2024-10-05 11:45:46', '2024-10-05 11:45:46'),
('9d2c8d4a-e611-44aa-9443-d04912c7fbf8', 'ES', 'User message', 'User message', '2024-10-05 11:45:46', '2024-10-05 11:45:46'),
('9d2c8d4a-f0d9-47cb-8e71-8e7469cf235e', 'US', 'Admin reply', 'Admin reply', '2024-10-05 11:45:46', '2024-10-05 11:45:46'),
('9d2c8d4a-f487-4669-8692-b01ee381e147', 'ES', 'Admin reply', 'Admin reply', '2024-10-05 11:45:46', '2024-10-05 11:45:46'),
('9d2c8d4b-562d-4bd6-bed8-9c513e18ce42', 'US', 'Subject', 'Subject', '2024-10-05 11:45:46', '2024-10-05 11:45:46'),
('9d2c8d4b-5936-42e4-b7a0-5a0a74d481b9', 'ES', 'Subject', 'Subject', '2024-10-05 11:45:46', '2024-10-05 11:45:46'),
('9d2c8d4b-5e83-4ff3-8b0b-7b9b96c6516b', 'US', 'Messge', 'Messge', '2024-10-05 11:45:46', '2024-10-05 11:45:46'),
('9d2c8d4b-619c-4543-9f25-d624291c9573', 'ES', 'Messge', 'Messge', '2024-10-05 11:45:46', '2024-10-05 11:45:46'),
('9d2c8d4b-bf97-4a58-bc1c-64eb6abbbd8b', 'US', 'Message', 'Message', '2024-10-05 11:45:46', '2024-10-05 11:45:46'),
('9d2c8d4b-c25d-4423-8d37-40d33d319d00', 'ES', 'Message', 'Message', '2024-10-05 11:45:46', '2024-10-05 11:45:46'),
('9d2c8dec-e569-4a90-832b-d44c1ef9a5f8', 'US', 'Message reply sent successfully.', 'Message reply sent successfully.', '2024-10-05 11:47:32', '2024-10-05 11:47:32'),
('9d2c8dec-f061-46cf-b7f3-38ce248fe949', 'ES', 'Message reply sent successfully.', 'Message reply sent successfully.', '2024-10-05 11:47:32', '2024-10-05 11:47:32'),
('9d2cc3fb-9e01-4373-a147-b94a5c75ec9d', 'US', 'Agents', 'Agents', '2024-10-05 14:18:41', '2024-10-05 14:18:41'),
('9d2cc3fb-b8e1-4e37-92a1-91a8aab06898', 'ES', 'Agents', 'Agents', '2024-10-05 14:18:41', '2024-10-05 14:18:41'),
('9d2cc824-18af-4def-b659-89f8615a5c34', 'US', 'Add new agent', 'Add new agent', '2024-10-05 14:30:19', '2024-10-05 14:30:19'),
('9d2cc824-2fcf-466a-841f-719d9aa48138', 'ES', 'Add new agent', 'Add new agent', '2024-10-05 14:30:19', '2024-10-05 14:30:19'),
('9d2cc82e-24bb-41aa-8855-a574ee144425', 'US', 'Agent Name', 'Agent Name', '2024-10-05 14:30:25', '2024-10-05 14:30:25'),
('9d2cc82e-2636-4ce5-869d-06f9d8f7ee4d', 'US', 'Create Agent', 'Create Agent', '2024-10-05 14:30:25', '2024-10-05 14:30:25'),
('9d2cc82e-2e31-4862-a462-29cea347f59e', 'ES', 'Agent Name', 'Agent Name', '2024-10-05 14:30:25', '2024-10-05 14:30:25'),
('9d2cc82e-32d9-4710-8984-708e927a22f0', 'ES', 'Create Agent', 'Create Agent', '2024-10-05 14:30:25', '2024-10-05 14:30:25'),
('9d2cc82e-e812-4677-82f0-904f1a0a9558', 'US', 'License Number', 'License Number', '2024-10-05 14:30:26', '2024-10-05 14:30:26'),
('9d2cc82e-ef02-4dea-b753-7642b5fc9101', 'ES', 'License Number', 'License Number', '2024-10-05 14:30:26', '2024-10-05 14:30:26'),
('9d2cc82f-158b-48be-9382-b2416b1b8d3f', 'US', 'Agency Name', 'Agency Name', '2024-10-05 14:30:26', '2024-10-05 14:30:26'),
('9d2cc82f-1c78-4e47-b6bf-61e812e2a2ba', 'ES', 'Agency Name', 'Agency Name', '2024-10-05 14:30:26', '2024-10-05 14:30:26'),
('9d2cc82f-c555-49d9-ba22-dbae0620c407', 'US', 'Biography', 'Biography', '2024-10-05 14:30:26', '2024-10-05 14:30:26'),
('9d2cc82f-ca76-4a1c-aa63-10c79e2bdea1', 'ES', 'Biography', 'Biography', '2024-10-05 14:30:26', '2024-10-05 14:30:26'),
('9d2cc82f-ddca-4c96-9896-096a575af2ae', 'US', 'Specialties', 'Specialties', '2024-10-05 14:30:27', '2024-10-05 14:30:27'),
('9d2cc82f-e354-4de7-a162-0dfaef86b0b4', 'ES', 'Specialties', 'Specialties', '2024-10-05 14:30:27', '2024-10-05 14:30:27'),
('9d2cc830-87e9-49c6-8d72-d2116df53349', 'US', 'Languages', 'Languages', '2024-10-05 14:30:27', '2024-10-05 14:30:27'),
('9d2cc830-8d30-4e04-8ad1-85505f7505e7', 'ES', 'Languages', 'Languages', '2024-10-05 14:30:27', '2024-10-05 14:30:27'),
('9d2cc830-9f07-4fee-8371-06f65612bf15', 'US', 'Experience', 'Experience', '2024-10-05 14:30:27', '2024-10-05 14:30:27'),
('9d2cc830-a607-4aa8-ae8d-a646eb4deb42', 'ES', 'Experience', 'Experience', '2024-10-05 14:30:27', '2024-10-05 14:30:27'),
('9d2cc831-6807-4166-869b-4ff503b9e4cf', 'US', 'Contact', 'Contact', '2024-10-05 14:30:28', '2024-10-05 14:30:28'),
('9d2cc831-6e1a-4c07-b5af-94d5e0430ee8', 'ES', 'Contact', 'Contact', '2024-10-05 14:30:28', '2024-10-05 14:30:28'),
('9d2cc96c-aa60-416b-a748-559b602b9bf9', 'US', 'Agent saved successfully', 'Agent saved successfully', '2024-10-05 14:33:54', '2024-10-05 14:33:54'),
('9d2cc96c-ada1-4493-922f-51f9179d79ef', 'ES', 'Agent saved successfully', 'Agent saved successfully', '2024-10-05 14:33:54', '2024-10-05 14:33:54'),
('9d2cc9b8-38c9-4d11-8f8d-aec8a5cae88b', 'US', 'Edit Agent', 'Edit Agent', '2024-10-05 14:34:44', '2024-10-05 14:34:44'),
('9d2cc9b8-3e25-4af6-8a36-997027e93548', 'ES', 'Edit Agent', 'Edit Agent', '2024-10-05 14:34:44', '2024-10-05 14:34:44'),
('9d2ccbad-df92-44aa-ba0a-8dd3214dd581', 'US', 'Agent email', 'Agent email', '2024-10-05 14:40:12', '2024-10-05 14:40:12'),
('9d2ccbad-e6b3-443b-be29-dd7a263abdf3', 'ES', 'Agent email', 'Agent email', '2024-10-05 14:40:12', '2024-10-05 14:40:12'),
('9d2ccbb0-75cb-4caa-8411-d3c73d467603', 'US', 'Agent mail', 'Agent mail', '2024-10-05 14:40:14', '2024-10-05 14:40:14'),
('9d2ccbb0-7a2a-4c38-8f2d-c82acee19e2d', 'ES', 'Agent mail', 'Agent mail', '2024-10-05 14:40:14', '2024-10-05 14:40:14'),
('9d2ccbb1-41f5-4cf5-9225-0de7d3fa87b2', 'US', 'Agent Wmail', 'Agent Wmail', '2024-10-05 14:40:15', '2024-10-05 14:40:15'),
('9d2ccbb1-4a0f-415c-8387-902f8ea50ba5', 'ES', 'Agent Wmail', 'Agent Wmail', '2024-10-05 14:40:15', '2024-10-05 14:40:15'),
('9d2ccbb3-5d84-43d3-95fc-0eecba7619b6', 'US', 'Agent Email', 'Agent Email', '2024-10-05 14:40:16', '2024-10-05 14:40:16'),
('9d2ccbb3-6317-4864-bbce-601d4b58f909', 'ES', 'Agent Email', 'Agent Email', '2024-10-05 14:40:16', '2024-10-05 14:40:16'),
('9d2cd0a2-20aa-48f0-b242-650d1c8e4a8a', 'US', 'Agent deleted successfully.', 'Agent deleted successfully.', '2024-10-05 14:54:04', '2024-10-05 14:54:04'),
('9d2cd0a2-28e5-45a3-9944-08252f92196b', 'ES', 'Agent deleted successfully.', 'Agent deleted successfully.', '2024-10-05 14:54:04', '2024-10-05 14:54:04'),
('9d2cd40e-f03d-4152-aeab-9aeb3fac6b0c', 'US', 'Seo Updated successfully.', 'Seo Updated successfully.', '2024-10-05 15:03:38', '2024-10-05 15:03:38'),
('9d2cd40e-f657-4ea9-a641-d75a73f55b01', 'ES', 'Seo Updated successfully.', 'Seo Updated successfully.', '2024-10-05 15:03:38', '2024-10-05 15:03:38'),
('9d2cd5b2-186d-4fe0-8093-88377bb249ae', 'US', 'Record updated successfully.', 'Record updated successfully.', '2024-10-05 15:08:13', '2024-10-05 15:08:13'),
('9d2cd5b2-2025-49c4-b3a3-52a511e95c95', 'ES', 'Record updated successfully.', 'Record updated successfully.', '2024-10-05 15:08:13', '2024-10-05 15:08:13'),
('9d2dfb5d-174f-4bf1-8a02-53dad8ec2621', 'US', 'New account registered succesfully!', 'New account registered succesfully!', '2024-10-06 04:49:23', '2024-10-06 04:49:23'),
('9d2dfb5d-8f06-47f6-88d7-1ed8a4d59f26', 'ES', 'New account registered succesfully!', 'New account registered succesfully!', '2024-10-06 04:49:23', '2024-10-06 04:49:23'),
('9d2e12cf-3bb0-4793-821f-4717b1d03fbd', 'US', 'Connect', 'Connect', '2024-10-06 05:54:56', '2024-10-06 05:54:56'),
('9d2e12cf-4737-4b6a-80de-8c44e7c0bb1f', 'ES', 'Connect', 'Connect', '2024-10-06 05:54:56', '2024-10-06 05:54:56'),
('9d2e12d6-4486-4c73-86da-cbcb7b334ea6', 'US', 'Connecting', 'Connecting', '2024-10-06 05:55:00', '2024-10-06 05:55:00');
INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
('9d2e12d6-4b44-4b2c-a14e-c93518c9ed7c', 'ES', 'Connecting', 'Connecting', '2024-10-06 05:55:00', '2024-10-06 05:55:00'),
('9d2e15f2-ffdc-450b-af7e-5328fc1c6424', 'US', 'Request placed successfully agent will contact you on your registered email soon', 'Request placed successfully agent will contact you on your registered email soon', '2024-10-06 06:03:43', '2024-10-06 06:03:43'),
('9d2e15f3-0563-423f-a012-de29a763aa7a', 'ES', 'Request placed successfully agent will contact you on your registered email soon', 'Request placed successfully agent will contact you on your registered email soon', '2024-10-06 06:03:43', '2024-10-06 06:03:43'),
('9d2e5b61-a004-495d-a99c-48c9e590535b', 'US', 'Profile updated successfully', 'Profile updated successfully', '2024-10-06 09:17:51', '2024-10-06 09:17:51'),
('9d2e5b61-a71c-46ad-bb48-50481652666c', 'ES', 'Profile updated successfully', 'Profile updated successfully', '2024-10-06 09:17:51', '2024-10-06 09:17:51'),
('9d2e76d1-876b-417f-8893-68b789f4eff4', 'US', 'Blog Post saved successfully', 'Blog Post saved successfully', '2024-10-06 10:34:35', '2024-10-06 10:34:35'),
('9d2e76d1-89df-4f8e-b783-0b290d35895f', 'ES', 'Blog Post saved successfully', 'Blog Post saved successfully', '2024-10-06 10:34:35', '2024-10-06 10:34:35'),
('9d2e79a2-5d40-4360-b906-853c2f41176f', 'US', 'Edit Blog Post', 'Edit Blog Post', '2024-10-06 10:42:27', '2024-10-06 10:42:27'),
('9d2e79a2-60d7-4e06-af06-bdbb432c99fd', 'ES', 'Edit Blog Post', 'Edit Blog Post', '2024-10-06 10:42:27', '2024-10-06 10:42:27'),
('9d2e7f72-10eb-41cc-996a-d881a696ea06', 'US', 'Blog post deleted successfully.', 'Blog post deleted successfully.', '2024-10-06 10:58:42', '2024-10-06 10:58:42'),
('9d2e7f72-1347-4e8e-bec9-51c9385e41bf', 'ES', 'Blog post deleted successfully.', 'Blog post deleted successfully.', '2024-10-06 10:58:42', '2024-10-06 10:58:42'),
('9d305725-a460-4afc-ae97-7500a3c9df57', 'US', 'Latitude', 'Latitude', '2024-10-07 08:57:41', '2024-10-07 08:57:41'),
('9d305725-a463-4744-be3a-4505dda29ef3', 'US', 'Longitude', 'Longitude', '2024-10-07 08:57:41', '2024-10-07 08:57:41'),
('9d305726-49cd-42ea-8349-a759b1af0abd', 'ES', 'Longitude', 'Longitude', '2024-10-07 08:57:41', '2024-10-07 08:57:41'),
('9d305726-4a37-4359-a0c2-263f532142bb', 'ES', 'Latitude', 'Latitude', '2024-10-07 08:57:41', '2024-10-07 08:57:41'),
('9d30e5e9-fc06-45af-ac85-459b9c7eb556', 'US', 'En', 'En', '2024-10-07 15:36:54', '2024-10-07 15:36:54'),
('9d30e5ea-0035-4ce2-afe5-f4881843eae1', 'US', 'E', 'E', '2024-10-07 15:36:54', '2024-10-07 15:36:54'),
('9d30e5ec-63e3-4b82-aeca-4f1ea3de0cc0', 'ES', 'E', 'E', '2024-10-07 15:36:54', '2024-10-07 15:36:54'),
('9d30e5ec-7f1e-4300-99de-7a9021c08226', 'ES', 'En', 'En', '2024-10-07 15:36:54', '2024-10-07 15:36:54'),
('9d30e5ed-7831-4b73-be79-45ae8033692d', 'US', 'Enter an', 'Enter an', '2024-10-07 15:36:55', '2024-10-07 15:36:55'),
('9d30e5ed-79f3-41de-a9e6-c6bd184acf9e', 'US', 'Enter an a', 'Enter an a', '2024-10-07 15:36:55', '2024-10-07 15:36:55'),
('9d30e5ed-7db0-46f9-9713-f9086f18950a', 'ES', 'Enter an', 'Enter an', '2024-10-07 15:36:55', '2024-10-07 15:36:55'),
('9d30e5ed-7fc1-4cf9-866a-255ebe3353d2', 'ES', 'Enter an a', 'Enter an a', '2024-10-07 15:36:55', '2024-10-07 15:36:55'),
('9d30e5ee-55f7-4b47-8df9-e0de83c2fa6d', 'US', 'Enter an A', 'Enter an A', '2024-10-07 15:36:55', '2024-10-07 15:36:55'),
('9d30e5ee-5d75-4909-a411-990a5b45f03b', 'ES', 'Enter an A', 'Enter an A', '2024-10-07 15:36:55', '2024-10-07 15:36:55'),
('9d30e5ee-6409-475e-bde2-110f62f9c56a', 'US', 'Enter an A', 'Enter an A', '2024-10-07 15:36:55', '2024-10-07 15:36:55'),
('9d30e5ee-6993-4ecc-9acc-85fa004172ea', 'ES', 'Enter an A', 'Enter an A', '2024-10-07 15:36:55', '2024-10-07 15:36:55'),
('9d30e5ef-40e6-49be-8b15-2f9a484c01c5', 'US', 'Enter an Address,', 'Enter an Address,', '2024-10-07 15:36:56', '2024-10-07 15:36:56'),
('9d30e5ef-4943-4e91-b820-39c36ba7a893', 'ES', 'Enter an Address,', 'Enter an Address,', '2024-10-07 15:36:56', '2024-10-07 15:36:56'),
('9d30e5ef-4e3d-45df-bc0f-2b81cc500d1b', 'US', 'Enter an Address,', 'Enter an Address,', '2024-10-07 15:36:56', '2024-10-07 15:36:56'),
('9d30e5ef-8288-487d-835c-e88f8de4dd92', 'ES', 'Enter an Address,', 'Enter an Address,', '2024-10-07 15:36:56', '2024-10-07 15:36:56'),
('9d30e5f3-4ae2-4181-a0b9-70a7d7a5f69c', 'US', 'Enter an Ad', 'Enter an Ad', '2024-10-07 15:36:59', '2024-10-07 15:36:59'),
('9d30e5f3-4fc6-4db2-aaba-8fa692d971c1', 'ES', 'Enter an Ad', 'Enter an Ad', '2024-10-07 15:36:59', '2024-10-07 15:36:59'),
('9d30e5f3-9f1f-481e-ab30-b4884df4c822', 'US', 'Enter an Add', 'Enter an Add', '2024-10-07 15:36:59', '2024-10-07 15:36:59'),
('9d30e5f3-a41e-404a-a5cc-c527985385ff', 'ES', 'Enter an Add', 'Enter an Add', '2024-10-07 15:36:59', '2024-10-07 15:36:59'),
('9d30e5f4-93e9-4a5d-879b-be652fdf6ce9', 'US', 'Enter an address, neig', 'Enter an address, neig', '2024-10-07 15:37:00', '2024-10-07 15:37:00'),
('9d30e5f4-98bb-4822-bc33-47b523b81c58', 'ES', 'Enter an address, neig', 'Enter an address, neig', '2024-10-07 15:37:00', '2024-10-07 15:37:00'),
('9d30e5fa-07c7-4cdd-adb7-16a2c35f6662', 'US', 'Enter an address, neighb', 'Enter an address, neighb', '2024-10-07 15:37:03', '2024-10-07 15:37:03'),
('9d30e5fa-0ced-413b-a43b-c79795deb2e0', 'ES', 'Enter an address, neighb', 'Enter an address, neighb', '2024-10-07 15:37:03', '2024-10-07 15:37:03'),
('9d30e5fa-b7d5-47e0-9aa2-1d05bc11e3d2', 'US', 'Enter an address, neigh', 'Enter an address, neigh', '2024-10-07 15:37:04', '2024-10-07 15:37:04'),
('9d30e5fa-be86-456c-a5b0-fa58d89b7a23', 'ES', 'Enter an address, neigh', 'Enter an address, neigh', '2024-10-07 15:37:04', '2024-10-07 15:37:04'),
('9d30e5fa-ee01-4de9-851c-b01808002835', 'US', 'Enter an address, neighborh', 'Enter an address, neighborh', '2024-10-07 15:37:04', '2024-10-07 15:37:04'),
('9d30e5fa-f204-44c7-993c-01e568c7b7db', 'ES', 'Enter an address, neighborh', 'Enter an address, neighborh', '2024-10-07 15:37:04', '2024-10-07 15:37:04'),
('9d30e5fb-9c6b-4508-a345-8c8f950b4d9c', 'US', 'Enter an address, neighbo', 'Enter an address, neighbo', '2024-10-07 15:37:04', '2024-10-07 15:37:04'),
('9d30e5fb-a584-4f40-b8b3-7d303340ec56', 'ES', 'Enter an address, neighbo', 'Enter an address, neighbo', '2024-10-07 15:37:04', '2024-10-07 15:37:04'),
('9d30e5fb-b6ae-4ece-8e0f-6cb43f2f031b', 'US', 'Enter an address, neighborhoo', 'Enter an address, neighborhoo', '2024-10-07 15:37:04', '2024-10-07 15:37:04'),
('9d30e5fb-bb6c-42d3-a4dc-d01ffa0781ab', 'ES', 'Enter an address, neighborhoo', 'Enter an address, neighborhoo', '2024-10-07 15:37:04', '2024-10-07 15:37:04'),
('9d30e5fc-89a4-4f1c-973f-e28a8733f227', 'US', 'Enter an address, neighborho', 'Enter an address, neighborho', '2024-10-07 15:37:05', '2024-10-07 15:37:05'),
('9d30e5fc-8fa1-406d-9e6d-0ff2ad23dcac', 'ES', 'Enter an address, neighborho', 'Enter an address, neighborho', '2024-10-07 15:37:05', '2024-10-07 15:37:05'),
('9d30e5fc-a039-4a52-b1ad-494eab329997', 'US', 'Enter an address, neighborhoodm', 'Enter an address, neighborhoodm', '2024-10-07 15:37:05', '2024-10-07 15:37:05'),
('9d30e5fc-a498-4296-b746-8474da2afd44', 'ES', 'Enter an address, neighborhoodm', 'Enter an address, neighborhoodm', '2024-10-07 15:37:05', '2024-10-07 15:37:05'),
('9d30e5fd-0c63-4187-aae1-6dccb26a064d', 'US', 'Enter an address, neighborhood', 'Enter an address, neighborhood', '2024-10-07 15:37:05', '2024-10-07 15:37:05'),
('9d30e5fd-109a-465b-ac67-3f6804780baa', 'ES', 'Enter an address, neighborhood', 'Enter an address, neighborhood', '2024-10-07 15:37:05', '2024-10-07 15:37:05'),
('9d30e5fd-17cd-4601-880a-b843d63dc535', 'US', 'Enter an address, neighborhoodm ci', 'Enter an address, neighborhoodm ci', '2024-10-07 15:37:05', '2024-10-07 15:37:05'),
('9d30e5fd-1c92-4cb9-889d-d19fdafec5bf', 'ES', 'Enter an address, neighborhoodm ci', 'Enter an address, neighborhoodm ci', '2024-10-07 15:37:05', '2024-10-07 15:37:05'),
('9d30e5fd-823b-4062-9071-466253fedcaf', 'US', 'Enter an address, neighborhoodm city', 'Enter an address, neighborhoodm city', '2024-10-07 15:37:05', '2024-10-07 15:37:05'),
('9d30e5fd-8573-4a73-9d8d-262d250f8a94', 'ES', 'Enter an address, neighborhoodm city', 'Enter an address, neighborhoodm city', '2024-10-07 15:37:05', '2024-10-07 15:37:05'),
('9d30e5fe-3777-4ef3-a13a-32df9bb7866c', 'US', 'Enter an address, neighborhoodm cit', 'Enter an address, neighborhoodm cit', '2024-10-07 15:37:06', '2024-10-07 15:37:06'),
('9d30e5fe-3bf5-408c-b552-9a77e13460c3', 'ES', 'Enter an address, neighborhoodm cit', 'Enter an address, neighborhoodm cit', '2024-10-07 15:37:06', '2024-10-07 15:37:06'),
('9d30e600-a307-4151-ad83-8d467feb708f', 'US', 'Enter an address, neighborhoodm,', 'Enter an address, neighborhoodm,', '2024-10-07 15:37:07', '2024-10-07 15:37:07'),
('9d30e600-abe8-4f37-9777-cc6314fcf81f', 'ES', 'Enter an address, neighborhoodm,', 'Enter an address, neighborhoodm,', '2024-10-07 15:37:07', '2024-10-07 15:37:07'),
('9d30e602-84a1-4262-82e2-a43bcbf9fb51', 'US', 'Enter an address, neighborhoodm, c', 'Enter an address, neighborhoodm, c', '2024-10-07 15:37:09', '2024-10-07 15:37:09'),
('9d30e602-99aa-4463-9be9-9f7ff9ef7a87', 'ES', 'Enter an address, neighborhoodm, c', 'Enter an address, neighborhoodm, c', '2024-10-07 15:37:09', '2024-10-07 15:37:09'),
('9d30e602-9a43-4ab8-b9be-46b7f1630386', 'US', 'Enter an address, neighborhoodm, ci', 'Enter an address, neighborhoodm, ci', '2024-10-07 15:37:09', '2024-10-07 15:37:09'),
('9d30e602-9f70-421a-a787-8056882221b9', 'ES', 'Enter an address, neighborhoodm, ci', 'Enter an address, neighborhoodm, ci', '2024-10-07 15:37:09', '2024-10-07 15:37:09'),
('9d30e603-67c9-4703-b739-e96d8eff7e33', 'US', 'Enter an address, neighborhoodm, cit', 'Enter an address, neighborhoodm, cit', '2024-10-07 15:37:09', '2024-10-07 15:37:09'),
('9d30e603-6868-4ff0-b4d3-87be42584ebc', 'US', 'Enter an address, neighborhoodm, city', 'Enter an address, neighborhoodm, city', '2024-10-07 15:37:09', '2024-10-07 15:37:09'),
('9d30e603-6c1c-49b7-b183-3b6d27366684', 'ES', 'Enter an address, neighborhoodm, cit', 'Enter an address, neighborhoodm, cit', '2024-10-07 15:37:09', '2024-10-07 15:37:09'),
('9d30e603-6cc0-40af-8272-f34e3363b191', 'ES', 'Enter an address, neighborhoodm, city', 'Enter an address, neighborhoodm, city', '2024-10-07 15:37:09', '2024-10-07 15:37:09'),
('9d30e604-0efc-4248-ae95-f270812819aa', 'US', 'Enter an address, neighborhoodm, city or', 'Enter an address, neighborhoodm, city or', '2024-10-07 15:37:10', '2024-10-07 15:37:10'),
('9d30e604-126a-4dbe-8a8e-844f1cd146e3', 'ES', 'Enter an address, neighborhoodm, city or', 'Enter an address, neighborhoodm, city or', '2024-10-07 15:37:10', '2024-10-07 15:37:10'),
('9d30e604-ea56-464f-a751-de1a1b592466', 'US', 'Enter an address, neighborhoodm, city or Zi', 'Enter an address, neighborhoodm, city or Zi', '2024-10-07 15:37:10', '2024-10-07 15:37:10'),
('9d30e604-ef27-4d21-8855-7e978c6296d1', 'ES', 'Enter an address, neighborhoodm, city or Zi', 'Enter an address, neighborhoodm, city or Zi', '2024-10-07 15:37:10', '2024-10-07 15:37:10'),
('9d30e605-781a-471a-9d67-6306d37f19d8', 'US', 'Enter an address, neighborhoodm, city or Zip', 'Enter an address, neighborhoodm, city or Zip', '2024-10-07 15:37:11', '2024-10-07 15:37:11'),
('9d30e605-7c5b-4f8d-a538-a5b9bb63e7f8', 'ES', 'Enter an address, neighborhoodm, city or Zip', 'Enter an address, neighborhoodm, city or Zip', '2024-10-07 15:37:11', '2024-10-07 15:37:11'),
('9d30e606-1744-4ae7-a7b4-62ddb62f0032', 'US', 'Enter an address, neighborhoodm, city or Z', 'Enter an address, neighborhoodm, city or Z', '2024-10-07 15:37:11', '2024-10-07 15:37:11'),
('9d30e606-1bf5-49f8-8058-031fc8ff1537', 'ES', 'Enter an address, neighborhoodm, city or Z', 'Enter an address, neighborhoodm, city or Z', '2024-10-07 15:37:11', '2024-10-07 15:37:11'),
('9d30e606-9407-475a-81e6-d9da723fe2df', 'US', 'Enter an address, neighborhoodm, city or ZI', 'Enter an address, neighborhoodm, city or ZI', '2024-10-07 15:37:11', '2024-10-07 15:37:11'),
('9d30e606-9767-41fd-96c8-6a91abf252b0', 'ES', 'Enter an address, neighborhoodm, city or ZI', 'Enter an address, neighborhoodm, city or ZI', '2024-10-07 15:37:11', '2024-10-07 15:37:11'),
('9d30e606-9f94-4bba-926a-32c2ad945256', 'US', 'Enter an address, neighborhoodm, city or ZIP', 'Enter an address, neighborhoodm, city or ZIP', '2024-10-07 15:37:11', '2024-10-07 15:37:11'),
('9d30e606-a2b4-4825-916b-9fd8a14941e0', 'ES', 'Enter an address, neighborhoodm, city or ZIP', 'Enter an address, neighborhoodm, city or ZIP', '2024-10-07 15:37:11', '2024-10-07 15:37:11'),
('9d30e607-1604-43b7-8f67-6419c4438f46', 'US', 'Enter an address, neighborhoodm, city or ZIP C', 'Enter an address, neighborhoodm, city or ZIP C', '2024-10-07 15:37:12', '2024-10-07 15:37:12'),
('9d30e607-190a-4c49-81b6-68670104dda2', 'ES', 'Enter an address, neighborhoodm, city or ZIP C', 'Enter an address, neighborhoodm, city or ZIP C', '2024-10-07 15:37:12', '2024-10-07 15:37:12'),
('9d30e608-f5a4-4875-929b-acac96724c5f', 'US', 'Enter an address, neighborhoodm, city or ZIP c', 'Enter an address, neighborhoodm, city or ZIP c', '2024-10-07 15:37:13', '2024-10-07 15:37:13'),
('9d30e608-fa3c-4bb9-8e5a-15cfbfbb444f', 'ES', 'Enter an address, neighborhoodm, city or ZIP c', 'Enter an address, neighborhoodm, city or ZIP c', '2024-10-07 15:37:13', '2024-10-07 15:37:13'),
('9d30e609-67d5-4f20-8308-d701787cbe4d', 'US', 'Enter an address, neighborhoodm, city or ZIP cod', 'Enter an address, neighborhoodm, city or ZIP cod', '2024-10-07 15:37:13', '2024-10-07 15:37:13'),
('9d30e609-6ff9-4193-8d13-678f43afb4cc', 'ES', 'Enter an address, neighborhoodm, city or ZIP cod', 'Enter an address, neighborhoodm, city or ZIP cod', '2024-10-07 15:37:13', '2024-10-07 15:37:13'),
('9d30e60a-34c0-4d2e-b4f6-ee1ca6fa1774', 'US', 'Enter an address, neighborhoodm, city or ZIP code', 'Enter an address, neighborhoodm, city or ZIP code', '2024-10-07 15:37:14', '2024-10-07 15:37:14'),
('9d30e60a-3c4e-434d-931d-3ca29b31035c', 'ES', 'Enter an address, neighborhoodm, city or ZIP code', 'Enter an address, neighborhoodm, city or ZIP code', '2024-10-07 15:37:14', '2024-10-07 15:37:14'),
('9d30eb93-f271-416c-862e-a911e772f68f', 'US', 'Enter an address, city or ZIP code', 'Enter an address, city or ZIP code', '2024-10-07 15:52:43', '2024-10-07 15:52:43'),
('9d30eb94-03fd-49c4-a4f6-263dcd5d84b0', 'ES', 'Enter an address, city or ZIP code', 'Enter an address, city or ZIP code', '2024-10-07 15:52:43', '2024-10-07 15:52:43'),
('9d32e211-f44f-43f4-a137-7993cd4117fa', 'US', 'S by Community', 'S by Community', '2024-10-08 15:17:48', '2024-10-08 15:17:48'),
('9d32e211-f453-45ab-b868-586f8a032a32', 'US', 'So by Community', 'So by Community', '2024-10-08 15:17:48', '2024-10-08 15:17:48'),
('9d32e213-1b57-4e9d-8c90-dd922da4910d', 'ES', 'S by Community', 'S by Community', '2024-10-08 15:17:48', '2024-10-08 15:17:48'),
('9d32e213-1b76-4b62-a9c8-9e6e4c80b831', 'ES', 'So by Community', 'So by Community', '2024-10-08 15:17:48', '2024-10-08 15:17:48'),
('9d32e213-964e-436e-af52-3fc4a20b0e44', 'US', 'Sort by Community', 'Sort by Community', '2024-10-08 15:17:48', '2024-10-08 15:17:48'),
('9d32e213-968a-426e-98e5-d36cc58822fc', 'US', 'Sor by Community', 'Sor by Community', '2024-10-08 15:17:48', '2024-10-08 15:17:48'),
('9d32e213-9b77-4cfe-b6b4-34e28b3b9e34', 'ES', 'Sort by Community', 'Sort by Community', '2024-10-08 15:17:48', '2024-10-08 15:17:48'),
('9d32e213-9bf9-4eaf-8aac-67b6f00475de', 'ES', 'Sor by Community', 'Sor by Community', '2024-10-08 15:17:48', '2024-10-08 15:17:48'),
('9d32e215-84f3-47a4-8d32-719cffc265cc', 'US', 'Sort by', 'Sort by', '2024-10-08 15:17:49', '2024-10-08 15:17:49'),
('9d32e215-8bc5-48cd-b75a-b2b8fbc63a24', 'ES', 'Sort by', 'Sort by', '2024-10-08 15:17:49', '2024-10-08 15:17:49'),
('9d32e216-2605-4067-a75a-a27de0a7ce1b', 'US', 'Sort', 'Sort', '2024-10-08 15:17:50', '2024-10-08 15:17:50'),
('9d32e216-29c7-4f6e-b351-0c5fd99d5781', 'ES', 'Sort', 'Sort', '2024-10-08 15:17:50', '2024-10-08 15:17:50'),
('9d3fb54f-f57f-4fe0-ade9-0ff178df71c3', 'US', 'Loc', 'Loc', '2024-10-15 00:18:24', '2024-10-15 00:18:24'),
('9d3fb54f-f581-411b-84bd-1cb45878b42b', 'US', 'Lo', 'Lo', '2024-10-15 00:18:24', '2024-10-15 00:18:24'),
('9d3fb551-0944-4b3a-8797-e74eee058f22', 'ES', 'Loc', 'Loc', '2024-10-15 00:18:24', '2024-10-15 00:18:24'),
('9d3fb551-096b-4db9-9b19-65f821e49144', 'ES', 'Lo', 'Lo', '2024-10-15 00:18:24', '2024-10-15 00:18:24'),
('9d3fb551-7ae1-406a-b0cf-810910f9786f', 'US', 'Locati', 'Locati', '2024-10-15 00:18:25', '2024-10-15 00:18:25'),
('9d3fb551-7bc0-4cd0-9941-a7b967aaedcf', 'US', 'Locatio', 'Locatio', '2024-10-15 00:18:25', '2024-10-15 00:18:25'),
('9d3fb551-7f20-4093-8209-f3737949c2b4', 'ES', 'Locatio', 'Locatio', '2024-10-15 00:18:25', '2024-10-15 00:18:25'),
('9d3fb551-7f54-46e7-ad6f-30e9131445f2', 'ES', 'Locati', 'Locati', '2024-10-15 00:18:25', '2024-10-15 00:18:25'),
('9d3fb66e-8bfe-41ef-a390-64d8b91f96cf', 'US', 'SLocation', 'SLocation', '2024-10-15 00:21:31', '2024-10-15 00:21:31'),
('9d3fb66e-90c2-4fa2-a50b-ac1f208b1a15', 'ES', 'SLocation', 'SLocation', '2024-10-15 00:21:31', '2024-10-15 00:21:31'),
('9d3fb66f-5ef7-4674-8ec2-571d6a238066', 'US', 'SeLocation', 'SeLocation', '2024-10-15 00:21:32', '2024-10-15 00:21:32'),
('9d3fb66f-6383-4840-aa7d-89a65d8e3850', 'ES', 'SeLocation', 'SeLocation', '2024-10-15 00:21:32', '2024-10-15 00:21:32'),
('9d3fb66f-8174-4aa4-8f46-9e46d2218fa7', 'US', 'SeaLocation', 'SeaLocation', '2024-10-15 00:21:32', '2024-10-15 00:21:32'),
('9d3fb66f-84ab-4b8b-89e2-7bae6a0a2794', 'ES', 'SeaLocation', 'SeaLocation', '2024-10-15 00:21:32', '2024-10-15 00:21:32'),
('9d3fb66f-dcaa-48d0-94df-48c758c445ba', 'US', 'SearLocation', 'SearLocation', '2024-10-15 00:21:32', '2024-10-15 00:21:32'),
('9d3fb66f-e28a-4aa6-8659-f350f523e407', 'ES', 'SearLocation', 'SearLocation', '2024-10-15 00:21:32', '2024-10-15 00:21:32'),
('9d3fb66f-f578-48de-bd49-a43a578e039a', 'US', 'SearchLocation', 'SearchLocation', '2024-10-15 00:21:32', '2024-10-15 00:21:32'),
('9d3fb66f-f939-4340-b45a-db3446276c84', 'ES', 'SearchLocation', 'SearchLocation', '2024-10-15 00:21:32', '2024-10-15 00:21:32'),
('9d3fb670-698b-4c8c-9708-3e173b2b7e0c', 'US', 'Search Location', 'Search Location', '2024-10-15 00:21:33', '2024-10-15 00:21:33'),
('9d3fb670-6caf-46a7-b1bc-bf7ee08ba3d5', 'ES', 'Search Location', 'Search Location', '2024-10-15 00:21:33', '2024-10-15 00:21:33'),
('9d3fb674-8490-48ae-8370-948cab93766d', 'US', 'Search ocation', 'Search ocation', '2024-10-15 00:21:35', '2024-10-15 00:21:35'),
('9d3fb674-8ad2-4461-b0bd-83510d29443d', 'ES', 'Search ocation', 'Search ocation', '2024-10-15 00:21:35', '2024-10-15 00:21:35'),
('9d3fb675-277c-46e4-a9ab-896832d35e1d', 'US', 'Search location', 'Search location', '2024-10-15 00:21:36', '2024-10-15 00:21:36'),
('9d3fb675-2b6e-476e-9cdd-298d713e90ce', 'ES', 'Search location', 'Search location', '2024-10-15 00:21:36', '2024-10-15 00:21:36'),
('9d3fb679-1abf-4f90-a863-f4b446117888', 'US', 'SearcLocation', 'SearcLocation', '2024-10-15 00:21:38', '2024-10-15 00:21:38'),
('9d3fb679-2185-4448-aff5-cf5ff33780a3', 'ES', 'SearcLocation', 'SearcLocation', '2024-10-15 00:21:38', '2024-10-15 00:21:38'),
('9d3fd15e-cce0-499e-b3f1-025f40e6ed33', 'US', 'DROP US A LINE A', 'DROP US A LINE A', '2024-10-15 01:36:51', '2024-10-15 01:36:51'),
('9d3fd15e-d714-427a-b3d6-a3b35b3ba631', 'ES', 'DROP US A LINE A', 'DROP US A LINE A', '2024-10-15 01:36:51', '2024-10-15 01:36:51'),
('9d3fd15f-09ba-4c06-90f6-4a37f7c238f3', 'US', 'DROP US A LINE AS', 'DROP US A LINE AS', '2024-10-15 01:36:51', '2024-10-15 01:36:51'),
('9d3fd15f-10f6-4cf4-b065-c4d625f33007', 'ES', 'DROP US A LINE AS', 'DROP US A LINE AS', '2024-10-15 01:36:51', '2024-10-15 01:36:51'),
('9d3fd160-1936-49ce-8f26-b4fa19f38d8c', 'US', 'DROP US A LINE AS A', 'DROP US A LINE AS A', '2024-10-15 01:36:52', '2024-10-15 01:36:52'),
('9d3fd160-1ef8-42a3-b6bc-f53e7be9e605', 'ES', 'DROP US A LINE AS A', 'DROP US A LINE AS A', '2024-10-15 01:36:52', '2024-10-15 01:36:52'),
('9d3fd160-a79b-450b-900e-e405dd523aeb', 'US', 'DROP US A LINE AS AM', 'DROP US A LINE AS AM', '2024-10-15 01:36:52', '2024-10-15 01:36:52'),
('9d3fd160-b5ee-4a21-b4a7-ac920e2465eb', 'ES', 'DROP US A LINE AS AM', 'DROP US A LINE AS AM', '2024-10-15 01:36:52', '2024-10-15 01:36:52'),
('9d3fd160-f019-43a9-8440-b78e98117a4e', 'US', 'DROP US A LINE AS AM AG', 'DROP US A LINE AS AM AG', '2024-10-15 01:36:52', '2024-10-15 01:36:52'),
('9d3fd160-f7f3-4b1c-8bd8-ab629fa62086', 'ES', 'DROP US A LINE AS AM AG', 'DROP US A LINE AS AM AG', '2024-10-15 01:36:52', '2024-10-15 01:36:52'),
('9d3fd162-42f1-47dd-bca0-53d597561012', 'US', 'DROP US A LINE AS AM AGEMT', 'DROP US A LINE AS AM AGEMT', '2024-10-15 01:36:53', '2024-10-15 01:36:53'),
('9d3fd162-4904-45a2-89ee-f940571c60ca', 'ES', 'DROP US A LINE AS AM AGEMT', 'DROP US A LINE AS AM AGEMT', '2024-10-15 01:36:53', '2024-10-15 01:36:53'),
('9d3fd163-7a77-4797-acb9-cfb708995d38', 'US', 'DROP US A LINE AS AM AGEM', 'DROP US A LINE AS AM AGEM', '2024-10-15 01:36:54', '2024-10-15 01:36:54'),
('9d3fd163-7dad-4eaf-bfdf-49795d717924', 'ES', 'DROP US A LINE AS AM AGEM', 'DROP US A LINE AS AM AGEM', '2024-10-15 01:36:54', '2024-10-15 01:36:54'),
('9d3fd163-cb58-4916-a9dd-c257e1b91b0a', 'US', 'DROP US A LINE AS AM AGE', 'DROP US A LINE AS AM AGE', '2024-10-15 01:36:54', '2024-10-15 01:36:54'),
('9d3fd163-ce36-4038-a38a-83956bc369f5', 'ES', 'DROP US A LINE AS AM AGE', 'DROP US A LINE AS AM AGE', '2024-10-15 01:36:54', '2024-10-15 01:36:54'),
('9d3fd164-a5f7-4240-9dde-d44b6ad21882', 'US', 'DROP US A LINE AS AM A', 'DROP US A LINE AS AM A', '2024-10-15 01:36:55', '2024-10-15 01:36:55'),
('9d3fd164-ac9a-4f45-8a4a-d652bb89ce3e', 'ES', 'DROP US A LINE AS AM A', 'DROP US A LINE AS AM A', '2024-10-15 01:36:55', '2024-10-15 01:36:55'),
('9d3fd16a-69c6-4134-8a26-6c19c0ca0f7b', 'US', 'DROP US A LINE AS AM AGEN', 'DROP US A LINE AS AM AGEN', '2024-10-15 01:36:59', '2024-10-15 01:36:59'),
('9d3fd16a-6dee-4569-aeb1-88383583203f', 'ES', 'DROP US A LINE AS AM AGEN', 'DROP US A LINE AS AM AGEN', '2024-10-15 01:36:59', '2024-10-15 01:36:59'),
('9d3fd16a-8503-4eb9-9314-da863b60f4ba', 'US', 'DROP US A LINE AS AM AGENT', 'DROP US A LINE AS AM AGENT', '2024-10-15 01:36:59', '2024-10-15 01:36:59'),
('9d3fd16a-8985-4232-a19a-4f265b4fe1d7', 'ES', 'DROP US A LINE AS AM AGENT', 'DROP US A LINE AS AM AGENT', '2024-10-15 01:36:59', '2024-10-15 01:36:59'),
('9d3fd16b-c988-4984-b69d-fa3c0594ad04', 'US', 'DROP US A LINE AS AM AGEE', 'DROP US A LINE AS AM AGEE', '2024-10-15 01:37:00', '2024-10-15 01:37:00'),
('9d3fd16b-ce29-4e16-99d0-343f9962740a', 'ES', 'DROP US A LINE AS AM AGEE', 'DROP US A LINE AS AM AGEE', '2024-10-15 01:37:00', '2024-10-15 01:37:00'),
('9d3fd16b-f508-46fc-84e6-b381874a1792', 'US', 'DROP US A LINE AS AM AGEEN', 'DROP US A LINE AS AM AGEEN', '2024-10-15 01:37:00', '2024-10-15 01:37:00'),
('9d3fd16b-f943-45e6-a545-3d636aba91de', 'ES', 'DROP US A LINE AS AM AGEEN', 'DROP US A LINE AS AM AGEEN', '2024-10-15 01:37:00', '2024-10-15 01:37:00'),
('9d3fd170-6cfd-472d-8ef7-ddef521814e2', 'US', 'DROP US A LINE AS A AGENT', 'DROP US A LINE AS A AGENT', '2024-10-15 01:37:03', '2024-10-15 01:37:03'),
('9d3fd170-7165-4cb2-aca3-6660daab35fe', 'ES', 'DROP US A LINE AS A AGENT', 'DROP US A LINE AS A AGENT', '2024-10-15 01:37:03', '2024-10-15 01:37:03'),
('9d3fd171-abcd-4771-ac7d-c71c80c7a2af', 'US', 'DROP US A LINE AS AN AGENT', 'DROP US A LINE AS AN AGENT', '2024-10-15 01:37:03', '2024-10-15 01:37:03'),
('9d3fd171-b13b-4b00-9b84-9ca99dbf714f', 'ES', 'DROP US A LINE AS AN AGENT', 'DROP US A LINE AS AN AGENT', '2024-10-15 01:37:03', '2024-10-15 01:37:03'),
('9d3fd175-b69f-4861-aa17-ccef11cf0967', 'US', 'DROP US A LINE A C', 'DROP US A LINE A C', '2024-10-15 01:37:06', '2024-10-15 01:37:06'),
('9d3fd175-c0ba-4b73-96e9-e2e5029be951', 'ES', 'DROP US A LINE A C', 'DROP US A LINE A C', '2024-10-15 01:37:06', '2024-10-15 01:37:06'),
('9d3fd176-9c99-4b1a-a045-e3b014d89fca', 'US', 'DROP US A LINE A CI', 'DROP US A LINE A CI', '2024-10-15 01:37:07', '2024-10-15 01:37:07'),
('9d3fd176-a074-4573-a524-860abbef0521', 'ES', 'DROP US A LINE A CI', 'DROP US A LINE A CI', '2024-10-15 01:37:07', '2024-10-15 01:37:07'),
('9d3fd177-1b1f-4902-b5f4-547889b2de14', 'US', 'DROP US A LINE A CIS', 'DROP US A LINE A CIS', '2024-10-15 01:37:07', '2024-10-15 01:37:07'),
('9d3fd177-2103-47df-bdc6-c77fc1eabd74', 'ES', 'DROP US A LINE A CIS', 'DROP US A LINE A CIS', '2024-10-15 01:37:07', '2024-10-15 01:37:07'),
('9d3fd177-c274-47c8-8fdd-78d977e15f7c', 'US', 'DROP US A LINE A CIST', 'DROP US A LINE A CIST', '2024-10-15 01:37:07', '2024-10-15 01:37:07'),
('9d3fd177-c8e7-4ba4-a320-e049acd51efc', 'ES', 'DROP US A LINE A CIST', 'DROP US A LINE A CIST', '2024-10-15 01:37:07', '2024-10-15 01:37:07'),
('9d3fd178-8f6d-44d9-8cbe-cbc201a10ca1', 'US', 'DROP US A LINE A CISTO', 'DROP US A LINE A CISTO', '2024-10-15 01:37:08', '2024-10-15 01:37:08'),
('9d3fd178-95ec-480e-94bb-de7ffc97b15f', 'ES', 'DROP US A LINE A CISTO', 'DROP US A LINE A CISTO', '2024-10-15 01:37:08', '2024-10-15 01:37:08'),
('9d3fd17b-ab36-41db-801f-3d3ae5e8ec26', 'US', 'DROP US A LINE A CU', 'DROP US A LINE A CU', '2024-10-15 01:37:10', '2024-10-15 01:37:10'),
('9d3fd17b-ae45-4ace-886b-85c3cd99552c', 'ES', 'DROP US A LINE A CU', 'DROP US A LINE A CU', '2024-10-15 01:37:10', '2024-10-15 01:37:10'),
('9d3fd17c-1736-49d3-97fa-40cea5a64ee3', 'US', 'DROP US A LINE A CUS', 'DROP US A LINE A CUS', '2024-10-15 01:37:10', '2024-10-15 01:37:10'),
('9d3fd17c-1a84-45ac-8418-999a8679b553', 'ES', 'DROP US A LINE A CUS', 'DROP US A LINE A CUS', '2024-10-15 01:37:10', '2024-10-15 01:37:10'),
('9d3fd17c-783b-42fc-82ae-b034f4990fac', 'US', 'DROP US A LINE A CUST', 'DROP US A LINE A CUST', '2024-10-15 01:37:10', '2024-10-15 01:37:10'),
('9d3fd17c-7c7e-4189-86e3-8f752071b64b', 'ES', 'DROP US A LINE A CUST', 'DROP US A LINE A CUST', '2024-10-15 01:37:10', '2024-10-15 01:37:10'),
('9d3fd17c-e453-4bc7-a6cf-a4627af865c9', 'US', 'DROP US A LINE A CUSTOME', 'DROP US A LINE A CUSTOME', '2024-10-15 01:37:11', '2024-10-15 01:37:11'),
('9d3fd17c-e850-42e6-b61b-61c88d692819', 'ES', 'DROP US A LINE A CUSTOME', 'DROP US A LINE A CUSTOME', '2024-10-15 01:37:11', '2024-10-15 01:37:11'),
('9d3fd17d-9813-4e44-8aed-3edb68c3cd73', 'US', 'DROP US A LINE A CUSTOMER', 'DROP US A LINE A CUSTOMER', '2024-10-15 01:37:11', '2024-10-15 01:37:11'),
('9d3fd17d-9ce2-46ab-8d5f-d42cccb32893', 'ES', 'DROP US A LINE A CUSTOMER', 'DROP US A LINE A CUSTOMER', '2024-10-15 01:37:11', '2024-10-15 01:37:11'),
('9d3fd82d-7ff9-4b51-a9a3-57d69fc11a85', 'US', 'message', 'message', '2024-10-15 01:55:53', '2024-10-15 01:55:53'),
('9d3fd82d-88a5-4ca4-ae79-7cca662df878', 'ES', 'message', 'message', '2024-10-15 01:55:53', '2024-10-15 01:55:53'),
('9d3fd85d-4653-4252-8319-93df4e11bacb', 'US', 'C message', 'C message', '2024-10-15 01:56:24', '2024-10-15 01:56:24'),
('9d3fd85d-4afe-4b39-a723-5f9362b0581e', 'ES', 'C message', 'C message', '2024-10-15 01:56:24', '2024-10-15 01:56:24'),
('9d3fd85e-6478-4a75-bb2d-0ffb56e11252', 'US', 'Cu message', 'Cu message', '2024-10-15 01:56:25', '2024-10-15 01:56:25'),
('9d3fd85e-6bef-44fa-926c-2de97e64eeaf', 'ES', 'Cu message', 'Cu message', '2024-10-15 01:56:25', '2024-10-15 01:56:25'),
('9d3fd85e-9b7a-4a2d-8206-27dcb1139fb7', 'US', 'Cus message', 'Cus message', '2024-10-15 01:56:25', '2024-10-15 01:56:25'),
('9d3fd85e-a823-4d78-9de2-8b6e51fec092', 'ES', 'Cus message', 'Cus message', '2024-10-15 01:56:25', '2024-10-15 01:56:25'),
('9d3fd85f-2a7e-4bc4-bfca-ee97e2f0f9b6', 'US', 'Cust message', 'Cust message', '2024-10-15 01:56:26', '2024-10-15 01:56:26'),
('9d3fd85f-2f21-41f7-a1c6-872d048d4fdc', 'ES', 'Cust message', 'Cust message', '2024-10-15 01:56:26', '2024-10-15 01:56:26'),
('9d3fd85f-62f2-4d5c-8a1c-b1e1183a401b', 'US', 'Custe message', 'Custe message', '2024-10-15 01:56:26', '2024-10-15 01:56:26'),
('9d3fd85f-6728-4599-9d42-afa66004b64a', 'ES', 'Custe message', 'Custe message', '2024-10-15 01:56:26', '2024-10-15 01:56:26'),
('9d3fd85f-fe28-41a8-9741-999e6a5185fa', 'US', 'Custeom message', 'Custeom message', '2024-10-15 01:56:26', '2024-10-15 01:56:26'),
('9d3fd860-0292-45bd-a0a7-e54656d3c2bd', 'ES', 'Custeom message', 'Custeom message', '2024-10-15 01:56:26', '2024-10-15 01:56:26'),
('9d3fd860-251b-4296-a735-3292dd363ab6', 'US', 'Custeo message', 'Custeo message', '2024-10-15 01:56:26', '2024-10-15 01:56:26'),
('9d3fd860-2b7d-4f03-a75a-e25ce6e40c2b', 'ES', 'Custeo message', 'Custeo message', '2024-10-15 01:56:26', '2024-10-15 01:56:26'),
('9d3fd862-25df-4ba2-b066-1f08af754c40', 'US', 'Custm message', 'Custm message', '2024-10-15 01:56:28', '2024-10-15 01:56:28'),
('9d3fd862-2977-4265-85a5-54730501c60f', 'ES', 'Custm message', 'Custm message', '2024-10-15 01:56:28', '2024-10-15 01:56:28'),
('9d3fd862-a2c5-4675-a8ba-a59e757a2fc2', 'US', 'Custom message', 'Custom message', '2024-10-15 01:56:28', '2024-10-15 01:56:28'),
('9d3fd862-a378-497a-b135-ff7fdf37b608', 'US', 'Custom message', 'Custom message', '2024-10-15 01:56:28', '2024-10-15 01:56:28'),
('9d3fd862-a800-472a-8fd5-bc391af07dd8', 'ES', 'Custom message', 'Custom message', '2024-10-15 01:56:28', '2024-10-15 01:56:28'),
('9d3fd862-a850-4c23-86b1-4812596d642a', 'ES', 'Custom message', 'Custom message', '2024-10-15 01:56:28', '2024-10-15 01:56:28'),
('9d3fd863-1fa1-41a8-ba51-da4e4584a6e0', 'US', 'Customer message', 'Customer message', '2024-10-15 01:56:28', '2024-10-15 01:56:28'),
('9d3fd863-2404-4621-a06e-3927163b4e85', 'ES', 'Customer message', 'Customer message', '2024-10-15 01:56:28', '2024-10-15 01:56:28'),
('9d3fda0e-1801-4afa-9d46-3445154155a9', 'US', 'R', 'R', '2024-10-15 02:01:08', '2024-10-15 02:01:08'),
('9d3fda0e-1cc4-4ae5-883c-c944b8edbe4d', 'ES', 'R', 'R', '2024-10-15 02:01:08', '2024-10-15 02:01:08'),
('9d3fda0e-9b00-4974-84db-fce80675fd63', 'US', 'Re', 'Re', '2024-10-15 02:01:08', '2024-10-15 02:01:08'),
('9d3fda0e-a080-4ff7-b142-c4505d508b3d', 'ES', 'Re', 'Re', '2024-10-15 02:01:08', '2024-10-15 02:01:08'),
('9d3fda0e-d245-4ab7-8d9a-8ff6866fc721', 'US', 'Rep', 'Rep', '2024-10-15 02:01:09', '2024-10-15 02:01:09'),
('9d3fda0e-d549-4d3f-bc00-5e23c6f10629', 'ES', 'Rep', 'Rep', '2024-10-15 02:01:09', '2024-10-15 02:01:09'),
('9d3fda0f-202b-478d-9fcb-4172b75937d4', 'US', 'Repl', 'Repl', '2024-10-15 02:01:09', '2024-10-15 02:01:09'),
('9d3fda0f-2453-44e7-abff-ddf5f250bf4f', 'ES', 'Repl', 'Repl', '2024-10-15 02:01:09', '2024-10-15 02:01:09'),
('9d3fde41-ef96-458e-a97c-5e482dc1f867', 'US', 'Contract', 'Contract', '2024-10-15 02:12:53', '2024-10-15 02:12:53'),
('9d3fde41-f499-426c-bf3c-c5fe900dfd04', 'ES', 'Contract', 'Contract', '2024-10-15 02:12:53', '2024-10-15 02:12:53'),
('9d3fde41-f8e6-429f-8d4f-00484b58509c', 'US', 'Contract', 'Contract', '2024-10-15 02:12:53', '2024-10-15 02:12:53'),
('9d3fde41-fbd3-40ac-be08-46f43c0f1885', 'ES', 'Contract', 'Contract', '2024-10-15 02:12:53', '2024-10-15 02:12:53'),
('9d3fe1b6-01f4-4e8e-8cda-bca42996559e', 'US', 'Select Contract Type', 'Select Contract Type', '2024-10-15 02:22:33', '2024-10-15 02:22:33'),
('9d3fe1b6-0ce0-431c-a299-8324fb61b021', 'ES', 'Select Contract Type', 'Select Contract Type', '2024-10-15 02:22:33', '2024-10-15 02:22:33'),
('9d3fe1b7-2396-414b-840d-7c454cc82097', 'US', 'Multiple', 'Multiple', '2024-10-15 02:22:33', '2024-10-15 02:22:33'),
('9d3fe1b7-2bc0-4bc0-baa4-4791bb67f702', 'US', 'Single', 'Single', '2024-10-15 02:22:33', '2024-10-15 02:22:33'),
('9d3fe1b7-2ccd-44e2-baf8-3d304891c076', 'ES', 'Multiple', 'Multiple', '2024-10-15 02:22:33', '2024-10-15 02:22:33'),
('9d3fe1b7-33d8-433a-8e6f-93cd1d60ec44', 'ES', 'Single', 'Single', '2024-10-15 02:22:33', '2024-10-15 02:22:33'),
('9d3fe1b7-daef-4f7d-965d-e0f46f27f9b5', 'US', 'Download the single contract PDF here:', 'Download the single contract PDF here:', '2024-10-15 02:22:34', '2024-10-15 02:22:34'),
('9d3fe1b7-df68-4940-8ed0-c6a69ec7e3c6', 'ES', 'Download the single contract PDF here:', 'Download the single contract PDF here:', '2024-10-15 02:22:34', '2024-10-15 02:22:34'),
('9d3fe1b7-e04e-4919-8bf5-f6900460651c', 'US', 'Single Contract', 'Single Contract', '2024-10-15 02:22:34', '2024-10-15 02:22:34'),
('9d3fe1b7-e4ed-4142-a8b6-0ac380b94a4f', 'ES', 'Single Contract', 'Single Contract', '2024-10-15 02:22:34', '2024-10-15 02:22:34'),
('9d3fe1b8-6c98-4774-8a98-b08234bc413e', 'US', 'Download the multiple contract PDF here:', 'Download the multiple contract PDF here:', '2024-10-15 02:22:34', '2024-10-15 02:22:34'),
('9d3fe1b8-721b-4fd6-9fc1-ef24ee067f31', 'ES', 'Download the multiple contract PDF here:', 'Download the multiple contract PDF here:', '2024-10-15 02:22:34', '2024-10-15 02:22:34'),
('9d3fe1b8-7bf9-4d68-9a94-7fcd19976f47', 'US', 'Multiple Contracts', 'Multiple Contracts', '2024-10-15 02:22:34', '2024-10-15 02:22:34'),
('9d3fe1b8-8101-4a7a-8bbc-14b8bc07937b', 'ES', 'Multiple Contracts', 'Multiple Contracts', '2024-10-15 02:22:34', '2024-10-15 02:22:34'),
('9d3fe1b9-30b9-4ce1-8c37-23e5591501e8', 'US', 'I agree to the terms and conditions', 'I agree to the terms and conditions', '2024-10-15 02:22:35', '2024-10-15 02:22:35'),
('9d3fe1b9-364d-4277-bb18-7cd4790dba0e', 'ES', 'I agree to the terms and conditions', 'I agree to the terms and conditions', '2024-10-15 02:22:35', '2024-10-15 02:22:35'),
('9d3fe202-95aa-4bf3-a572-6cd0826d57ea', 'US', 'Request placed successfully agent will contact you soon.', 'Request placed successfully agent will contact you soon.', '2024-10-15 02:23:23', '2024-10-15 02:23:23'),
('9d3fe202-97f3-497e-a715-0ffdcfb5f50f', 'ES', 'Request placed successfully agent will contact you soon.', 'Request placed successfully agent will contact you soon.', '2024-10-15 02:23:23', '2024-10-15 02:23:23'),
('9d3fe817-fa44-4ba5-b645-df28f7c8d357', 'US', 'Ag', 'Ag', '2024-10-15 02:40:23', '2024-10-15 02:40:23'),
('9d3fe817-ffed-4064-81a2-a1e8caeb698b', 'ES', 'Ag', 'Ag', '2024-10-15 02:40:23', '2024-10-15 02:40:23'),
('9d3fe819-7c51-467e-b142-5931e163c59b', 'US', 'Agr', 'Agr', '2024-10-15 02:40:24', '2024-10-15 02:40:24'),
('9d3fe819-8325-4049-acda-fc38c626d00f', 'ES', 'Agr', 'Agr', '2024-10-15 02:40:24', '2024-10-15 02:40:24'),
('9d3fe819-af51-46b5-8417-0bcc42993cc8', 'US', 'Agre', 'Agre', '2024-10-15 02:40:24', '2024-10-15 02:40:24'),
('9d3fe819-b3ad-4b1c-88b3-3e168e59a2a5', 'ES', 'Agre', 'Agre', '2024-10-15 02:40:24', '2024-10-15 02:40:24'),
('9d3fe81a-0719-4000-ad67-30dfe89f8a6d', 'US', 'Agree', 'Agree', '2024-10-15 02:40:25', '2024-10-15 02:40:25'),
('9d3fe81a-099a-4444-834c-b6c8abbc46dd', 'ES', 'Agree', 'Agree', '2024-10-15 02:40:25', '2024-10-15 02:40:25'),
('9d3fe81a-1302-4d2a-998c-2ab2c62f9972', 'US', 'Agreed', 'Agreed', '2024-10-15 02:40:25', '2024-10-15 02:40:25'),
('9d3fe81a-156e-4f1d-8523-b6b0a6c7a7d5', 'ES', 'Agreed', 'Agreed', '2024-10-15 02:40:25', '2024-10-15 02:40:25'),
('9d400c4a-efc4-4d59-ac1f-c3a2608f44b1', 'US', 'U', 'U', '2024-10-15 04:21:37', '2024-10-15 04:21:37'),
('9d400c4a-fa9f-4ce1-9535-922a94e649ab', 'ES', 'U', 'U', '2024-10-15 04:21:37', '2024-10-15 04:21:37'),
('9d400c4b-631f-4228-869d-45318cd231a3', 'US', 'Us', 'Us', '2024-10-15 04:21:37', '2024-10-15 04:21:37'),
('9d400c4b-686d-4e2a-8471-09ac5dcc83b7', 'ES', 'Us', 'Us', '2024-10-15 04:21:37', '2024-10-15 04:21:37'),
('9d400c4b-b873-4043-82c2-ecc2c38f70ad', 'US', 'Using', 'Using', '2024-10-15 04:21:37', '2024-10-15 04:21:37'),
('9d400c4b-bb84-4cf7-9c4c-6de32632f189', 'ES', 'Using', 'Using', '2024-10-15 04:21:37', '2024-10-15 04:21:37'),
('9d400c4c-ddb7-4281-860d-3e78970f96ba', 'US', 'Using l', 'Using l', '2024-10-15 04:21:38', '2024-10-15 04:21:38'),
('9d400c4c-e3ac-405a-9833-eb6292c49745', 'ES', 'Using l', 'Using l', '2024-10-15 04:21:38', '2024-10-15 04:21:38'),
('9d400c4d-70d6-431a-a400-b9238cbfdebc', 'US', 'Using loc', 'Using loc', '2024-10-15 04:21:38', '2024-10-15 04:21:38'),
('9d400c4d-7547-49d4-9b12-4fc99d27cfaf', 'ES', 'Using loc', 'Using loc', '2024-10-15 04:21:38', '2024-10-15 04:21:38'),
('9d400c4d-de99-43ec-bb0c-6c9494c470d7', 'US', 'Using locati', 'Using locati', '2024-10-15 04:21:38', '2024-10-15 04:21:38'),
('9d400c4d-e33e-46f2-afa0-0195945f3de7', 'ES', 'Using locati', 'Using locati', '2024-10-15 04:21:38', '2024-10-15 04:21:38'),
('9d400c4e-8f00-42ff-ab13-c66b2f8182b4', 'US', 'Using location', 'Using location', '2024-10-15 04:21:39', '2024-10-15 04:21:39'),
('9d400c4e-9384-4e1f-9a97-058393f784de', 'ES', 'Using location', 'Using location', '2024-10-15 04:21:39', '2024-10-15 04:21:39'),
('9d400c64-320d-4ec9-9fc5-b87a1e7883fb', 'US', 'Using locatio', 'Using locatio', '2024-10-15 04:21:53', '2024-10-15 04:21:53'),
('9d400c64-3503-4d16-8986-0bd2cd61f999', 'ES', 'Using locatio', 'Using locatio', '2024-10-15 04:21:53', '2024-10-15 04:21:53'),
('9d400c65-91a9-4d65-8221-da82a73af93b', 'US', 'Using locat', 'Using locat', '2024-10-15 04:21:54', '2024-10-15 04:21:54'),
('9d400c65-9701-40de-bd7a-eff7147f9ca5', 'ES', 'Using locat', 'Using locat', '2024-10-15 04:21:54', '2024-10-15 04:21:54'),
('9d400c66-20c3-4d41-a7b4-8a657467f26c', 'US', 'Using loca', 'Using loca', '2024-10-15 04:21:54', '2024-10-15 04:21:54'),
('9d400c66-238e-42c7-943e-f00fb7055518', 'ES', 'Using loca', 'Using loca', '2024-10-15 04:21:54', '2024-10-15 04:21:54'),
('9d400c66-a305-4bb8-8f15-388f2078c417', 'US', 'Using lo', 'Using lo', '2024-10-15 04:21:55', '2024-10-15 04:21:55'),
('9d400c66-a563-4aa2-a213-a97fd3d43ff0', 'ES', 'Using lo', 'Using lo', '2024-10-15 04:21:55', '2024-10-15 04:21:55'),
('9d400c67-d442-477c-92c6-e957366ec16f', 'US', 'Usin', 'Usin', '2024-10-15 04:21:55', '2024-10-15 04:21:55'),
('9d400c67-d899-4ba4-ae44-496c0dce78de', 'ES', 'Usin', 'Usin', '2024-10-15 04:21:56', '2024-10-15 04:21:56'),
('9d4032d3-f307-4062-bc02-c4483d6cafc0', 'US', 'Sort Homes for you', 'Sort Homes for you', '2024-10-15 06:09:22', '2024-10-15 06:09:22'),
('9d4032d3-f307-4b16-a3ee-cdada79e5616', 'US', 'Sort Homes for you', 'Sort Homes for you', '2024-10-15 06:09:22', '2024-10-15 06:09:22'),
('9d4032d4-0f61-4554-b9f9-6933147ec9b1', 'ES', 'Sort Homes for you', 'Sort Homes for you', '2024-10-15 06:09:22', '2024-10-15 06:09:22'),
('9d4032d4-0f79-4f93-b660-1a5b423ef017', 'ES', 'Sort Homes for you', 'Sort Homes for you', '2024-10-15 06:09:22', '2024-10-15 06:09:22'),
('9d4032d5-c776-45ad-909d-cc5f2c334d59', 'US', 'Sort homes for you', 'Sort homes for you', '2024-10-15 06:09:23', '2024-10-15 06:09:23'),
('9d4032d5-c898-4f3d-ab8f-fe276817243b', 'US', 'Sort homes for you', 'Sort homes for you', '2024-10-15 06:09:23', '2024-10-15 06:09:23'),
('9d4032d5-cb2d-4b85-a712-3464a6dfceef', 'ES', 'Sort homes for you', 'Sort homes for you', '2024-10-15 06:09:23', '2024-10-15 06:09:23'),
('9d4032d5-cc11-4eee-aa0c-f05421235cb0', 'ES', 'Sort homes for you', 'Sort homes for you', '2024-10-15 06:09:23', '2024-10-15 06:09:23'),
('9d408aa8-2fb9-488a-a0df-701c5ddc2fe7', 'US', 'Builder saved successfully', 'Builder saved successfully', '2024-10-15 10:14:57', '2024-10-15 10:14:57'),
('9d408aa8-3295-416b-bcec-06f31b056fa7', 'ES', 'Builder saved successfully', 'Builder saved successfully', '2024-10-15 10:14:57', '2024-10-15 10:14:57'),
('9d61e592-f029-4c0b-97a5-cbf39a7683af', 'US', 'Int', 'Int', '2024-11-01 00:11:30', '2024-11-01 00:11:30'),
('9d61e592-f5f0-4d53-8d74-b4c3d0200ea6', 'ES', 'Int', 'Int', '2024-11-01 00:11:30', '2024-11-01 00:11:30'),
('9d61e593-570e-4a08-9bf3-4f10a3a90e62', 'US', 'Inte', 'Inte', '2024-11-01 00:11:30', '2024-11-01 00:11:30'),
('9d61e593-5f66-4f68-9562-99bf6397d83b', 'ES', 'Inte', 'Inte', '2024-11-01 00:11:30', '2024-11-01 00:11:30'),
('9d61e593-9a27-4142-b31f-a636a1226a76', 'US', 'Inter', 'Inter', '2024-11-01 00:11:30', '2024-11-01 00:11:30'),
('9d61e593-9f22-4a37-aee2-df0407fe73a5', 'ES', 'Inter', 'Inter', '2024-11-01 00:11:30', '2024-11-01 00:11:30'),
('9d61e593-d0cd-4ebe-87a2-b7e5292fc4b3', 'US', 'Intere', 'Intere', '2024-11-01 00:11:30', '2024-11-01 00:11:30'),
('9d61e593-d4e7-4d83-b765-87361e1c8087', 'ES', 'Intere', 'Intere', '2024-11-01 00:11:30', '2024-11-01 00:11:30'),
('9d61e595-3edf-41f7-8070-823ca963df6a', 'US', 'Interes', 'Interes', '2024-11-01 00:11:31', '2024-11-01 00:11:31'),
('9d61e595-44fa-494e-888a-4f41da8aba0d', 'ES', 'Interes', 'Interes', '2024-11-01 00:11:31', '2024-11-01 00:11:31'),
('9d61e595-efef-439b-a672-075672779eb0', 'US', 'Interest', 'Interest', '2024-11-01 00:11:31', '2024-11-01 00:11:31'),
('9d61e595-f3ed-4b37-846a-28f8fd4fb2c9', 'ES', 'Interest', 'Interest', '2024-11-01 00:11:31', '2024-11-01 00:11:31'),
('9d61e596-621a-4243-bad9-a24dfc7470d1', 'US', 'Interest R', 'Interest R', '2024-11-01 00:11:32', '2024-11-01 00:11:32'),
('9d61e596-6766-4fec-ab67-5b6627fe9409', 'ES', 'Interest R', 'Interest R', '2024-11-01 00:11:32', '2024-11-01 00:11:32'),
('9d61e597-a02d-47fd-ac5a-8828d8873df2', 'US', 'Interest r', 'Interest r', '2024-11-01 00:11:33', '2024-11-01 00:11:33'),
('9d61e597-a463-4c77-89a9-65f708a6d9b7', 'ES', 'Interest r', 'Interest r', '2024-11-01 00:11:33', '2024-11-01 00:11:33'),
('9d61e597-ee83-4124-b46a-4479b4a75919', 'US', 'Interest re', 'Interest re', '2024-11-01 00:11:33', '2024-11-01 00:11:33'),
('9d61e597-f2d5-421f-859e-0f44b5179a68', 'ES', 'Interest re', 'Interest re', '2024-11-01 00:11:33', '2024-11-01 00:11:33'),
('9d61e598-1848-4724-a596-e21bf28dde80', 'US', 'Interest reate', 'Interest reate', '2024-11-01 00:11:33', '2024-11-01 00:11:33'),
('9d61e598-1bb1-46cf-b4f3-ca810db3ad47', 'ES', 'Interest reate', 'Interest reate', '2024-11-01 00:11:33', '2024-11-01 00:11:33'),
('9d61e599-705c-498d-bd94-d54910094de1', 'US', 'Interest reate/', 'Interest reate/', '2024-11-01 00:11:34', '2024-11-01 00:11:34'),
('9d61e599-7540-4efc-8125-53cafbd33e8c', 'ES', 'Interest reate/', 'Interest reate/', '2024-11-01 00:11:34', '2024-11-01 00:11:34'),
('9d61e59a-c0fc-402d-aeca-d9027b92489e', 'US', 'Interest reatef', 'Interest reatef', '2024-11-01 00:11:35', '2024-11-01 00:11:35'),
('9d61e59a-c89b-4ddf-902f-96e7a812c6f4', 'ES', 'Interest reatef', 'Interest reatef', '2024-11-01 00:11:35', '2024-11-01 00:11:35'),
('9d61e59b-ee8f-41e1-9a62-58332687a688', 'US', 'Interest reate fi', 'Interest reate fi', '2024-11-01 00:11:35', '2024-11-01 00:11:35'),
('9d61e59b-f134-4383-b387-2e1025d6848d', 'ES', 'Interest reate fi', 'Interest reate fi', '2024-11-01 00:11:35', '2024-11-01 00:11:35'),
('9d61e59c-ae29-4ddd-9e6a-e8d64db183a9', 'US', 'Interest reate fir', 'Interest reate fir', '2024-11-01 00:11:36', '2024-11-01 00:11:36'),
('9d61e59c-b0a4-463f-9c4d-43eb1b050ddb', 'ES', 'Interest reate fir', 'Interest reate fir', '2024-11-01 00:11:36', '2024-11-01 00:11:36'),
('9d61e59c-fce5-4859-af5f-297fa11e547b', 'US', 'Interest reate first', 'Interest reate first', '2024-11-01 00:11:36', '2024-11-01 00:11:36'),
('9d61e59c-ff89-4131-a5a6-69280428cc26', 'ES', 'Interest reate first', 'Interest reate first', '2024-11-01 00:11:36', '2024-11-01 00:11:36'),
('9d61e59d-712f-4a21-a04b-eaf203c1f2be', 'US', 'Interest reate first y', 'Interest reate first y', '2024-11-01 00:11:36', '2024-11-01 00:11:36'),
('9d61e59d-740b-42b4-be7d-72f436cc3818', 'ES', 'Interest reate first y', 'Interest reate first y', '2024-11-01 00:11:36', '2024-11-01 00:11:36'),
('9d61e59d-88ee-4c69-83df-f88630578823', 'US', 'Interest reate first ye', 'Interest reate first ye', '2024-11-01 00:11:36', '2024-11-01 00:11:36'),
('9d61e59d-8b2d-4521-9db4-636bf419eb84', 'ES', 'Interest reate first ye', 'Interest reate first ye', '2024-11-01 00:11:36', '2024-11-01 00:11:36'),
('9d61e59d-e08c-442e-a87a-980d27658a64', 'US', 'Interest reate first year', 'Interest reate first year', '2024-11-01 00:11:37', '2024-11-01 00:11:37'),
('9d61e59d-e395-41f3-ae97-7c08d0cf2c4f', 'ES', 'Interest reate first year', 'Interest reate first year', '2024-11-01 00:11:37', '2024-11-01 00:11:37'),
('9d61e6ae-817f-4d79-908e-7b420e77ecaa', 'US', 'Not included', 'Not included', '2024-11-01 00:14:35', '2024-11-01 00:14:35'),
('9d61e6ae-88d9-45da-96e4-fad7cb3a9134', 'ES', 'Not included', 'Not included', '2024-11-01 00:14:35', '2024-11-01 00:14:35'),
('9d61e862-cd6b-4477-bc74-bfa372ceb0b9', 'US', 'Itinerary main Image', 'Itinerary main Image', '2024-11-01 00:19:21', '2024-11-01 00:19:21'),
('9d61e862-d4a7-476b-bfb8-b69629974456', 'ES', 'Itinerary main Image', 'Itinerary main Image', '2024-11-01 00:19:21', '2024-11-01 00:19:21'),
('9d61ec99-63c3-4ec5-b638-e0ece7008c12', 'US', 'Inc', 'Inc', '2024-11-01 00:31:08', '2024-11-01 00:31:08'),
('9d61ec99-696e-419e-abe8-6e44a6132426', 'ES', 'Inc', 'Inc', '2024-11-01 00:31:08', '2024-11-01 00:31:08'),
('9d61ec9b-6780-49eb-8afd-a71a0f6e166c', 'US', 'Incentiv', 'Incentiv', '2024-11-01 00:31:09', '2024-11-01 00:31:09'),
('9d61ec9b-6b90-4fc1-a77e-9b447bf94fc9', 'US', 'Incenti', 'Incenti', '2024-11-01 00:31:09', '2024-11-01 00:31:09'),
('9d61ec9b-6c11-4e24-8e15-24dcb9e402ac', 'ES', 'Incentiv', 'Incentiv', '2024-11-01 00:31:09', '2024-11-01 00:31:09'),
('9d61ec9b-7186-404c-aab1-844f744150ae', 'ES', 'Incenti', 'Incenti', '2024-11-01 00:31:09', '2024-11-01 00:31:09'),
('9d61ec9c-2d88-4412-a794-1df01bde7b86', 'US', 'Incentive', 'Incentive', '2024-11-01 00:31:10', '2024-11-01 00:31:10'),
('9d61ec9c-3265-487e-b60c-2aab64a9ad53', 'ES', 'Incentive', 'Incentive', '2024-11-01 00:31:10', '2024-11-01 00:31:10'),
('9d61ec9c-aed7-45a9-b0d0-c48a79f1ff83', 'US', 'Incentive Ba', 'Incentive Ba', '2024-11-01 00:31:10', '2024-11-01 00:31:10'),
('9d61ec9c-b379-4da4-9a87-dd8ffa436c8f', 'ES', 'Incentive Ba', 'Incentive Ba', '2024-11-01 00:31:10', '2024-11-01 00:31:10'),
('9d61ec9c-c0cc-4eab-b621-c389149c6538', 'US', 'Incentive B', 'Incentive B', '2024-11-01 00:31:10', '2024-11-01 00:31:10'),
('9d61ec9c-c94b-48b1-b392-957e480b7a17', 'ES', 'Incentive B', 'Incentive B', '2024-11-01 00:31:10', '2024-11-01 00:31:10'),
('9d61ec9d-88e3-4e5c-80f3-7f8997fc0246', 'US', 'Incentive Bann', 'Incentive Bann', '2024-11-01 00:31:11', '2024-11-01 00:31:11'),
('9d61ec9d-8d30-4937-b49f-146002475f2f', 'ES', 'Incentive Bann', 'Incentive Bann', '2024-11-01 00:31:11', '2024-11-01 00:31:11'),
('9d61ec9d-9a90-4610-9399-f0f11765dbd1', 'US', 'Incentive Ban', 'Incentive Ban', '2024-11-01 00:31:11', '2024-11-01 00:31:11'),
('9d61ec9d-9f4e-4978-9e86-922a4459e107', 'ES', 'Incentive Ban', 'Incentive Ban', '2024-11-01 00:31:11', '2024-11-01 00:31:11'),
('9d61ec9e-4fe9-4c13-a36d-43b26d1f525a', 'US', 'Incentive Banner', 'Incentive Banner', '2024-11-01 00:31:11', '2024-11-01 00:31:11'),
('9d61ec9e-5487-49ce-a029-7ec10a762bc2', 'ES', 'Incentive Banner', 'Incentive Banner', '2024-11-01 00:31:11', '2024-11-01 00:31:11'),
('9d61f1e4-28dd-4c91-aa32-fefd89131363', 'US', 'Search by B', 'Search by B', '2024-11-01 00:45:56', '2024-11-01 00:45:56'),
('9d61f1e4-316c-401d-a375-ee98ee548822', 'ES', 'Search by B', 'Search by B', '2024-11-01 00:45:56', '2024-11-01 00:45:56'),
('9d61f1e4-af66-4c8e-9035-c72f733d1771', 'US', 'Search by Bu', 'Search by Bu', '2024-11-01 00:45:56', '2024-11-01 00:45:56'),
('9d61f1e4-b4be-4912-8e22-5069dacf805f', 'ES', 'Search by Bu', 'Search by Bu', '2024-11-01 00:45:56', '2024-11-01 00:45:56'),
('9d61f1e4-e369-41ba-9554-fa85509cb43e', 'US', 'Search by Bui', 'Search by Bui', '2024-11-01 00:45:56', '2024-11-01 00:45:56'),
('9d61f1e4-e6c8-4b32-81f2-5446bc976aa5', 'ES', 'Search by Bui', 'Search by Bui', '2024-11-01 00:45:56', '2024-11-01 00:45:56'),
('9d61f1e5-2eab-4907-9819-6cf158bb6a66', 'US', 'Search by Build', 'Search by Build', '2024-11-01 00:45:57', '2024-11-01 00:45:57'),
('9d61f1e5-32e0-4aed-9a17-bb0e84aa6379', 'ES', 'Search by Build', 'Search by Build', '2024-11-01 00:45:57', '2024-11-01 00:45:57'),
('9d61f1e5-5479-4e00-ae24-489722cf0fc8', 'US', 'Search by Builder', 'Search by Builder', '2024-11-01 00:45:57', '2024-11-01 00:45:57'),
('9d61f1e5-5a21-427c-b963-5fd7689db5a2', 'ES', 'Search by Builder', 'Search by Builder', '2024-11-01 00:45:57', '2024-11-01 00:45:57'),
('9d61f1e8-8947-43cc-9ad8-f1cec9a4a6c0', 'US', 'Builder', 'Builder', '2024-11-01 00:45:59', '2024-11-01 00:45:59'),
('9d61f1e8-8c5c-40a7-8a78-919e56e30156', 'ES', 'Builder', 'Builder', '2024-11-01 00:45:59', '2024-11-01 00:45:59'),
('9d620547-f1e0-47ee-b2cb-8a80d0854411', 'US', 'Events', 'Events', '2024-11-01 01:40:09', '2024-11-01 01:40:09'),
('9d620548-06a1-4729-99b3-e894efdf55fb', 'ES', 'Events', 'Events', '2024-11-01 01:40:09', '2024-11-01 01:40:09'),
('9d620548-bce9-49ff-8200-95a6c399b9bf', 'US', 'Add Event', 'Add Event', '2024-11-01 01:40:10', '2024-11-01 01:40:10'),
('9d620548-c1bc-4805-a2e1-578b56f42811', 'ES', 'Add Event', 'Add Event', '2024-11-01 01:40:10', '2024-11-01 01:40:10'),
('9d6205da-14be-47ab-b6cb-e96e6f4ab32c', 'US', 'Create New Event', 'Create New Event', '2024-11-01 01:41:45', '2024-11-01 01:41:45'),
('9d6205da-1917-4b6b-8ec8-43980933e114', 'ES', 'Create New Event', 'Create New Event', '2024-11-01 01:41:45', '2024-11-01 01:41:45'),
('9d6205da-208f-4907-8ce4-d768c4c0bacf', 'US', 'View All Events', 'View All Events', '2024-11-01 01:41:45', '2024-11-01 01:41:45'),
('9d6205da-24e0-468b-90c2-88ccae509972', 'ES', 'View All Events', 'View All Events', '2024-11-01 01:41:45', '2024-11-01 01:41:45'),
('9d6205da-8739-44a5-b597-c156827d21ae', 'US', 'Event Details', 'Event Details', '2024-11-01 01:41:45', '2024-11-01 01:41:45'),
('9d6205da-8a6d-45e7-b6d2-fe4dd68c1f95', 'ES', 'Event Details', 'Event Details', '2024-11-01 01:41:45', '2024-11-01 01:41:45'),
('9d6205da-906e-4528-95c4-22d963baff54', 'US', 'Banner', 'Banner', '2024-11-01 01:41:45', '2024-11-01 01:41:45'),
('9d6205da-934d-4045-8641-fb33f41ffd4a', 'ES', 'Banner', 'Banner', '2024-11-01 01:41:45', '2024-11-01 01:41:45'),
('9d620621-1cb1-45c7-a798-fcd0fbcdcb81', 'US', 'Choose status', 'Choose status', '2024-11-01 01:42:31', '2024-11-01 01:42:31'),
('9d620621-23b6-45fa-8627-74ea37ba4781', 'ES', 'Choose status', 'Choose status', '2024-11-01 01:42:31', '2024-11-01 01:42:31'),
('9d620621-9be0-4ebd-89a8-7facdfa43855', 'US', 'Off', 'Off', '2024-11-01 01:42:32', '2024-11-01 01:42:32'),
('9d620621-9ded-4a85-b566-fcb48fa53843', 'US', 'On', 'On', '2024-11-01 01:42:32', '2024-11-01 01:42:32'),
('9d620621-9ecc-49b4-99b7-0150204331ac', 'ES', 'Off', 'Off', '2024-11-01 01:42:32', '2024-11-01 01:42:32'),
('9d620621-a26e-4d83-98e9-d314f64baa7c', 'ES', 'On', 'On', '2024-11-01 01:42:32', '2024-11-01 01:42:32'),
('9d620622-2b40-4459-ba2b-cc9079e7e90d', 'US', 'Event title', 'Event title', '2024-11-01 01:42:32', '2024-11-01 01:42:32'),
('9d620622-3054-46aa-ba69-1f2a613aa997', 'ES', 'Event title', 'Event title', '2024-11-01 01:42:32', '2024-11-01 01:42:32'),
('9d620622-3773-41a9-88d2-f899da2fbc1b', 'US', 'Event start date', 'Event start date', '2024-11-01 01:42:32', '2024-11-01 01:42:32'),
('9d620622-3c6d-4a9c-bc11-2a666d073562', 'ES', 'Event start date', 'Event start date', '2024-11-01 01:42:32', '2024-11-01 01:42:32');
INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
('9d620622-c553-4d4f-9c5c-a3cbd940a6a8', 'US', 'Event end date', 'Event end date', '2024-11-01 01:42:32', '2024-11-01 01:42:32'),
('9d620622-c742-43fa-a362-dd5636e653f7', 'US', 'Eligibility', 'Eligibility', '2024-11-01 01:42:32', '2024-11-01 01:42:32'),
('9d620622-c84b-471e-8bbb-c18765bbe057', 'ES', 'Event end date', 'Event end date', '2024-11-01 01:42:32', '2024-11-01 01:42:32'),
('9d620622-ca53-4aa3-ac21-8cb33e61f9c3', 'ES', 'Eligibility', 'Eligibility', '2024-11-01 01:42:32', '2024-11-01 01:42:32'),
('9d620623-243c-4317-bfb0-fb52539539e5', 'US', 'Catalog', 'Catalog', '2024-11-01 01:42:33', '2024-11-01 01:42:33'),
('9d620623-28dc-4e8d-80bd-7f2dfb9fe26d', 'ES', 'Catalog', 'Catalog', '2024-11-01 01:42:33', '2024-11-01 01:42:33'),
('9d620712-e42f-4d89-a51d-dd1ddcf40c12', 'US', 'registeration_link', 'registeration_link', '2024-11-01 01:45:10', '2024-11-01 01:45:10'),
('9d620712-e9f5-4921-809c-b9c88f73cad1', 'ES', 'registeration_link', 'registeration_link', '2024-11-01 01:45:10', '2024-11-01 01:45:10'),
('9d620716-0cb6-4105-adb6-d686d5523cfc', 'US', 'Registeration_link', 'Registeration_link', '2024-11-01 01:45:12', '2024-11-01 01:45:12'),
('9d620716-122d-4da9-b7b2-fc9d015252f8', 'ES', 'Registeration_link', 'Registeration_link', '2024-11-01 01:45:12', '2024-11-01 01:45:12'),
('9d620718-0e9d-49c7-ba71-43b03c1cd1b4', 'US', 'Registeration link', 'Registeration link', '2024-11-01 01:45:13', '2024-11-01 01:45:13'),
('9d620718-11fe-470a-8e91-c0b1bdb18f78', 'ES', 'Registeration link', 'Registeration link', '2024-11-01 01:45:13', '2024-11-01 01:45:13'),
('9d620847-801b-4143-8cde-fe2044eac778', 'US', 'Registration link', 'Registration link', '2024-11-01 01:48:32', '2024-11-01 01:48:32'),
('9d620847-87ab-48c7-81a9-fe88d290dfbf', 'ES', 'Registration link', 'Registration link', '2024-11-01 01:48:32', '2024-11-01 01:48:32'),
('9d620863-60d2-44fc-af13-738b90d83739', 'US', 'Event  date', 'Event  date', '2024-11-01 01:48:50', '2024-11-01 01:48:50'),
('9d620863-657e-4cf2-a796-fc18e69dc288', 'ES', 'Event  date', 'Event  date', '2024-11-01 01:48:50', '2024-11-01 01:48:50'),
('9d620863-99fc-489c-ac66-32084d76eea0', 'US', 'Event date', 'Event date', '2024-11-01 01:48:51', '2024-11-01 01:48:51'),
('9d620863-9da0-4ee2-89a0-e3e7018dfb5e', 'ES', 'Event date', 'Event date', '2024-11-01 01:48:51', '2024-11-01 01:48:51'),
('9d620863-e2fd-495c-a609-08f15cdea565', 'US', 'Even date', 'Even date', '2024-11-01 01:48:51', '2024-11-01 01:48:51'),
('9d620863-e76f-4d63-b3c6-b54db5d6c554', 'ES', 'Even date', 'Even date', '2024-11-01 01:48:51', '2024-11-01 01:48:51'),
('9d620864-310f-4b6e-a043-9f503735df31', 'US', 'Eve date', 'Eve date', '2024-11-01 01:48:51', '2024-11-01 01:48:51'),
('9d620864-358c-4ee9-9691-30636c52222d', 'ES', 'Eve date', 'Eve date', '2024-11-01 01:48:51', '2024-11-01 01:48:51'),
('9d620864-947a-429c-b685-fca404a6724b', 'US', 'Ev date', 'Ev date', '2024-11-01 01:48:51', '2024-11-01 01:48:51'),
('9d620864-96b0-4f2f-b712-0390272002a3', 'ES', 'Ev date', 'Ev date', '2024-11-01 01:48:51', '2024-11-01 01:48:51'),
('9d620864-b673-4da4-92cc-5880178d538d', 'US', 'E date', 'E date', '2024-11-01 01:48:51', '2024-11-01 01:48:51'),
('9d620864-b98a-4f8a-bafb-16ee6497d3fb', 'ES', 'E date', 'E date', '2024-11-01 01:48:51', '2024-11-01 01:48:51'),
('9d620864-ed5e-4601-9569-71c08ebf4956', 'US', 'date', 'date', '2024-11-01 01:48:51', '2024-11-01 01:48:51'),
('9d620864-f0ad-4981-b9f5-14efb68ab541', 'ES', 'date', 'date', '2024-11-01 01:48:51', '2024-11-01 01:48:51'),
('9d620866-2a49-47eb-bc8f-51bc9adf1c9f', 'US', 'ate', 'ate', '2024-11-01 01:48:52', '2024-11-01 01:48:52'),
('9d620866-2d89-4552-bb6f-fd9858cbc6f3', 'ES', 'ate', 'ate', '2024-11-01 01:48:52', '2024-11-01 01:48:52'),
('9d620867-6486-49c2-81ad-3a91601f11bd', 'US', 'DEate', 'DEate', '2024-11-01 01:48:53', '2024-11-01 01:48:53'),
('9d620867-6a08-457f-bc11-27ea633996b3', 'ES', 'DEate', 'DEate', '2024-11-01 01:48:53', '2024-11-01 01:48:53'),
('9d620868-f696-4b17-8c51-7d30cf75464d', 'US', 'EDate', 'EDate', '2024-11-01 01:48:54', '2024-11-01 01:48:54'),
('9d620868-f8ca-4b6f-8b9e-06aebf1b2d4f', 'ES', 'EDate', 'EDate', '2024-11-01 01:48:54', '2024-11-01 01:48:54'),
('9d620869-8af4-472c-8d03-39b97beb3f0c', 'US', 'EvDate', 'EvDate', '2024-11-01 01:48:54', '2024-11-01 01:48:54'),
('9d620869-8e49-4a96-ba9a-63a0c2d6ba16', 'ES', 'EvDate', 'EvDate', '2024-11-01 01:48:54', '2024-11-01 01:48:54'),
('9d62086a-5ea7-4091-963e-59bfd61c4c2b', 'US', 'EvtDate', 'EvtDate', '2024-11-01 01:48:55', '2024-11-01 01:48:55'),
('9d62086a-62c6-400d-9aef-fddea5ca8202', 'ES', 'EvtDate', 'EvtDate', '2024-11-01 01:48:55', '2024-11-01 01:48:55'),
('9d62086b-0736-46e9-8e81-851818167b07', 'US', 'EveDate', 'EveDate', '2024-11-01 01:48:55', '2024-11-01 01:48:55'),
('9d62086b-0bb6-446b-8749-b14e2830a45d', 'ES', 'EveDate', 'EveDate', '2024-11-01 01:48:55', '2024-11-01 01:48:55'),
('9d62086b-4dfc-4c10-ab22-028e3bdb5087', 'US', 'EventDate', 'EventDate', '2024-11-01 01:48:56', '2024-11-01 01:48:56'),
('9d62086b-5099-4746-ab65-bef6cb01400c', 'ES', 'EventDate', 'EventDate', '2024-11-01 01:48:56', '2024-11-01 01:48:56'),
('9d62086b-7e7d-48c7-b174-a1a9efb47c71', 'US', 'Event Date', 'Event Date', '2024-11-01 01:48:56', '2024-11-01 01:48:56'),
('9d62086b-818d-4461-b105-0ff9c7249289', 'ES', 'Event Date', 'Event Date', '2024-11-01 01:48:56', '2024-11-01 01:48:56'),
('9d620b35-cb75-4ae0-aae8-5e4851c0154e', 'US', 'Event saved successfully', 'Event saved successfully', '2024-11-01 01:56:44', '2024-11-01 01:56:44'),
('9d620b35-d224-4829-9594-96ceec722d2f', 'ES', 'Event saved successfully', 'Event saved successfully', '2024-11-01 01:56:44', '2024-11-01 01:56:44'),
('9d620d36-5ae2-4079-9d99-0cebb85ee198', 'US', 'Registration Link', 'Registration Link', '2024-11-01 02:02:20', '2024-11-01 02:02:20'),
('9d620d36-5b14-4dff-a97c-27b83e8e3117', 'US', 'View Details', 'View Details', '2024-11-01 02:02:20', '2024-11-01 02:02:20'),
('9d620d36-636f-4fb2-878d-2c6626709baf', 'ES', 'Registration Link', 'Registration Link', '2024-11-01 02:02:20', '2024-11-01 02:02:20'),
('9d620d36-644e-4cae-92e7-72b14907b62c', 'ES', 'View Details', 'View Details', '2024-11-01 02:02:20', '2024-11-01 02:02:20'),
('9d6210f4-afe1-472e-92a2-bd80e6d164a1', 'US', 'Event deleted successfully.', 'Event deleted successfully.', '2024-11-01 02:12:48', '2024-11-01 02:12:48'),
('9d6210f4-b4a4-42a9-8b9c-9b938ab97e87', 'ES', 'Event deleted successfully.', 'Event deleted successfully.', '2024-11-01 02:12:48', '2024-11-01 02:12:48'),
('9d665cd2-cad3-40da-8c83-cb83be3312c0', 'US', 'Sort By', 'Sort By', '2024-11-03 05:28:15', '2024-11-03 05:28:15'),
('9d665cd2-cad3-4cbe-98d4-a8946102d90d', 'US', 'Sort B', 'Sort B', '2024-11-03 05:28:15', '2024-11-03 05:28:15'),
('9d665cd3-8cc8-4c11-a187-6719ee14d5bb', 'ES', 'Sort B', 'Sort B', '2024-11-03 05:28:15', '2024-11-03 05:28:15'),
('9d665cd3-8cfc-45b9-8653-b68c16b299a1', 'ES', 'Sort By', 'Sort By', '2024-11-03 05:28:15', '2024-11-03 05:28:15'),
('9d665cf0-62dc-47dc-b3b8-118fa5f3d8fb', 'US', 'Sort b', 'Sort b', '2024-11-03 05:28:34', '2024-11-03 05:28:34'),
('9d665cf0-6803-4c75-8196-1e794136fc58', 'ES', 'Sort b', 'Sort b', '2024-11-03 05:28:34', '2024-11-03 05:28:34'),
('9d6a1090-7ec9-4924-a5f1-ae1f9fe2fd9a', 'US', 'V', 'V', '2024-11-05 01:38:20', '2024-11-05 01:38:20'),
('9d6a1090-8885-4288-8871-86d0591663ff', 'ES', 'V', 'V', '2024-11-05 01:38:20', '2024-11-05 01:38:20'),
('9d6a1090-a5b1-44ab-8f73-992f4fcf7ee2', 'US', 'Vi', 'Vi', '2024-11-05 01:38:20', '2024-11-05 01:38:20'),
('9d6a1090-abb4-46a0-8d43-978300e034dc', 'ES', 'Vi', 'Vi', '2024-11-05 01:38:20', '2024-11-05 01:38:20'),
('9d6a1091-2e44-4e8f-a7fe-a3d400d42981', 'US', 'Vis', 'Vis', '2024-11-05 01:38:20', '2024-11-05 01:38:20'),
('9d6a1091-33d1-4a38-a759-8ed2a09b00e4', 'ES', 'Vis', 'Vis', '2024-11-05 01:38:20', '2024-11-05 01:38:20'),
('9d6a1091-5c2e-45b0-9df6-c464866fe716', 'US', 'Visi', 'Visi', '2024-11-05 01:38:20', '2024-11-05 01:38:20'),
('9d6a1091-6273-48cb-b9e9-fd9b96795d48', 'ES', 'Visi', 'Visi', '2024-11-05 01:38:20', '2024-11-05 01:38:20'),
('9d6a1092-6f05-48bf-a48d-096a0dea5809', 'US', 'Visit', 'Visit', '2024-11-05 01:38:21', '2024-11-05 01:38:21'),
('9d6a1092-748c-492c-8c5d-89755a7c6f78', 'ES', 'Visit', 'Visit', '2024-11-05 01:38:21', '2024-11-05 01:38:21'),
('9d6a1092-7fc7-4eff-9237-b9e6005fb8fc', 'US', 'Visite', 'Visite', '2024-11-05 01:38:21', '2024-11-05 01:38:21'),
('9d6a1092-86c6-4e5b-bab9-9c506b943bdf', 'ES', 'Visite', 'Visite', '2024-11-05 01:38:21', '2024-11-05 01:38:21'),
('9d6a1093-22c5-40c8-a845-0017c0158952', 'US', 'Visited', 'Visited', '2024-11-05 01:38:21', '2024-11-05 01:38:21'),
('9d6a1093-25f7-4330-ae5d-e3226155c637', 'ES', 'Visited', 'Visited', '2024-11-05 01:38:21', '2024-11-05 01:38:21'),
('9d6a1093-b8be-44e2-81f4-8bb225cb1a8c', 'US', 'Visited H', 'Visited H', '2024-11-05 01:38:22', '2024-11-05 01:38:22'),
('9d6a1093-bd2f-4ce2-a3a5-44d611a50f81', 'ES', 'Visited H', 'Visited H', '2024-11-05 01:38:22', '2024-11-05 01:38:22'),
('9d6a1093-c202-41d3-964e-50def2044440', 'US', 'Visited Hom', 'Visited Hom', '2024-11-05 01:38:22', '2024-11-05 01:38:22'),
('9d6a1093-c6a6-4955-9ca0-b397f93b73f7', 'ES', 'Visited Hom', 'Visited Hom', '2024-11-05 01:38:22', '2024-11-05 01:38:22'),
('9d6a1094-3548-4274-8839-b0c10339785d', 'US', 'Visited Home', 'Visited Home', '2024-11-05 01:38:22', '2024-11-05 01:38:22'),
('9d6a1094-3a6d-49f7-9318-a62f2a5a0e2f', 'ES', 'Visited Home', 'Visited Home', '2024-11-05 01:38:22', '2024-11-05 01:38:22'),
('9d6a10a3-a71e-462e-8196-9f19c43e49be', 'US', 'Date &', 'Date &', '2024-11-05 01:38:32', '2024-11-05 01:38:32'),
('9d6a10a3-ad93-42cb-afb2-e6cd662adee7', 'ES', 'Date &', 'Date &', '2024-11-05 01:38:32', '2024-11-05 01:38:32'),
('9d6a10a4-311e-444a-ac5a-72b68905cedb', 'US', 'Date & T', 'Date & T', '2024-11-05 01:38:32', '2024-11-05 01:38:32'),
('9d6a10a4-3462-4e65-be5b-b2aaa0cedcf2', 'ES', 'Date & T', 'Date & T', '2024-11-05 01:38:32', '2024-11-05 01:38:32'),
('9d6a10a4-b4dd-4f0d-b885-72308020c357', 'US', 'Date & Tom', 'Date & Tom', '2024-11-05 01:38:33', '2024-11-05 01:38:33'),
('9d6a10a4-b99d-4d28-88c1-2b3ecc75bfe6', 'ES', 'Date & Tom', 'Date & Tom', '2024-11-05 01:38:33', '2024-11-05 01:38:33'),
('9d6a10a5-5e94-4be1-8398-f7078c8f9a44', 'US', 'Date & Tome', 'Date & Tome', '2024-11-05 01:38:33', '2024-11-05 01:38:33'),
('9d6a10a5-62e1-4fcf-b949-84c89b64af13', 'ES', 'Date & Tome', 'Date & Tome', '2024-11-05 01:38:33', '2024-11-05 01:38:33'),
('9d6a10a6-9875-4787-8f2e-04f425ff32e8', 'US', 'Date & To', 'Date & To', '2024-11-05 01:38:34', '2024-11-05 01:38:34'),
('9d6a10a6-9e50-4f6a-8327-a3226f172654', 'ES', 'Date & To', 'Date & To', '2024-11-05 01:38:34', '2024-11-05 01:38:34'),
('9d6a10a7-ce15-4a05-bad0-2bdef6720696', 'US', 'Date & Tim', 'Date & Tim', '2024-11-05 01:38:35', '2024-11-05 01:38:35'),
('9d6a10a7-d159-4fa7-b356-3ccf43d01828', 'ES', 'Date & Tim', 'Date & Tim', '2024-11-05 01:38:35', '2024-11-05 01:38:35'),
('9d6a10a8-7958-411f-87d0-ba68ed309933', 'US', 'Date & Time', 'Date & Time', '2024-11-05 01:38:35', '2024-11-05 01:38:35'),
('9d6a10a8-80f6-4859-9a6c-987229d59b77', 'ES', 'Date & Time', 'Date & Time', '2024-11-05 01:38:35', '2024-11-05 01:38:35'),
('9d6a10b3-ee33-4098-96f5-fc7b5cb31dc3', 'US', 'Dev', 'Dev', '2024-11-05 01:38:43', '2024-11-05 01:38:43'),
('9d6a10b3-f20b-4f15-b147-2d7c1591e144', 'ES', 'Dev', 'Dev', '2024-11-05 01:38:43', '2024-11-05 01:38:43'),
('9d6a10b4-78c1-421b-856e-1aaf592606e5', 'US', 'Devi', 'Devi', '2024-11-05 01:38:43', '2024-11-05 01:38:43'),
('9d6a10b4-7ef6-4779-9ff2-ca1d6680e1a9', 'ES', 'Devi', 'Devi', '2024-11-05 01:38:43', '2024-11-05 01:38:43'),
('9d6a10b5-9763-49a5-b87a-a1b5761a5bd0', 'US', 'Devin', 'Devin', '2024-11-05 01:38:44', '2024-11-05 01:38:44'),
('9d6a10b5-9b8d-4737-95a0-e5816e29ab7e', 'ES', 'Devin', 'Devin', '2024-11-05 01:38:44', '2024-11-05 01:38:44'),
('9d6a10b6-2010-4545-867e-cf9d9b0aa64a', 'US', 'Devinc', 'Devinc', '2024-11-05 01:38:44', '2024-11-05 01:38:44'),
('9d6a10b6-2481-431a-a5c0-196a34488319', 'ES', 'Devinc', 'Devinc', '2024-11-05 01:38:44', '2024-11-05 01:38:44'),
('9d6a10b8-2b34-4bb2-bb66-c1134eec755f', 'US', 'Devic', 'Devic', '2024-11-05 01:38:46', '2024-11-05 01:38:46'),
('9d6a10b8-2fd0-4dbc-96d9-45fd9f9f819e', 'ES', 'Devic', 'Devic', '2024-11-05 01:38:46', '2024-11-05 01:38:46'),
('9d6a10b9-8ce6-4365-bcd3-04cdcee87f3e', 'US', 'Devicew', 'Devicew', '2024-11-05 01:38:46', '2024-11-05 01:38:46'),
('9d6a10b9-9494-42f2-98e4-a7e5a60b3bf1', 'ES', 'Devicew', 'Devicew', '2024-11-05 01:38:46', '2024-11-05 01:38:46'),
('9d6a10ba-3666-4f83-9d72-c204db71d92a', 'US', 'Device', 'Device', '2024-11-05 01:38:47', '2024-11-05 01:38:47'),
('9d6a10ba-3cf0-4a8d-b1cc-523ac4b5aabc', 'ES', 'Device', 'Device', '2024-11-05 01:38:47', '2024-11-05 01:38:47'),
('9d6a3da3-d1d4-4eeb-91cf-e6f353b2b8e4', 'US', 'Ip', 'Ip', '2024-11-05 03:44:22', '2024-11-05 03:44:22'),
('9d6a3da4-1008-4f76-a7f7-2ca0409b32b0', 'ES', 'Ip', 'Ip', '2024-11-05 03:44:22', '2024-11-05 03:44:22'),
('9d6a3e1c-ed46-4428-8408-2cd8a2c3a2af', 'US', 'Customer ID', 'Customer ID', '2024-11-05 03:45:41', '2024-11-05 03:45:41'),
('9d6a3e1c-f6d1-4e08-bfb1-fad0a54a2912', 'ES', 'Customer ID', 'Customer ID', '2024-11-05 03:45:41', '2024-11-05 03:45:41'),
('9d6a3e1d-27fc-4e68-94a6-ea2bb88491ad', 'US', 'IP Address', 'IP Address', '2024-11-05 03:45:41', '2024-11-05 03:45:41'),
('9d6a3e1d-2df1-4930-91ad-679dc276ba5e', 'ES', 'IP Address', 'IP Address', '2024-11-05 03:45:41', '2024-11-05 03:45:41'),
('9d6a4785-1141-4f81-89b1-1f5d6fd274b9', 'US', 'Visiting List cleared Successfully.', 'Visiting List cleared Successfully.', '2024-11-05 04:11:59', '2024-11-05 04:11:59'),
('9d6a4785-1e04-479f-944e-62579817cb19', 'ES', 'Visiting List cleared Successfully.', 'Visiting List cleared Successfully.', '2024-11-05 04:12:00', '2024-11-05 04:12:00'),
('9dbdec16-fa52-4bb8-9777-2d539ff7871e', 'US', 'Upload', 'Upload', '2024-12-16 18:05:53', '2024-12-16 18:05:53'),
('9dbdec17-0dea-4962-ae97-0112741fc965', 'ES', 'Upload', 'Upload', '2024-12-16 18:05:53', '2024-12-16 18:05:53'),
('9dbdf1f4-7164-42e3-92d8-43b7b36b59ac', 'US', 'Id', 'Id', '2024-12-16 18:22:17', '2024-12-16 18:22:17'),
('9dbdf1f4-75a2-47b5-8e59-3e9cc0847157', 'ES', 'Id', 'Id', '2024-12-16 18:22:17', '2024-12-16 18:22:17'),
('9dbdf36e-0f08-4168-8e11-1c96ee5e5a36', 'US', 'Coped to clipboard.', 'Coped to clipboard.', '2024-12-16 18:26:24', '2024-12-16 18:26:24'),
('9dbdf36e-177f-492f-9197-8d76c91e20bf', 'ES', 'Coped to clipboard.', 'Coped to clipboard.', '2024-12-16 18:26:24', '2024-12-16 18:26:24'),
('9dbdf4ed-44d1-4428-a9d5-862f9ab0bd18', 'US', 'Copied to clipboard.', 'Copied to clipboard.', '2024-12-16 18:30:35', '2024-12-16 18:30:35'),
('9dbdf4ed-4de4-4be3-8179-24452e21df09', 'ES', 'Copied to clipboard.', 'Copied to clipboard.', '2024-12-16 18:30:35', '2024-12-16 18:30:35'),
('9dc0e8e2-549c-4475-b1d1-0dea8c3eda7a', 'US', 'main_image', 'main_image', '2024-12-18 05:44:24', '2024-12-18 05:44:24'),
('9dc0e8e2-5fd1-45aa-b0e5-15b13195ea19', 'ES', 'main_image', 'main_image', '2024-12-18 05:44:24', '2024-12-18 05:44:24'),
('9dc0e8e4-d9af-4dc0-a8b1-b90ba569e24a', 'US', 'main image', 'main image', '2024-12-18 05:44:25', '2024-12-18 05:44:25'),
('9dc0e8e4-e02b-43f4-8800-01998b53d6a9', 'ES', 'main image', 'main image', '2024-12-18 05:44:25', '2024-12-18 05:44:25'),
('9dc0e8e6-86f4-4ec1-99a0-803b31c3406e', 'US', 'ain image', 'ain image', '2024-12-18 05:44:27', '2024-12-18 05:44:27'),
('9dc0e8e6-90aa-422c-98e3-a3df33744c2d', 'ES', 'ain image', 'ain image', '2024-12-18 05:44:27', '2024-12-18 05:44:27'),
('9dc0e8e7-b29b-4b87-b67c-d9e2fbe3e0d4', 'US', 'Main image', 'Main image', '2024-12-18 05:44:27', '2024-12-18 05:44:27'),
('9dc0e8e7-b84f-4d2b-8d9a-ad841391c74e', 'ES', 'Main image', 'Main image', '2024-12-18 05:44:27', '2024-12-18 05:44:27'),
('9dc3c715-e3b9-410a-a05c-a052caa1a8cd', 'US', 'Photo deleted successfully.', 'Photo deleted successfully.', '2024-12-19 15:57:23', '2024-12-19 15:57:23'),
('9dc3c716-3cac-475b-814a-668ed70bfd7b', 'ES', 'Photo deleted successfully.', 'Photo deleted successfully.', '2024-12-19 15:57:23', '2024-12-19 15:57:23'),
('9dc3d8d5-1126-4512-9396-56c11349aa36', 'US', 'longitude', 'longitude', '2024-12-19 16:47:00', '2024-12-19 16:47:00'),
('9dc3d8d5-1541-4444-b5a2-a3d833fc8dd6', 'ES', 'longitude', 'longitude', '2024-12-19 16:47:00', '2024-12-19 16:47:00'),
('9dc3d8d6-4e0e-47d3-958f-e0f949c3c5b2', 'US', 'ongitude', 'ongitude', '2024-12-19 16:47:01', '2024-12-19 16:47:01'),
('9dc3d8d6-5413-42e8-8ab6-2b268d63ac21', 'ES', 'ongitude', 'ongitude', '2024-12-19 16:47:01', '2024-12-19 16:47:01'),
('9dc3d8ea-6cb0-4239-8ec7-56042f074dd1', 'US', 'latitude', 'latitude', '2024-12-19 16:47:14', '2024-12-19 16:47:14'),
('9dc3d8ea-74aa-4a5d-8460-8c8aa2ee7bd6', 'ES', 'latitude', 'latitude', '2024-12-19 16:47:14', '2024-12-19 16:47:14'),
('9dc3d8eb-d999-4885-81ec-6c07649c6953', 'US', 'atitude', 'atitude', '2024-12-19 16:47:15', '2024-12-19 16:47:15'),
('9dc3d8eb-e27b-43d0-b696-88bbc69f6611', 'ES', 'atitude', 'atitude', '2024-12-19 16:47:15', '2024-12-19 16:47:15'),
('9dc3d9c6-c80b-4687-a391-bfcea11ed0ec', 'US', 'HOA D', 'HOA D', '2024-12-19 16:49:38', '2024-12-19 16:49:38'),
('9dc3d9c6-cf27-4b75-9b1f-b22a3e989624', 'ES', 'HOA D', 'HOA D', '2024-12-19 16:49:38', '2024-12-19 16:49:38'),
('9dc3d9c6-febb-4f6e-a7a4-268d8a06cc22', 'US', 'HOAD', 'HOAD', '2024-12-19 16:49:38', '2024-12-19 16:49:38'),
('9dc3d9c7-057c-4a9d-a892-5ea6d47e0140', 'ES', 'HOAD', 'HOAD', '2024-12-19 16:49:38', '2024-12-19 16:49:38'),
('9dc3eb17-ac44-4c43-8003-a1c57b1d3e24', 'US', 'Upload main', 'Upload main', '2024-12-19 17:38:03', '2024-12-19 17:38:03'),
('9dc3eb17-b986-43e7-bac2-f64440c22e9e', 'US', 'Upload main', 'Upload main', '2024-12-19 17:38:03', '2024-12-19 17:38:03'),
('9dc3eb17-c4af-47ac-a25f-a05a085460b4', 'ES', 'Upload main', 'Upload main', '2024-12-19 17:38:03', '2024-12-19 17:38:03'),
('9dc3eb17-c82d-4e1f-b04d-13bbfead5c9b', 'ES', 'Upload main', 'Upload main', '2024-12-19 17:38:03', '2024-12-19 17:38:03'),
('9dc3eb19-3f34-4e1a-a2af-e8152a939b97', 'US', 'Upload ma', 'Upload ma', '2024-12-19 17:38:04', '2024-12-19 17:38:04'),
('9dc3eb19-41bf-4469-8b60-2e38e470d872', 'US', 'Upload ma', 'Upload ma', '2024-12-19 17:38:04', '2024-12-19 17:38:04'),
('9dc3eb19-497e-462f-a2b9-887cb0aa80c6', 'ES', 'Upload ma', 'Upload ma', '2024-12-19 17:38:04', '2024-12-19 17:38:04'),
('9dc3eb19-4d4a-470c-9ac9-45ce7c89c9cf', 'ES', 'Upload ma', 'Upload ma', '2024-12-19 17:38:04', '2024-12-19 17:38:04'),
('9dc3eb19-df3b-4b01-bb6c-a97216320549', 'US', 'Upl', 'Upl', '2024-12-19 17:38:05', '2024-12-19 17:38:05'),
('9dc3eb19-e30d-455f-b8aa-bdb00724575b', 'ES', 'Upl', 'Upl', '2024-12-19 17:38:05', '2024-12-19 17:38:05'),
('9dc3eb19-e4cd-4cc6-b224-9589b20e977f', 'US', 'Upl', 'Upl', '2024-12-19 17:38:05', '2024-12-19 17:38:05'),
('9dc3eb19-e96e-4551-a7c9-d568245c8e2a', 'ES', 'Upl', 'Upl', '2024-12-19 17:38:05', '2024-12-19 17:38:05'),
('9dc3eb1c-f8c2-4f4a-88c1-a7a75635e2f0', 'US', 'Im', 'Im', '2024-12-19 17:38:07', '2024-12-19 17:38:07'),
('9dc3eb1c-ffb8-43ed-9de7-b3950f7ea6ce', 'ES', 'Im', 'Im', '2024-12-19 17:38:07', '2024-12-19 17:38:07'),
('9dc3eb1d-02c9-4a5c-bfaa-bc0496718530', 'US', 'Im', 'Im', '2024-12-19 17:38:07', '2024-12-19 17:38:07'),
('9dc3eb1d-0800-4fd7-991e-855ec8824d40', 'ES', 'Im', 'Im', '2024-12-19 17:38:07', '2024-12-19 17:38:07'),
('9dc3eb1d-ee2d-47f9-8682-b48e127b17c0', 'US', 'Ima', 'Ima', '2024-12-19 17:38:07', '2024-12-19 17:38:07'),
('9dc3eb1d-f6a4-448d-bf52-719400e1dd40', 'ES', 'Ima', 'Ima', '2024-12-19 17:38:07', '2024-12-19 17:38:07'),
('9dc3eb1d-fcbf-4f0f-aab9-793b3f3a3dfc', 'US', 'Ima', 'Ima', '2024-12-19 17:38:07', '2024-12-19 17:38:07'),
('9dc3eb1e-00f2-4ea9-a2b4-7a68a812ee90', 'ES', 'Ima', 'Ima', '2024-12-19 17:38:07', '2024-12-19 17:38:07'),
('9dc3eb1e-7d8a-4af0-b3a4-84dc82d7c0a7', 'US', 'Imag', 'Imag', '2024-12-19 17:38:08', '2024-12-19 17:38:08'),
('9dc3eb1e-83b5-440a-80c4-8fb42f698c6c', 'ES', 'Imag', 'Imag', '2024-12-19 17:38:08', '2024-12-19 17:38:08'),
('9dc3eb27-a28d-49fa-ae83-e2553a09f055', 'US', 'Mai', 'Mai', '2024-12-19 17:38:14', '2024-12-19 17:38:14'),
('9dc3eb27-a664-410e-a69d-1319c7faeb61', 'US', 'Mai', 'Mai', '2024-12-19 17:38:14', '2024-12-19 17:38:14'),
('9dc3eb27-a89a-43b4-bce0-0d42c69b011c', 'ES', 'Mai', 'Mai', '2024-12-19 17:38:14', '2024-12-19 17:38:14'),
('9dc3eb27-ac83-4bbe-a919-41ef2d9dc46f', 'ES', 'Mai', 'Mai', '2024-12-19 17:38:14', '2024-12-19 17:38:14'),
('9dc3eb28-8fe2-46a0-bc29-a3e7666b9f98', 'US', 'Main', 'Main', '2024-12-19 17:38:14', '2024-12-19 17:38:14'),
('9dc3eb28-97a9-47f0-a430-f26d7f0400bc', 'ES', 'Main', 'Main', '2024-12-19 17:38:14', '2024-12-19 17:38:14'),
('9dc3eb2a-b749-4a4f-89ab-bf13d2a58e5c', 'US', 'Main i', 'Main i', '2024-12-19 17:38:16', '2024-12-19 17:38:16'),
('9dc3eb2a-bc2a-4bfa-8196-96b46040d936', 'ES', 'Main i', 'Main i', '2024-12-19 17:38:16', '2024-12-19 17:38:16'),
('9dc3eb2b-45af-45f2-a611-1e980d70aad1', 'US', 'Main imag', 'Main imag', '2024-12-19 17:38:16', '2024-12-19 17:38:16'),
('9dc3eb2b-46b5-4202-b262-a7ef666c6893', 'US', 'Main imag', 'Main imag', '2024-12-19 17:38:16', '2024-12-19 17:38:16'),
('9dc3eb2b-4940-4cee-b192-c22509bf57b7', 'ES', 'Main imag', 'Main imag', '2024-12-19 17:38:16', '2024-12-19 17:38:16'),
('9dc3eb2b-4a8d-498b-9b48-7c6c01971f21', 'ES', 'Main imag', 'Main imag', '2024-12-19 17:38:16', '2024-12-19 17:38:16'),
('9dc5e1d2-9831-41bd-8984-921580692f82', 'US', 'Brand New Homes Vegas', 'Brand New Homes Vegas', '2024-12-20 17:03:47', '2024-12-20 17:03:47'),
('9dc5e1d2-a830-486a-b5ba-d3edf189c2e4', 'ES', 'Brand New Homes Vegas', 'Brand New Homes Vegas', '2024-12-20 17:03:47', '2024-12-20 17:03:47'),
('9dc5eb64-1bda-41bb-91b4-bcf86e8171a6', 'US', 'Quick m', 'Quick m', '2024-12-20 17:30:33', '2024-12-20 17:30:33'),
('9dc5eb64-2bff-4f76-b863-8b07d176dd3d', 'ES', 'Quick m', 'Quick m', '2024-12-20 17:30:33', '2024-12-20 17:30:33'),
('9dc5eb64-ab6b-45ec-ac54-d3ca3b406551', 'US', 'Quick mo', 'Quick mo', '2024-12-20 17:30:33', '2024-12-20 17:30:33'),
('9dc5eb64-b4cd-4dcc-ab0f-efc79c09593c', 'ES', 'Quick mo', 'Quick mo', '2024-12-20 17:30:33', '2024-12-20 17:30:33'),
('9dc5eb65-57d7-4e6e-9328-0544055ec0b6', 'US', 'Quick move', 'Quick move', '2024-12-20 17:30:34', '2024-12-20 17:30:34'),
('9dc5eb65-6869-49db-b5d8-98c19749b690', 'ES', 'Quick move', 'Quick move', '2024-12-20 17:30:34', '2024-12-20 17:30:34'),
('9dc5eb65-bcb7-477d-b0d4-be6ff8e80956', 'US', 'Quick mov', 'Quick mov', '2024-12-20 17:30:34', '2024-12-20 17:30:34'),
('9dc5eb65-c3ca-4a62-a881-ebf72822537f', 'ES', 'Quick mov', 'Quick mov', '2024-12-20 17:30:34', '2024-12-20 17:30:34'),
('9dc5eb66-ed23-45d8-a12d-f70f87f546ba', 'US', 'Quick mM', 'Quick mM', '2024-12-20 17:30:35', '2024-12-20 17:30:35'),
('9dc5eb67-0054-4a68-be12-2c0c3ecfba12', 'ES', 'Quick mM', 'Quick mM', '2024-12-20 17:30:35', '2024-12-20 17:30:35'),
('9dc611a0-968c-4f39-ac82-e4f664dd29b9', 'US', 'Property In Community', 'Property In Community', '2024-12-20 19:17:28', '2024-12-20 19:17:28'),
('9dc611a0-a226-46fa-8c69-5711684f417d', 'ES', 'Property In Community', 'Property In Community', '2024-12-20 19:17:28', '2024-12-20 19:17:28'),
('9dc7dcd5-2903-42a7-bb6b-57fbd7623c1c', 'US', 'Banne', 'Banne', '2024-12-21 16:41:30', '2024-12-21 16:41:30'),
('9dc7dcd5-2905-4742-b0e9-022cdbdd722a', 'US', 'Banne', 'Banne', '2024-12-21 16:41:30', '2024-12-21 16:41:30'),
('9dc7dcd5-cdc7-497a-9586-7c102e9d1cca', 'ES', 'Banne', 'Banne', '2024-12-21 16:41:30', '2024-12-21 16:41:30'),
('9dc7dcd5-cdf1-411d-992a-7e4e6b3027e2', 'ES', 'Banne', 'Banne', '2024-12-21 16:41:30', '2024-12-21 16:41:30'),
('9dc7e4f3-6f08-40c3-a1f0-1d02e652ffdc', 'US', 'B', 'B', '2024-12-21 17:04:12', '2024-12-21 17:04:12'),
('9dc7e4f3-79fa-497b-b6ce-5b1b94bb8d2e', 'ES', 'B', 'B', '2024-12-21 17:04:12', '2024-12-21 17:04:12'),
('9dc7e4f3-83ad-46bb-9444-6ec9450c07fc', 'US', 'B', 'B', '2024-12-21 17:04:12', '2024-12-21 17:04:12'),
('9dc7e4f3-8df2-41b5-9edc-38949c00573c', 'ES', 'B', 'B', '2024-12-21 17:04:12', '2024-12-21 17:04:12'),
('9dc7e4f4-7c44-49d5-9e38-0e11fe3e3560', 'US', 'Ba', 'Ba', '2024-12-21 17:04:12', '2024-12-21 17:04:12'),
('9dc7e4f4-8758-43a0-9d79-ff32c2f1ea72', 'ES', 'Ba', 'Ba', '2024-12-21 17:04:12', '2024-12-21 17:04:12'),
('9dc7e4f5-7480-4698-81ed-cce53be680c4', 'US', 'Ban', 'Ban', '2024-12-21 17:04:13', '2024-12-21 17:04:13'),
('9dc7e4f5-79fd-4bbf-b31a-2a98870a6707', 'ES', 'Ban', 'Ban', '2024-12-21 17:04:13', '2024-12-21 17:04:13'),
('9dc7e4f5-b892-4a79-a5d5-f1bd306928d4', 'US', 'Bann', 'Bann', '2024-12-21 17:04:13', '2024-12-21 17:04:13'),
('9dc7e4f5-baf3-412f-84a9-5aaa423b6fec', 'ES', 'Bann', 'Bann', '2024-12-21 17:04:13', '2024-12-21 17:04:13'),
('9ddbe896-c945-4fae-ba71-69db6ce0b69f', 'US', 'No community added', 'No community added', '2024-12-31 15:50:55', '2024-12-31 15:50:55'),
('9ddbe896-cf8e-4be5-b690-b945457f3ade', 'ES', 'No community added', 'No community added', '2024-12-31 15:50:55', '2024-12-31 15:50:55'),
('9e08253d-5b71-479c-b2d0-8000de1085d4', 'US', 'Text', 'Text', '2025-01-22 15:36:57', '2025-01-22 15:36:57'),
('9e08253d-5b73-4f6a-bdc8-c7197f142ab6', 'US', 'Text', 'Text', '2025-01-22 15:36:57', '2025-01-22 15:36:57'),
('9e08253e-7085-47ba-996a-099758c6d501', 'ES', 'Text', 'Text', '2025-01-22 15:36:57', '2025-01-22 15:36:57'),
('9e08253e-70d8-43a5-acca-1fc8fe276a46', 'ES', 'Text', 'Text', '2025-01-22 15:36:57', '2025-01-22 15:36:57'),
('9e08270c-a7e1-485d-8f3d-4d3055d24ed5', 'US', 'Size (sq ft)', 'Size (sq ft)', '2025-01-22 15:42:00', '2025-01-22 15:42:00'),
('9e08270c-b626-408c-8edc-782283324372', 'ES', 'Size (sq ft)', 'Size (sq ft)', '2025-01-22 15:42:00', '2025-01-22 15:42:00'),
('9e08270c-eac4-4ce4-86ca-5adff6c88d85', 'US', 'Beds', 'Beds', '2025-01-22 15:42:00', '2025-01-22 15:42:00'),
('9e08270c-f570-4488-8878-765412f5c90f', 'ES', 'Beds', 'Beds', '2025-01-22 15:42:00', '2025-01-22 15:42:00'),
('9e08270d-a7df-427d-a181-125652c1318e', 'US', 'Full Baths', 'Full Baths', '2025-01-22 15:42:01', '2025-01-22 15:42:01'),
('9e08270d-ad41-4aa1-9b56-0eefe6e27b8e', 'ES', 'Full Baths', 'Full Baths', '2025-01-22 15:42:01', '2025-01-22 15:42:01'),
('9e08270d-d446-4f96-9b24-9d446a5b1653', 'US', 'Half Baths', 'Half Baths', '2025-01-22 15:42:01', '2025-01-22 15:42:01'),
('9e08270d-d876-4895-a541-de7b811a29b3', 'ES', 'Half Baths', 'Half Baths', '2025-01-22 15:42:01', '2025-01-22 15:42:01'),
('9e08270e-43f0-402b-8971-dc26a3ecf8aa', 'US', 'Special Features', 'Special Features', '2025-01-22 15:42:01', '2025-01-22 15:42:01'),
('9e08270e-4722-4e9e-82e2-4a827cfd169e', 'ES', 'Special Features', 'Special Features', '2025-01-22 15:42:01', '2025-01-22 15:42:01'),
('9e08270e-5105-4981-892d-483e032545c7', 'US', 'Images', 'Images', '2025-01-22 15:42:01', '2025-01-22 15:42:01'),
('9e08270e-5420-4609-84d8-fe9ee344a04d', 'ES', 'Images', 'Images', '2025-01-22 15:42:01', '2025-01-22 15:42:01'),
('9e082a84-57d8-494f-a8e3-5c0d6793f7d4', 'US', 'price_from', 'price_from', '2025-01-22 15:51:42', '2025-01-22 15:51:42'),
('9e082a84-5b9f-410c-a75d-6852b8e3492d', 'ES', 'price_from', 'price_from', '2025-01-22 15:51:42', '2025-01-22 15:51:42'),
('9e082a86-1b6e-4627-a036-4c956db7a2ef', 'US', 'price from', 'price from', '2025-01-22 15:51:43', '2025-01-22 15:51:43'),
('9e082a86-20af-4eab-ac53-7f4f6e0a799c', 'ES', 'price from', 'price from', '2025-01-22 15:51:43', '2025-01-22 15:51:43'),
('9e082a88-081f-4c58-a27c-5157b15aecd4', 'US', 'rice from', 'rice from', '2025-01-22 15:51:44', '2025-01-22 15:51:44'),
('9e082a88-0be4-43b7-ad1a-e661d51cae94', 'ES', 'rice from', 'rice from', '2025-01-22 15:51:44', '2025-01-22 15:51:44'),
('9e082a88-48a7-473e-aed9-f3c4383a1fb3', 'US', 'خrice from', 'خrice from', '2025-01-22 15:51:45', '2025-01-22 15:51:45'),
('9e082a88-4c14-4f9f-ae62-f37b306cb588', 'ES', 'خrice from', 'خrice from', '2025-01-22 15:51:45', '2025-01-22 15:51:45'),
('9e082a8b-b8e2-4c5a-9df4-5a29045736f9', 'US', 'Price from', 'Price from', '2025-01-22 15:51:47', '2025-01-22 15:51:47'),
('9e082a8b-bcd5-4da8-9054-6210b61d0cc3', 'ES', 'Price from', 'Price from', '2025-01-22 15:51:47', '2025-01-22 15:51:47'),
('9e082a9e-47cb-4b49-a438-9dd485b5cc76', 'US', 'Price t', 'Price t', '2025-01-22 15:51:59', '2025-01-22 15:51:59'),
('9e082a9e-4dd6-4ff3-9a88-682192fec376', 'ES', 'Price t', 'Price t', '2025-01-22 15:51:59', '2025-01-22 15:51:59'),
('9e082a9f-27bb-42c7-a577-cb6ae92e6150', 'US', 'Price to', 'Price to', '2025-01-22 15:52:00', '2025-01-22 15:52:00'),
('9e082a9f-2e9f-48ae-a395-d20b953238bb', 'ES', 'Price to', 'Price to', '2025-01-22 15:52:00', '2025-01-22 15:52:00'),
('9e082ace-914e-4618-9c1a-73a78b93d2c4', 'US', 'storieso', 'storieso', '2025-01-22 15:52:31', '2025-01-22 15:52:31'),
('9e082ace-95ff-4394-b77e-2e10418b700b', 'ES', 'storieso', 'storieso', '2025-01-22 15:52:31', '2025-01-22 15:52:31'),
('9e082acf-9cdb-4967-9338-fbf6196dffe3', 'US', 'stories', 'stories', '2025-01-22 15:52:31', '2025-01-22 15:52:31'),
('9e082acf-a24b-407f-8f23-2ecbebf10d1f', 'ES', 'stories', 'stories', '2025-01-22 15:52:31', '2025-01-22 15:52:31'),
('9e082ad3-cd86-42a0-bf1a-b31edb1fa3dd', 'US', 'tories', 'tories', '2025-01-22 15:52:34', '2025-01-22 15:52:34'),
('9e082ad3-d2a5-4cb6-b4b6-b52114f61a62', 'ES', 'tories', 'tories', '2025-01-22 15:52:34', '2025-01-22 15:52:34'),
('9e082ad4-5a31-4d1d-aaeb-7f7adb0b960b', 'US', 'زtories', 'زtories', '2025-01-22 15:52:34', '2025-01-22 15:52:34'),
('9e082ad4-5f08-4a85-a77f-5bc3fa0ef6e1', 'ES', 'زtories', 'زtories', '2025-01-22 15:52:34', '2025-01-22 15:52:34'),
('9e082add-a531-4481-aabe-2927d1eb6bc5', 'US', 'Stories', 'Stories', '2025-01-22 15:52:40', '2025-01-22 15:52:40'),
('9e082add-aa59-46cd-ad5c-7ce563e31b60', 'ES', 'Stories', 'Stories', '2025-01-22 15:52:40', '2025-01-22 15:52:40'),
('9e082aed-9434-429c-b72c-0a30e064669a', 'US', 'full_bath', 'full_bath', '2025-01-22 15:52:51', '2025-01-22 15:52:51'),
('9e082aed-9752-4237-b05c-8d25ff4bb40e', 'ES', 'full_bath', 'full_bath', '2025-01-22 15:52:51', '2025-01-22 15:52:51'),
('9e082aef-b741-446c-b713-05afd543f8b1', 'US', 'ull_bath', 'ull_bath', '2025-01-22 15:52:52', '2025-01-22 15:52:52'),
('9e082aef-bac0-4b7e-85ba-cfc02fe12fba', 'ES', 'ull_bath', 'ull_bath', '2025-01-22 15:52:52', '2025-01-22 15:52:52'),
('9e082af1-33ca-46ee-ae8b-0273fb3e56b3', 'US', 'Full_bath', 'Full_bath', '2025-01-22 15:52:53', '2025-01-22 15:52:53'),
('9e082af1-37a7-46da-a626-637c6f2c2f8d', 'ES', 'Full_bath', 'Full_bath', '2025-01-22 15:52:53', '2025-01-22 15:52:53'),
('9e082af2-23a1-49df-9294-6387105ea85c', 'US', 'Fullbath', 'Fullbath', '2025-01-22 15:52:54', '2025-01-22 15:52:54'),
('9e082af2-26d3-43e6-b0de-c49e0c5b4e3f', 'ES', 'Fullbath', 'Fullbath', '2025-01-22 15:52:54', '2025-01-22 15:52:54'),
('9e082af3-5b6c-48f9-aef7-e5697747ec85', 'US', 'Full bath', 'Full bath', '2025-01-22 15:52:55', '2025-01-22 15:52:55'),
('9e082af3-5fbc-4909-bda1-6b93cb3fefce', 'ES', 'Full bath', 'Full bath', '2025-01-22 15:52:55', '2025-01-22 15:52:55'),
('9e082b0e-43de-41ff-a4ff-971efaf12787', 'US', 'H bath', 'H bath', '2025-01-22 15:53:12', '2025-01-22 15:53:12'),
('9e082b0e-473c-46e6-a72c-a67810981804', 'ES', 'H bath', 'H bath', '2025-01-22 15:53:12', '2025-01-22 15:53:12'),
('9e082b0f-cd30-4c21-9ed3-a2d3c3af1c94', 'US', 'Ha bath', 'Ha bath', '2025-01-22 15:53:13', '2025-01-22 15:53:13'),
('9e082b0f-d08c-4f26-9e16-7ae3816914df', 'ES', 'Ha bath', 'Ha bath', '2025-01-22 15:53:13', '2025-01-22 15:53:13'),
('9e082b10-753a-4fb9-95b4-585b33350a4c', 'US', 'Half bath', 'Half bath', '2025-01-22 15:53:14', '2025-01-22 15:53:14'),
('9e082b10-7952-4196-862a-8bccb18425bc', 'ES', 'Half bath', 'Half bath', '2025-01-22 15:53:14', '2025-01-22 15:53:14'),
('9e082b29-28bc-428d-b9e9-2174fba18cc9', 'US', 'S bath', 'S bath', '2025-01-22 15:53:30', '2025-01-22 15:53:30'),
('9e082b29-32e5-44ae-8eb8-7b3ca8963948', 'ES', 'S bath', 'S bath', '2025-01-22 15:53:30', '2025-01-22 15:53:30'),
('9e082b2b-5b20-4009-8e7b-f3cde4493682', 'US', 'Size  bath', 'Size  bath', '2025-01-22 15:53:31', '2025-01-22 15:53:31'),
('9e082b2b-61b7-4199-b708-8dddf8c44669', 'ES', 'Size  bath', 'Size  bath', '2025-01-22 15:53:31', '2025-01-22 15:53:31'),
('9e082b2c-c6a1-4697-928e-301819f08ebe', 'US', 'Size from bath', 'Size from bath', '2025-01-22 15:53:32', '2025-01-22 15:53:32'),
('9e082b2c-cc24-49df-9e54-df38bbef3499', 'ES', 'Size from bath', 'Size from bath', '2025-01-22 15:53:32', '2025-01-22 15:53:32'),
('9e082b33-0eff-4e1b-ad98-488ea1f7e7da', 'US', 'Size from', 'Size from', '2025-01-22 15:53:36', '2025-01-22 15:53:36'),
('9e082b33-1398-4c01-8fa3-a9ed53a09242', 'ES', 'Size from', 'Size from', '2025-01-22 15:53:36', '2025-01-22 15:53:36'),
('9e082bf3-609e-4c1f-9707-0de31eab06ad', 'US', 'Size to', 'Size to', '2025-01-22 15:55:42', '2025-01-22 15:55:42'),
('9e082bf3-64ef-4007-beca-72d1a566360b', 'US', 'Construction status', 'Construction status', '2025-01-22 15:55:42', '2025-01-22 15:55:42'),
('9e082bf3-65ab-42df-ac4a-2fc392f14dfb', 'ES', 'Size to', 'Size to', '2025-01-22 15:55:42', '2025-01-22 15:55:42'),
('9e082bf3-67ff-4e4f-9fd3-5a240067688a', 'ES', 'Construction status', 'Construction status', '2025-01-22 15:55:42', '2025-01-22 15:55:42'),
('9e082bf3-c192-41c7-8a3c-78fee1eacc17', 'US', 'Choose', 'Choose', '2025-01-22 15:55:43', '2025-01-22 15:55:43'),
('9e082bf3-c41c-42b7-9924-e3b14b9097d5', 'ES', 'Choose', 'Choose', '2025-01-22 15:55:43', '2025-01-22 15:55:43'),
('9e082bf4-0be3-48fe-a01f-280244dd9c16', 'US', 'Average price per square', 'Average price per square', '2025-01-22 15:55:43', '2025-01-22 15:55:43'),
('9e082bf4-0f1c-4e92-bdab-0f2ef436cd3e', 'ES', 'Average price per square', 'Average price per square', '2025-01-22 15:55:43', '2025-01-22 15:55:43'),
('9e08347e-eae3-4186-a283-558c9557e115', 'US', 'Price From', 'Price From', '2025-01-22 16:19:36', '2025-01-22 16:19:36'),
('9e08347e-f210-4c06-9295-7997d0b8a366', 'ES', 'Price From', 'Price From', '2025-01-22 16:19:36', '2025-01-22 16:19:36'),
('9e08347f-9bf7-44da-926b-045b7bedc231', 'US', 'Full Bath', 'Full Bath', '2025-01-22 16:19:37', '2025-01-22 16:19:37'),
('9e08347f-9fef-48ac-866d-8115efa286d1', 'ES', 'Full Bath', 'Full Bath', '2025-01-22 16:19:37', '2025-01-22 16:19:37'),
('9e08347f-d491-454d-921c-8a81b6de7ed8', 'US', 'Price To', 'Price To', '2025-01-22 16:19:37', '2025-01-22 16:19:37'),
('9e08347f-d8ee-4b14-b526-6918e308da33', 'ES', 'Price To', 'Price To', '2025-01-22 16:19:37', '2025-01-22 16:19:37'),
('9e083480-17c9-49b2-be85-0b5044a00f1a', 'US', 'Size From', 'Size From', '2025-01-22 16:19:37', '2025-01-22 16:19:37'),
('9e083480-1be8-494e-bf9b-ceddbb82a86a', 'ES', 'Size From', 'Size From', '2025-01-22 16:19:37', '2025-01-22 16:19:37'),
('9e083480-5a2d-4880-aa60-55d4d32e782e', 'US', 'Half Bath', 'Half Bath', '2025-01-22 16:19:37', '2025-01-22 16:19:37'),
('9e083480-5de2-476c-ba5a-9fe596101bd7', 'ES', 'Half Bath', 'Half Bath', '2025-01-22 16:19:37', '2025-01-22 16:19:37'),
('9e083480-9f54-47f8-ad2e-1d8cca3efef3', 'US', 'Construction Status', 'Construction Status', '2025-01-22 16:19:37', '2025-01-22 16:19:37'),
('9e083480-a356-4908-86fb-c1258123a8bc', 'ES', 'Construction Status', 'Construction Status', '2025-01-22 16:19:37', '2025-01-22 16:19:37'),
('9e083480-ec37-40a5-b79b-e69553dfe827', 'US', 'Size To', 'Size To', '2025-01-22 16:19:37', '2025-01-22 16:19:37'),
('9e083480-f7f5-484f-aa46-585037210e77', 'ES', 'Size To', 'Size To', '2025-01-22 16:19:37', '2025-01-22 16:19:37'),
('9e083481-4772-4568-9f40-c62101d515fa', 'US', 'Average Price Per Square', 'Average Price Per Square', '2025-01-22 16:19:38', '2025-01-22 16:19:38'),
('9e083481-4eb8-4293-9955-9003aabaa803', 'ES', 'Average Price Per Square', 'Average Price Per Square', '2025-01-22 16:19:38', '2025-01-22 16:19:38'),
('9e083481-9b25-4d40-911a-d7c44175eb76', 'US', 'Listing Status', 'Listing Status', '2025-01-22 16:19:38', '2025-01-22 16:19:38'),
('9e083481-9eda-4de7-b474-1b36fb9aad79', 'ES', 'Listing Status', 'Listing Status', '2025-01-22 16:19:38', '2025-01-22 16:19:38');

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` int NOT NULL,
  `file_original_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file_size` int DEFAULT NULL,
  `extension` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `file_original_name`, `file_name`, `file_size`, `extension`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(88, 'property (1).jpg', 'real_public/PropertiesFiles/GuLdlRV7l4UUCVB9Cc9cXR7LFmcZpRG04Z548o17.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:17', '2024-12-23 16:29:17', NULL),
(89, 'property (11).jpg', 'real_public/PropertiesFiles/hC3r9BkvvXOfVF52Cuc9n6VhjVphMh8Ip4LIsZ2R.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:17', '2024-12-23 16:29:17', NULL),
(90, 'property (7).jpg', 'real_public/PropertiesFiles/FG1kFjXVo8yjtnO6wNcZiy41IpFILJSflgXVrICn.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:17', '2024-12-23 16:29:17', NULL),
(91, 'property (2).jpg', 'real_public/PropertiesFiles/BxWY9q6j4r3QTImeMFKmw6xT8zp71T51n20husGU.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:17', '2024-12-23 16:29:17', NULL),
(92, 'property (3).jpg', 'real_public/PropertiesFiles/uQqYxMvcp1OnHIDZ3FJWI99zLLBFazUVfVsFNfyP.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:17', '2024-12-23 16:29:17', NULL),
(93, 'property (4).jpg', 'real_public/PropertiesFiles/gIZDJ3i7Pug1ckoPbrqBjb6b17mcwacY3otmNThb.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:17', '2024-12-23 16:29:17', NULL),
(94, 'property (3).jpg', 'real_public/PropertiesFiles/Sb2O1OZyVwPvpl0iSsvaVaf44ex5vnuVwUUT06Fn.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:17', '2024-12-23 16:29:17', NULL),
(95, 'property (6).jpg', 'real_public/PropertiesFiles/39jprzkRwxuNGbbO3IUJOgVZQsGzgPvop2FrWt7E.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:17', '2024-12-23 16:29:17', NULL),
(96, 'property (5).jpg', 'real_public/PropertiesFiles/mPLmZbRuUyPGcznKvsndQXKgRkTObQFQ5AnnaHMb.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:17', '2024-12-23 16:29:17', NULL),
(97, 'property (3).jpg', 'real_public/PropertiesFiles/rbZM63noitKZsBZVUx5bnIACZqQmCBY5rAuYodNb.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:17', '2024-12-23 16:29:17', NULL),
(98, 'property (9).jpg', 'real_public/PropertiesFiles/HLOjV3wlEerJc2jb6POzZh9Ge7AWOIXbkPvomelT.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:17', '2024-12-23 16:29:17', NULL),
(99, 'property (11).jpg', 'real_public/PropertiesFiles/RDfwYEeO0EK8JkFBqirLh5lpivwHCkDoa1BBVlMg.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:17', '2024-12-23 16:29:17', NULL),
(100, 'property (3).jpg', 'real_public/PropertiesFiles/18EBSn4kHD628a2XhOBeZ6d1eEbRG0poL55NeUKs.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:17', '2024-12-23 16:29:17', NULL),
(101, 'property (9).jpg', 'real_public/PropertiesFiles/PV5qTdMAhd9nMwklB3LNVccFep9IhrEhOVZaWXL0.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:17', '2024-12-23 16:29:17', NULL),
(102, 'property (11).jpg', 'real_public/PropertiesFiles/zZJcC0O0PT8mUcUv276v0OUU0cf87rrsvWJaMA70.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:17', '2024-12-23 16:29:17', NULL),
(103, 'property (3).jpg', 'real_public/PropertiesFiles/WhadomBuJMdNCmkNvFvY2ldPFqTdCnf2GfgcC1HX.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:17', '2024-12-23 16:29:17', NULL),
(104, 'property (7).jpg', 'real_public/PropertiesFiles/PFqVml7eZO13iq4VRrwduBrIwv9lXalMXB60Uqjz.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:17', '2024-12-23 16:29:17', NULL),
(105, 'property (11).jpg', 'real_public/PropertiesFiles/P8seMsLtIlCHN9KsJcb7hc3cZDTrfLfXXTM6prdI.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:17', '2024-12-23 16:29:17', NULL),
(106, 'property (3).jpg', 'real_public/PropertiesFiles/BLRqWb9E7RCtekITa2gv1n8lteifiBf3QwuxKPPr.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:17', '2024-12-23 16:29:17', NULL),
(107, 'property (9).jpg', 'real_public/PropertiesFiles/vP7PQ2Zs56fKH5PriICJBzNQawqnhNjLmiRZGqVs.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:18', '2024-12-23 16:29:18', NULL),
(108, 'property (8).jpg', 'real_public/PropertiesFiles/GPXAwX4wI6MGu3cdMUUDWc8WBnHaJKIVRZKZjoCk.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:18', '2024-12-23 16:29:18', NULL),
(109, 'property (10).jpg', 'real_public/PropertiesFiles/zZz51XhnE3AYxIFx1rtIUNVyvEXhJwFVSH0gXhL5.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:18', '2024-12-23 16:29:18', NULL),
(110, 'property (9).jpg', 'real_public/PropertiesFiles/R6SopGCjwKDBNgL68PeogCGEneIEgY4wQ6tLhoDE.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:18', '2024-12-23 16:29:18', NULL),
(111, 'property (11).jpg', 'real_public/PropertiesFiles/PZLDra115x3En6qf76JXAMT3VzLVvVUAvMgNJ6Hd.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:18', '2024-12-23 16:29:18', NULL),
(112, 'property (3).jpg', 'real_public/PropertiesFiles/li5HO7rFHCeZZcxSqfMruPwtWNRENIXIdLU8VEhG.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:18', '2024-12-23 16:29:18', NULL),
(113, 'property (3).jpg', 'real_public/PropertiesFiles/dNOY5FkQ80GV8xwsRVJcD0KRMqhCvyWkh3miokQ6.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:18', '2024-12-23 16:29:18', NULL),
(114, 'property (11).jpg', 'real_public/PropertiesFiles/kGbDa8PHdMRELiqVkgjdgk6lw5hy69nq1z83mrHL.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:18', '2024-12-23 16:29:18', NULL),
(115, 'property (5).jpg', 'real_public/PropertiesFiles/Qpv6vkBoIbfFC4Nji3fOdn3jqeGUwDS65nuDD3s5.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 16:29:18', '2024-12-23 16:29:18', NULL),
(116, 'property (1).jpg', 'real_public/PropertiesFiles/zqi4LXnDnfZvcYH7dErPRsGc89JmemvCokqCvdkj.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(117, 'property (11).jpg', 'real_public/PropertiesFiles/6JgPFE9smLBgr2TLvyPfTkEEomM7FXXhbj8p6j6n.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(118, 'property (7).jpg', 'real_public/PropertiesFiles/01IsvpjF6nVMSp3w8apZVLWCaQIDSCTuAAxq4GZl.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(119, 'property (2).jpg', 'real_public/PropertiesFiles/YsgNPEJEpz4QZ0sqe0CWqPAxYmy2Hv4IpNzy1d3i.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(120, 'property (3).jpg', 'real_public/PropertiesFiles/RgTKtH1fCC0mzBmxOPDENM53GPTTZFg10iPQHPP1.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(121, 'property (4).jpg', 'real_public/PropertiesFiles/BviFYXi52wesPaNV1eNp2yzDZn8ZGsLzmvfIEsI4.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(122, 'property (3).jpg', 'real_public/PropertiesFiles/1WfZfcl4xq47bZhg4tTE68stv3Ticv4CtWGCxq1U.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(123, 'property (6).jpg', 'real_public/PropertiesFiles/SsOHUQC1V5X5w671nSOADUpZaB6HcKovQ0Z97MVJ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(124, 'property (5).jpg', 'real_public/PropertiesFiles/djPZiEyb7PXCznA4nNWE4oK2zBrcYuoXcG6AOtTV.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(125, 'property (3).jpg', 'real_public/PropertiesFiles/dp1LnynxGgbZnaiQbniVaFEYksPFgfPLBYTYbS5M.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(126, 'property (9).jpg', 'real_public/PropertiesFiles/GdilpmwFUZh6n4LBxqeF0b5WyH4ZYjQ1PFrCE17h.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(127, 'property (11).jpg', 'real_public/PropertiesFiles/RRYp2g6NCtxSfx7fFf70lUYSRiamWce9kdi15wqG.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(128, 'property (3).jpg', 'real_public/PropertiesFiles/TCcuo3h3eIapiUUCC978NotqgCMvCjo2GnJk3yDl.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(129, 'property (9).jpg', 'real_public/PropertiesFiles/K9WkWjDbJR6Fu78i7iJXvafobKFWSdC0wQoVmcKj.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(130, 'property (11).jpg', 'real_public/PropertiesFiles/NPMcCmeERYq2pI4zAFWa3NfA5QhNJTL2IpBdFSbq.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(131, 'property (3).jpg', 'real_public/PropertiesFiles/s1Cnq8wISUIbRGaOm5m8d3HolUnkO9pU3ecS5Zvk.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(132, 'property (7).jpg', 'real_public/PropertiesFiles/AiFuLRtmatTjeSfGm24etxuQ4IoAOXu3BU489ly0.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(133, 'property (11).jpg', 'real_public/PropertiesFiles/SvpMFIuyqaHYEqtBNVmsePz13Wpj94DN8S4mHMMD.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(134, 'property (3).jpg', 'real_public/PropertiesFiles/MnDcri8TUGBrc4iwz3Ky8UMWfqISdgJ0LhWplWP5.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(135, 'property (9).jpg', 'real_public/PropertiesFiles/aoV3J83bNNgbrHeXn38bMHuWJl0YVcKL9nuuqT3B.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(136, 'property (8).jpg', 'real_public/PropertiesFiles/wYFK0v2Oou8cs3ApPqoWF5c8pj0Q2Jn1TEyBbzpV.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(137, 'property (10).jpg', 'real_public/PropertiesFiles/KW4dH3lD9PT7wIBQX6igk6lW5qIv3BZNOLWLTBx1.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(138, 'property (9).jpg', 'real_public/PropertiesFiles/bPSM5ci9QG0cRjNrUKYP9aLFV3eyJja6DveY4s3v.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(139, 'property (11).jpg', 'real_public/PropertiesFiles/QXNdRcsXnHFBdlieK403jnLSaBQ4qMkw4mvncRmd.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(140, 'property (3).jpg', 'real_public/PropertiesFiles/eF9vS00xO7oNklVaZn3IOYIv6kZsvHUD5OGAxXlQ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(141, 'property (3).jpg', 'real_public/PropertiesFiles/dD3MN3Di2j7QOKGR4pp1JihxqDKhNh1en8LinZeF.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(142, 'property (11).jpg', 'real_public/PropertiesFiles/5IL6hr8alY1iXw3MVByPaBVXzZqNWZvBmlie8mLG.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(143, 'property (5).jpg', 'real_public/PropertiesFiles/sFRNCyWvpz13eKfCg7In8y49No1fAYIUV8Unn95t.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(144, 'property (3).jpg', 'real_public/PropertiesFiles/6vMBFOnDZZjkQzU2jN1Tu4xZp0V76LjwPbOgY1F0.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(145, 'property (11).jpg', 'real_public/PropertiesFiles/y3XqfDjzv4TtJKjUPKxoJeEuMxzApHfX3RHbsNy8.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(146, 'property (5).jpg', 'real_public/PropertiesFiles/W5yg7Qcn8d59SL3868Q2otXdP0adTZj4sBa0VVhs.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(147, 'property (3).jpg', 'real_public/PropertiesFiles/T0PQufvrdAvhnW2p4dHXsbCJMdiOUoOYbArgEJOl.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(148, 'property (11).jpg', 'real_public/PropertiesFiles/iidEPtJc6POrQucxeSh87foGzJ5ck5WhFMaxZZHn.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(149, 'property (5).jpg', 'real_public/PropertiesFiles/vhM2ZtHVjytLl1TGCjFM3hqmBCUeVX4UUYqdzyCD.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(150, 'property (3).jpg', 'real_public/PropertiesFiles/VDXIMK1zoaVYNYP3gJ9BAefhGDei4zEsUgGDSCpX.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(151, 'property (11).jpg', 'real_public/PropertiesFiles/AI2MOJKKuogHElurZ9ELnSmaK3uj7hf5zykeNhmN.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(152, 'property (5).jpg', 'real_public/PropertiesFiles/6Oi2XXFKqMJEotlrhX62geOZNHflQHTNNV62GQkk.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(153, 'property (3).jpg', 'real_public/PropertiesFiles/KUFwSZCfcZhXsvTzDO0WunF2IitCFw00a1VeAxQW.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:18', '2024-12-23 17:15:18', NULL),
(154, 'property (11).jpg', 'real_public/PropertiesFiles/nccmQBLgLxnZQvqJmgj3dK2gZmTauejU1XEWDzNH.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(155, 'property (5).jpg', 'real_public/PropertiesFiles/ThU1Mko0k6EcmP1lBUDGEQl5SkEf4fBZ2Q9vxNtk.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(156, 'property (3).jpg', 'real_public/PropertiesFiles/hImtDVLWEp70YTsCptvi23uZaWdNj4mVHoWpy3BD.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(157, 'property (11).jpg', 'real_public/PropertiesFiles/oqieiDpGv0UHHTmEx0YcD2T7PaGFEpK9vqxtUBeP.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(158, 'property (5).jpg', 'real_public/PropertiesFiles/ABybAOGhvLyRiVnZjT6UJltNSbXo8QrJEYFOqkkg.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(159, 'property (3).jpg', 'real_public/PropertiesFiles/6m7nEQv9ZBeLOPMgFGhE8DeD57wBJEW7qf14jqBx.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(160, 'property (11).jpg', 'real_public/PropertiesFiles/RTAvoUuJNvW4j6EJFrgLLUVI6JMTDoX9JH7H1l3G.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(161, 'property (5).jpg', 'real_public/PropertiesFiles/7571NlnFC3lCUBy384DgxDBRbtL9SMofoDh2m5oc.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(162, 'property (3).jpg', 'real_public/PropertiesFiles/E9Ri7qwtqK3AVMObnlfguRxgidush2zzZs77pAse.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(163, 'property (11).jpg', 'real_public/PropertiesFiles/KcKZAbeAGGY8lyQVxTrdj0VwN0ucdRhcFQI8I2jm.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(164, 'property (5).jpg', 'real_public/PropertiesFiles/54b7Z831CUimRP74NaR6Jh7dmO0tIVoXY7lqDgdd.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(165, 'property (3).jpg', 'real_public/PropertiesFiles/cwBf2Re4tl786sPhWe3Ebm28oeDaZ8pRmwLjPXit.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(166, 'property (11).jpg', 'real_public/PropertiesFiles/U2u1pqFVWemyHbU42bvPF6uyBTZLCLLufVyXt773.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(167, 'property (5).jpg', 'real_public/PropertiesFiles/5hNXyCIzAv5lKk9RgHiSTa3es8RyrZjTxXW16fli.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(168, 'property (3).jpg', 'real_public/PropertiesFiles/VQ0IClcE6AIugF6urKMxgsXajqfyyM2zhcZP8x1U.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(169, 'property (11).jpg', 'real_public/PropertiesFiles/5kkBqbYZpIQMdYmz6Af85Rgmmbi2JUtNC8uzQLcP.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(170, 'property (5).jpg', 'real_public/PropertiesFiles/vKYpZhJshq6zgOxepff9sID0TKQMXLpP6E8HVreQ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(171, 'property (3).jpg', 'real_public/PropertiesFiles/2es3y6mY2ThmKgdcAiHzvWFoImdxYcLOJnZvpVaw.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(172, 'property (11).jpg', 'real_public/PropertiesFiles/brvICSD9huhLvzwOvHni8lRrIdYXM4u84QuVpKmp.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(173, 'property (5).jpg', 'real_public/PropertiesFiles/kCGXPIvUEhpdqz1gh6MJ5Ldhw2VcqzogWqf16HsG.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(174, 'property (3).jpg', 'real_public/PropertiesFiles/qJyX7YHJmGaAQK2H4SR3PPOBZ7K2QSqgwFbi6qHn.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(175, 'property (11).jpg', 'real_public/PropertiesFiles/Xz6EJoImprf2L5eYoVWi6UpL519upk6Bcz0pZzF9.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(176, 'property (5).jpg', 'real_public/PropertiesFiles/QMifTXLsCOz2Ok21OczNO6jbDyy4vUU6FLf9J74q.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(177, 'property (3).jpg', 'real_public/PropertiesFiles/r1P6yzFadKZnfOcq7hmKkYpgSNKCvOcwe2641N7n.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(178, 'property (11).jpg', 'real_public/PropertiesFiles/eMP2JVrRGF2W6uzJacpYIIUuRVHWYjdJu1am7JQU.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(179, 'property (5).jpg', 'real_public/PropertiesFiles/sgbGUwnBoXPY1n8f5afOQfQEy3BComqHqz1jkOvG.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(180, 'property (3).jpg', 'real_public/PropertiesFiles/ZmsWlZmxquzvCTUOuvQKIhwFW2ueCEwU0Lkhclwz.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(181, 'property (11).jpg', 'real_public/PropertiesFiles/5NBWhsmbhWluVK4Wt9qPdZ7KfnH2Pcdy8joaShc9.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(182, 'property (5).jpg', 'real_public/PropertiesFiles/b8bG0zzsvKgVx2eA2lUeywNT57dcVUVpDrPOc2aw.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(183, 'property (3).jpg', 'real_public/PropertiesFiles/BZAIFUNYVTj43XCD3fKlePhFNv75CzEWH8Pzksct.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(184, 'property (11).jpg', 'real_public/PropertiesFiles/ZOtM9BQBdFxxb1SiyEelQIuvcCKmwoOGR78ZZPnX.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(185, 'property (5).jpg', 'real_public/PropertiesFiles/V9mcdzFk2gTAmf7yqo65Efa6Tsbmxp5X0tEC3vly.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(186, 'property (3).jpg', 'real_public/PropertiesFiles/Mq7GmQHHOgJsfWD3biaRgawskHZMjJtUR0kZBfFK.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(187, 'property (11).jpg', 'real_public/PropertiesFiles/9hQEYwfF9gVOEffjNQhYc97Rk2Dwp9vINqoa7zrN.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(188, 'property (5).jpg', 'real_public/PropertiesFiles/lizdmN7Wu9YNKFHCOp1uaYm05XqxvHreGAge2v0F.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(189, 'property (3).jpg', 'real_public/PropertiesFiles/rJj0AesL1R4g2IKwGW2k9rIH7PqBwr0wjeYE6oVJ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(190, 'property (11).jpg', 'real_public/PropertiesFiles/0xjIP1rLdK0tP6u8ixCs5iIFOXaDoDQK0J0Y2nDD.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(191, 'property (5).jpg', 'real_public/PropertiesFiles/uV7aW3VvTff1mnL51e7NP6LlFiiSljJWC90vxJgO.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(192, 'property (3).jpg', 'real_public/PropertiesFiles/co0F5WjGMu6JdVOoRoSZdW7bdlbv8Il26Wc6vq9T.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(193, 'property (11).jpg', 'real_public/PropertiesFiles/U79sgwImXcdv9qrkKtLaNeeulWme6vFdHtJDovgi.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(194, 'property (5).jpg', 'real_public/PropertiesFiles/7jKSuel3lPCyej5gIKoW3uD6yoxjNvNIEZSbXcHP.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(195, 'property (3).jpg', 'real_public/PropertiesFiles/kQ8jOpJoHq2KOdCh4GP3pGapIbf88i8tJ6vcvvcV.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(196, 'property (11).jpg', 'real_public/PropertiesFiles/FdimNMtNBbXzPxt061VipaoShM3soedR2c7dX9Bf.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(197, 'property (5).jpg', 'real_public/PropertiesFiles/J4hXdCkaVdXKfonclHRHETqb25XlBXvyqOB7tw0T.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:19', '2024-12-23 17:15:19', NULL),
(198, 'property (3).jpg', 'real_public/PropertiesFiles/uYNlbW97btKvWaB5DlZzCxaF3XhITdJdi3N3tsv9.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:20', '2024-12-23 17:15:20', NULL),
(199, 'property (11).jpg', 'real_public/PropertiesFiles/6F5uBi5ks38NOOedO6zh0ZnRJXqCIgrQPM5OiY6H.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:20', '2024-12-23 17:15:20', NULL),
(200, 'property (5).jpg', 'real_public/PropertiesFiles/Hp6Y2PLQqnCaT1G4Fb1HnFU4Z0hReSMe1KzAM2Hg.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:20', '2024-12-23 17:15:20', NULL),
(201, 'property (3).jpg', 'real_public/PropertiesFiles/RFhnteAPLlNvGM0NDYHwly6MQCYwocOvRsFkVgLV.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:20', '2024-12-23 17:15:20', NULL),
(202, 'property (11).jpg', 'real_public/PropertiesFiles/NojU76VBKzd74k5Zzhp5Cl7UFcxkbjSthFqdUTGW.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:20', '2024-12-23 17:15:20', NULL),
(203, 'property (5).jpg', 'real_public/PropertiesFiles/noCe3PcJBFtxdxA8k3eLyNBPhkj1pW7ZbR6AZy7y.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:20', '2024-12-23 17:15:20', NULL),
(204, 'property (3).jpg', 'real_public/PropertiesFiles/tUpzi96BvlYgsRBPYDlwXm24RQo3DzmAbZQ77hzx.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:20', '2024-12-23 17:15:20', NULL),
(205, 'property (11).jpg', 'real_public/PropertiesFiles/Hvmp1N54Jk29igemqHmtEM4ZulEv0eNajV2paAKc.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:20', '2024-12-23 17:15:20', NULL),
(206, 'property (5).jpg', 'real_public/PropertiesFiles/lOevoA1sykQTyFVCnEs4DBgETlgPlDv8AUGTRcJN.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:20', '2024-12-23 17:15:20', NULL),
(207, 'property (3).jpg', 'real_public/PropertiesFiles/S8YtAmsm2raxBrcKQgO90tyMxDbBr9fHfWfZjHTk.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:20', '2024-12-23 17:15:20', NULL),
(208, 'property (11).jpg', 'real_public/PropertiesFiles/ncKz6pSrSrMjEp5SFebpty7IWCTWJEMVIOvHqMgA.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:20', '2024-12-23 17:15:20', NULL),
(209, 'property (5).jpg', 'real_public/PropertiesFiles/h5SCT9ap2q40IFuZVBGR34uUyqwJEp5vXma6J2Mo.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:20', '2024-12-23 17:15:20', NULL),
(210, 'property (3).jpg', 'real_public/PropertiesFiles/gDj9oRbqJxnoQlPzrICfcWpzsHzyoSoFg2lTcMQo.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:20', '2024-12-23 17:15:20', NULL),
(211, 'property (11).jpg', 'real_public/PropertiesFiles/fEEKV4Yrw4jW65TzP9E6HuBTJMHFNjHqLVOkhVri.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:20', '2024-12-23 17:15:20', NULL),
(212, 'property (5).jpg', 'real_public/PropertiesFiles/f6h9rW4O9cMcDg1F9uieIMhniGZLZeu5r50zRWGs.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:20', '2024-12-23 17:15:20', NULL),
(213, 'property (3).jpg', 'real_public/PropertiesFiles/pjaYhcHzgz6f373Nprd18Natz0iOxrNdPf4IMeb9.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:20', '2024-12-23 17:15:20', NULL),
(214, 'property (11).jpg', 'real_public/PropertiesFiles/S1POk1TbKJonW0IvUHpRLHwMlqARtp5x6lMQ1cjf.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:20', '2024-12-23 17:15:20', NULL),
(215, 'property (5).jpg', 'real_public/PropertiesFiles/i4M8Z1RmcyEEjHoGgau7i4XoSyKA8UZ5MzrmOrGl.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:20', '2024-12-23 17:15:20', NULL),
(216, 'property (3).jpg', 'real_public/PropertiesFiles/QbpxFWMJ02hIEBs47MesRESOIl75bOmhUELLopko.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:20', '2024-12-23 17:15:20', NULL),
(217, 'property (11).jpg', 'real_public/PropertiesFiles/lmRy5gEJWvyD2ftzteGlkourYSZI4ModZnFkR8hA.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:20', '2024-12-23 17:15:20', NULL),
(218, 'property (5).jpg', 'real_public/PropertiesFiles/a9k53jiC0Rg8CVgf7M0NpeU6V346Kvd0mhtPeYSz.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:20', '2024-12-23 17:15:20', NULL),
(219, 'property (3).jpg', 'real_public/PropertiesFiles/RCfcpBvn72hCUMZOUzTeDI4eS3KT13ZbV2sn69bs.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:20', '2024-12-23 17:15:20', NULL),
(220, 'property (11).jpg', 'real_public/PropertiesFiles/NC5bIuVjB9LpEaJQvmPYcLP592vztkIRHZA0UoHn.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:20', '2024-12-23 17:15:20', NULL),
(221, 'property (5).jpg', 'real_public/PropertiesFiles/0KLpjpQ3vYZZqFHvtkrTcLXlRngYbnPu0jwRliKr.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:20', '2024-12-23 17:15:20', NULL),
(222, 'property (3).jpg', 'real_public/PropertiesFiles/zeSJ1RWQtzSAGgqcZYCO83HWfjSxx0okyArnbQuC.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:20', '2024-12-23 17:15:20', NULL),
(223, 'property (11).jpg', 'real_public/PropertiesFiles/TLxQIurSXfskQ6PKEgaGjBv1wP5Ck8GywGIr03Fm.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:21', '2024-12-23 17:15:21', NULL),
(224, 'property (5).jpg', 'real_public/PropertiesFiles/ATeDAUkMu7nI4sPGBtap3cOu2omIVi9viqVLvNAd.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:21', '2024-12-23 17:15:21', NULL),
(225, 'property (3).jpg', 'real_public/PropertiesFiles/p53e3uYiRD2Nxxs9IV0z6uOmGQXfWEjhtQrxNjoP.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:21', '2024-12-23 17:15:21', NULL),
(226, 'property (11).jpg', 'real_public/PropertiesFiles/q9z7VKkJdNBlSPqZUhwZTHDWWUU7wINhRjogp3Mi.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:21', '2024-12-23 17:15:21', NULL),
(227, 'property (5).jpg', 'real_public/PropertiesFiles/wGc8OurYRbPDjGRnQgpvhCZf5SYzr7S2SdnSZ9aZ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:21', '2024-12-23 17:15:21', NULL),
(228, 'property (3).jpg', 'real_public/PropertiesFiles/tsRWBpmpVtELpo8EG65JRC4775swr965g13buVDq.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:21', '2024-12-23 17:15:21', NULL),
(229, 'property (11).jpg', 'real_public/PropertiesFiles/LzQhX0ZfkeXTfDKCBD4LWMVXsfGJWMl25sbVxkI9.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:21', '2024-12-23 17:15:21', NULL),
(230, 'property (5).jpg', 'real_public/PropertiesFiles/B5OthRG0cprxCaZ8RnW7FJPtjq3tm5fHcBmgjxmm.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:21', '2024-12-23 17:15:21', NULL),
(231, 'property (3).jpg', 'real_public/PropertiesFiles/nl2Mlr8ojCv03zIlfRnnZIP4PJf0GYi3N3AvZUCp.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:21', '2024-12-23 17:15:21', NULL),
(232, 'property (11).jpg', 'real_public/PropertiesFiles/7a8uRSFMw9PjPnsw6JAMaWMfVmRNDGnldDhijmp9.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:21', '2024-12-23 17:15:21', NULL),
(233, 'property (5).jpg', 'real_public/PropertiesFiles/3XJW8S9W7Odruo64KjrHXzjLl1OwKuR5j9oA49ZD.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:21', '2024-12-23 17:15:21', NULL),
(234, 'property (3).jpg', 'real_public/PropertiesFiles/P9rDRqdILI6tF5YGF7DUK865XDHwmbJXyJEOYPMI.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:21', '2024-12-23 17:15:21', NULL),
(235, 'property (11).jpg', 'real_public/PropertiesFiles/JuBqMaT9767EijN2njPDjYB1PXvA4SZOHDUWJpIR.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:21', '2024-12-23 17:15:21', NULL),
(236, 'property (5).jpg', 'real_public/PropertiesFiles/VptMXudvgclAlv4uy7DNJEYSugtJstac9PzyiP4f.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:21', '2024-12-23 17:15:21', NULL),
(237, 'property (3).jpg', 'real_public/PropertiesFiles/DKrZNdpTowieh5BEM7kLS8r6Jk3UGMX4AO19CHrM.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:21', '2024-12-23 17:15:21', NULL),
(238, 'property (11).jpg', 'real_public/PropertiesFiles/sBFRlKHiZ8qP8zVJs6hU3QWmq11wk4QdneAeQAuH.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:21', '2024-12-23 17:15:21', NULL),
(239, 'property (5).jpg', 'real_public/PropertiesFiles/IZxuaCJ4NlZsh9bhgReTU631AoFMsZ7Mg75slMow.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:21', '2024-12-23 17:15:21', NULL),
(240, 'property (3).jpg', 'real_public/PropertiesFiles/N8IP1nuIIsQtgTDEokcTYHWemuxmuElupTfUFbb5.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:21', '2024-12-23 17:15:21', NULL),
(241, 'property (11).jpg', 'real_public/PropertiesFiles/6uCEFEBYq96a83pPdw0lanTHTnnmlvlEO4IC8szu.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:21', '2024-12-23 17:15:21', NULL),
(242, 'property (5).jpg', 'real_public/PropertiesFiles/2FC08UqiFHajAdINSFhtT6FVRkn4NIUpV0k2tHSj.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:21', '2024-12-23 17:15:21', NULL),
(243, 'property (3).jpg', 'real_public/PropertiesFiles/9q0hyZbwVgKGUSm0mjI48T0ouvAQ1pj3LuOG2kCG.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:21', '2024-12-23 17:15:21', NULL),
(244, 'property (11).jpg', 'real_public/PropertiesFiles/iAMLlroj49HJ9ARveTgVbGVQyuBjLsdWrd50qF3U.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:22', '2024-12-23 17:15:22', NULL),
(245, 'property (5).jpg', 'real_public/PropertiesFiles/ZiXnIY1ziQWQBcxCYmqpfxCsQKXnH9Y3AVeDdVpJ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:22', '2024-12-23 17:15:22', NULL),
(246, 'property (3).jpg', 'real_public/PropertiesFiles/8CQZMX3LNwnOvyC0EBcAPObgwpG09Lm72edQL2s0.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:22', '2024-12-23 17:15:22', NULL),
(247, 'property (11).jpg', 'real_public/PropertiesFiles/IqgLhGTGnu7o4h8w0Jdf4ayTrGNySOLBCtgEjV4C.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:22', '2024-12-23 17:15:22', NULL),
(248, 'property (5).jpg', 'real_public/PropertiesFiles/UCdj8MUCTJtSgFCFRIe4Xn1ut2lubceyM1GEgsqk.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:22', '2024-12-23 17:15:22', NULL),
(249, 'property (3).jpg', 'real_public/PropertiesFiles/EsUHeTlWViEirTtIXoWmwORM6OLnDFmQtEzMwspS.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:22', '2024-12-23 17:15:22', NULL),
(250, 'property (11).jpg', 'real_public/PropertiesFiles/YzxdMaOFpYTH2NczP4I9qy7wJblgPq58jUhUMNmq.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:22', '2024-12-23 17:15:22', NULL),
(251, 'property (5).jpg', 'real_public/PropertiesFiles/AnToQE9NMZbq5LL2ywY6vCgaGUtCrAbD3v4DMBKQ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:22', '2024-12-23 17:15:22', NULL),
(252, 'property (3).jpg', 'real_public/PropertiesFiles/1FZDwLJyQGbjUvxhumwbxwSiBskeZMokCX3kjVKV.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:22', '2024-12-23 17:15:22', NULL),
(253, 'property (11).jpg', 'real_public/PropertiesFiles/8h7A0o3T9k6H5ldOqUC66wv6XHyfUitNaTi3hD7E.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:22', '2024-12-23 17:15:22', NULL),
(254, 'property (5).jpg', 'real_public/PropertiesFiles/msU5EkJisW3l87GzFld5voqCdJXFI6AA9osQNwp3.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:22', '2024-12-23 17:15:22', NULL),
(255, 'property (3).jpg', 'real_public/PropertiesFiles/fm5uemiXjrI4h9BsBoirhmBnj6HxirBU70jWmkrj.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:22', '2024-12-23 17:15:22', NULL),
(256, 'property (11).jpg', 'real_public/PropertiesFiles/qjnbOeH02nPr5KgJQoyUYNfu2JJM0h5w7bhcTiwj.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:23', '2024-12-23 17:15:23', NULL),
(257, 'property (5).jpg', 'real_public/PropertiesFiles/s8K6Jn9gBy9To8V4nuWeO7wBHxDA8mYWXvXeUGDy.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:23', '2024-12-23 17:15:23', NULL),
(258, 'property (3).jpg', 'real_public/PropertiesFiles/EnaWQnOlVslFpA3mnybdg9NBIRvXRhI73BHBjvDt.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:23', '2024-12-23 17:15:23', NULL),
(259, 'property (11).jpg', 'real_public/PropertiesFiles/HRPYmgvZ6D6RWNQucJFYDyad3a0TcSD3C9WBgfsA.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:23', '2024-12-23 17:15:23', NULL),
(260, 'property (5).jpg', 'real_public/PropertiesFiles/uFgYK3teFTnOGOES8prbMH28kg03pHs6AYwisfXR.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:23', '2024-12-23 17:15:23', NULL),
(261, 'property (3).jpg', 'real_public/PropertiesFiles/aDseBG6Yea8HJ9b78IxDzHkxjrVqW5vgmmWSESd4.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:23', '2024-12-23 17:15:23', NULL),
(262, 'property (11).jpg', 'real_public/PropertiesFiles/Qsv8Of3ZnDUNosF9QeLunNupTJl2AMZxs4lI6YLy.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:23', '2024-12-23 17:15:23', NULL),
(263, 'property (5).jpg', 'real_public/PropertiesFiles/plZIiaVWGoC5wsZHHQq4oFtjSK7xlOB7aYiveG2S.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:23', '2024-12-23 17:15:23', NULL),
(264, 'property (3).jpg', 'real_public/PropertiesFiles/H7QZp61Ay1ahMhIjeRBxSjxEaay3PiaLvRlaJotx.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:23', '2024-12-23 17:15:23', NULL),
(265, 'property (11).jpg', 'real_public/PropertiesFiles/yLnGKKwaOouWPgZFj85BX7dZYv7AAJ1VY8vN7Vkc.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:23', '2024-12-23 17:15:23', NULL),
(266, 'property (5).jpg', 'real_public/PropertiesFiles/5VsOWUJRRDhqninkNlf5T03gp2tEejAtM4UZBJIm.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:23', '2024-12-23 17:15:23', NULL),
(267, 'property (3).jpg', 'real_public/PropertiesFiles/vnjPRGE8bQ1QXf7n1rqEBRRAwYaQ3UgXelt037Up.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:23', '2024-12-23 17:15:23', NULL),
(268, 'property (11).jpg', 'real_public/PropertiesFiles/ikDIH5F9bmK7ceBHZAAkewji79De1fkfyHTJ2cRi.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:23', '2024-12-23 17:15:23', NULL),
(269, 'property (5).jpg', 'real_public/PropertiesFiles/cuKKcksKrSpBRuE6h9WLVP9I7JJUSHhwMiMmLZSP.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:23', '2024-12-23 17:15:23', NULL),
(270, 'property (3).jpg', 'real_public/PropertiesFiles/7ahTiQMXxXba7CF43R4npuf3dyZfHWbOQggJoNdV.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:23', '2024-12-23 17:15:23', NULL),
(271, 'property (11).jpg', 'real_public/PropertiesFiles/OfTbiQWxIj1u5awZzns29ZFJXYiFhvWTQu5EUYUs.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:23', '2024-12-23 17:15:23', NULL),
(272, 'property (5).jpg', 'real_public/PropertiesFiles/nqb5CBUtHLOtYvWW7LTpRxwvafy1Y7bUKCaGZ5b0.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:23', '2024-12-23 17:15:23', NULL),
(273, 'property (3).jpg', 'real_public/PropertiesFiles/sqMMGFrp65sKRCBpRg3fZheKzJ2Lfi7Fdal8sXkp.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:23', '2024-12-23 17:15:23', NULL),
(274, 'property (11).jpg', 'real_public/PropertiesFiles/MsD2Nprdszq0RSfd6tfJw7GYBVZSamaOnlTc4Zbt.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:24', '2024-12-23 17:15:24', NULL),
(275, 'property (5).jpg', 'real_public/PropertiesFiles/kQFbXhPLNX5ZmCY9d5FABZzqaUPSGL8SoEtv9Rke.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:24', '2024-12-23 17:15:24', NULL),
(276, 'property (3).jpg', 'real_public/PropertiesFiles/0fadt6STll0zoI7mkVWGjKlv7fa8DeQJGvs6S5NN.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:24', '2024-12-23 17:15:24', NULL),
(277, 'property (11).jpg', 'real_public/PropertiesFiles/972y9uXkF35uP2Tp3yPUz41bgVTbYgx6xbHhnyxZ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:24', '2024-12-23 17:15:24', NULL),
(278, 'property (5).jpg', 'real_public/PropertiesFiles/tGpqjA07NwsQBdiBDBcszFifOSNIVUPT2gl9wGy5.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:24', '2024-12-23 17:15:24', NULL),
(279, 'property (3).jpg', 'real_public/PropertiesFiles/ZF3Ox4WR8DidS4kfXi7f2bG3O4bMBTgv4SizJpc9.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:24', '2024-12-23 17:15:24', NULL),
(280, 'property (11).jpg', 'real_public/PropertiesFiles/Dzq7rDi3rJjyVlBvslSiVfU17BydBjgTETzOg7lB.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:24', '2024-12-23 17:15:24', NULL),
(281, 'property (5).jpg', 'real_public/PropertiesFiles/rbh9m88JVpUH5zW260HY2SXSW2CC4nP6jBN6Tvy6.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:24', '2024-12-23 17:15:24', NULL),
(282, 'property (3).jpg', 'real_public/PropertiesFiles/OEfFal33Cw154wx0Ve1giPACPDBx3tEijAo4yat0.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:24', '2024-12-23 17:15:24', NULL),
(283, 'property (11).jpg', 'real_public/PropertiesFiles/eSikHmtJoJJYYMxuqmc4OSr1zThJLd0A6IQc1iFf.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:24', '2024-12-23 17:15:24', NULL),
(284, 'property (5).jpg', 'real_public/PropertiesFiles/Q0LdVfkhcLwULwh4W1LnOj7eNa72QyU7nAjeI0ob.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:15:24', '2024-12-23 17:15:24', NULL),
(285, 'property (1).jpg', 'real_public/PropertiesFiles/rbIvqI3KuCD9y7QKQhcBdDcAA8H9ty6bMdgbEAEX.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(286, 'property (11).jpg', 'real_public/PropertiesFiles/nD0xEnUnbjiiK5m9Q8cxJWWIAuFR94pUbSguYryU.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(287, 'property (7).jpg', 'real_public/PropertiesFiles/yCkhp3U90gRmjUQvY9ZDdh64QTZQjYpkMBM0qQG7.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(288, 'property (2).jpg', 'real_public/PropertiesFiles/irz83vf5wheQxZr464tu7sBx64RDlkrYDGthlXxo.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(289, 'property (3).jpg', 'real_public/PropertiesFiles/SFe8EbbSrNCQdZROpgX2bF07FwGs9JGONnetSF6W.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(290, 'property (4).jpg', 'real_public/PropertiesFiles/Hl1MlxgWThnEAbntKSkJlOnwKlifeJoGLPa2PPuF.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(291, 'property (3).jpg', 'real_public/PropertiesFiles/wSDrJYL2Z3Bjtganv3dvSNMDapaie9ysUCSFs1zz.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(292, 'property (6).jpg', 'real_public/PropertiesFiles/akbNUtDpEOV5eD2nYPdZMLF24XFLhtgKHnmo6IRp.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(293, 'property (5).jpg', 'real_public/PropertiesFiles/AXlHxskLJmfEpfJkXgup6uR0oXTZOWInTkuyiOXY.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(294, 'property (3).jpg', 'real_public/PropertiesFiles/piBQbPNuXIn5hC5tHVGnZGHTfvsrFnpOYxSywGae.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(295, 'property (9).jpg', 'real_public/PropertiesFiles/M5bojzL0eJnYuCNtDOiVMPd7MzURK4r9kqyY3jTI.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(296, 'property (11).jpg', 'real_public/PropertiesFiles/YxlYDG545fuml26Q10gtoh820trpyWatCk5Dv7Zp.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(297, 'property (3).jpg', 'real_public/PropertiesFiles/SsFcSiir2dPvJ5ltIhNOmppl8R6cpkKSSEmac6hD.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(298, 'property (9).jpg', 'real_public/PropertiesFiles/s6RNKBQFKTKVsOlnI8guQnnVKBXnnDyUFhH0E8lg.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(299, 'property (11).jpg', 'real_public/PropertiesFiles/EiseM32KBADHcYeid9HbL0gCiR1gmq30uYuOGtF7.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(300, 'property (3).jpg', 'real_public/PropertiesFiles/QaHOnXBsILjaTHEb572hj2jBuX1Q2MJL0uAMBzYi.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(301, 'property (7).jpg', 'real_public/PropertiesFiles/YDb66iwamfmyEiIzEiSNmlVFQ7hCp1JsJ3GlSfig.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(302, 'property (11).jpg', 'real_public/PropertiesFiles/mJjxuvcdWLeWhAJsZPBBvfac6oe476DmnZrl2YZF.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(303, 'property (3).jpg', 'real_public/PropertiesFiles/b7YVWKJ5lGAyoCdJMUqSwLjmlIaQMNiz7X4rmA13.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(304, 'property (9).jpg', 'real_public/PropertiesFiles/mYR73aFAlXp6lusLOYcWfWEBjMJOLzIjHDgGxRBg.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(305, 'property (8).jpg', 'real_public/PropertiesFiles/QfqnFNtaVs5xqbkiraWm5RtxEh2kuFRPWVCA4IQi.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(306, 'property (10).jpg', 'real_public/PropertiesFiles/XKbweB0irGxDYS63MZxLrxoCBeqb4SVVKBl2fLQ4.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(307, 'property (9).jpg', 'real_public/PropertiesFiles/wrE818NFfaZidREvx3nWvZvEAnoPho8Dixm6eDDj.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(308, 'property (11).jpg', 'real_public/PropertiesFiles/AecA0OuKxgJ4uPLI8AHiMqpwr4nIzPGx0Fl3UcmM.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(309, 'property (3).jpg', 'real_public/PropertiesFiles/orI9ou1WsOQMrg4opwLbvSn2GCWbn51gm661JRo8.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(310, 'property (3).jpg', 'real_public/PropertiesFiles/1xazGvwFQsdLHEzyfifyw2BsRAauri2fsa7eWQPs.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(311, 'property (11).jpg', 'real_public/PropertiesFiles/3aGudd3654nUGGKxccOLq9qq2KgEF9FM5idpYlVJ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(312, 'property (5).jpg', 'real_public/PropertiesFiles/Lk7HnJhgyo6g2RdRNOEDQjdCvHaWA7GndBH2A6cU.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(313, 'property (3).jpg', 'real_public/PropertiesFiles/f79DIQH0CkUUFvMXqj6kpE0saZdBNWyUI2F2PbXe.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(314, 'property (11).jpg', 'real_public/PropertiesFiles/pAvlcEY21QnKgMC5ovJPdK89HbdJSUQtiGJTcTI5.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(315, 'property (5).jpg', 'real_public/PropertiesFiles/W92NRzxHlCQ2UIjUWTCqYz0vu0GVJbcKgW4aMPBz.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(316, 'property (3).jpg', 'real_public/PropertiesFiles/ONGBF37EaHcR95LGHriDZriCeYXiJjddnpjUDnZn.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(317, 'property (11).jpg', 'real_public/PropertiesFiles/khHIgg3kic0KTmxHtvvjeXmoygfNvr0ogymNqDUO.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(318, 'property (5).jpg', 'real_public/PropertiesFiles/AeFn2kzaIK2H9D4WRdwFSa7I1hdp4xQJaZThz1Tw.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(319, 'property (3).jpg', 'real_public/PropertiesFiles/reyK1csdRUh8CK18UndPRFbY0M5uWosbufRMoUlN.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(320, 'property (11).jpg', 'real_public/PropertiesFiles/cJRJJIuy6w9885zuR6H0B0NRhXXNG5SXBQXXKdnr.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(321, 'property (5).jpg', 'real_public/PropertiesFiles/Mr6mjMiU9i2PyzOKzHZGdBwNwWVAkhJvF2IUt7kb.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:04', '2024-12-23 17:19:04', NULL),
(322, 'property (3).jpg', 'real_public/PropertiesFiles/xAX9L5K3qZbqJb4ccMsxmYGVYcQsfWvequCydOeB.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(323, 'property (11).jpg', 'real_public/PropertiesFiles/ofzGy0Y5JIqwrwvTMILOF6ZQakAWyVh7JpNOpcaQ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(324, 'property (5).jpg', 'real_public/PropertiesFiles/9plQraKwr0sxDYftKrWmfEZuTfuAkbm5DsOeAteS.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(325, 'property (3).jpg', 'real_public/PropertiesFiles/gBUVdKxJcMe6TxG08rYijKFUFqBAy4w5yoXOgGgK.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(326, 'property (11).jpg', 'real_public/PropertiesFiles/AuU9ZouwzgSdQWGKE00BIQ9OVV7CSxyVUc4YOFdD.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(327, 'property (5).jpg', 'real_public/PropertiesFiles/qlRlttU5iSRYccxYASacVM9nn5rTUkepBlHrgqVV.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(328, 'property (3).jpg', 'real_public/PropertiesFiles/zXzNL3060v5fAatrDUEeBuC2eHpML3hObPF9TBlm.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(329, 'property (11).jpg', 'real_public/PropertiesFiles/m0n52UaBuADxBW1dA0wsdK5vmHrMU9iW5fWOXXs0.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(330, 'property (5).jpg', 'real_public/PropertiesFiles/pUAjIcsv4yazqxEPLtgRmSDmKefPmpqUJYkGD7aD.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(331, 'property (3).jpg', 'real_public/PropertiesFiles/r6zqsGlN6ccbTVRPooWBECUFqmwRwRTg4iH1yeAN.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(332, 'property (11).jpg', 'real_public/PropertiesFiles/2HlrZwnedK0iWLWsP6p1V2Y4PFDIwRShO3SrH80N.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(333, 'property (5).jpg', 'real_public/PropertiesFiles/LTFBtBTcywdw2HG1MI2Ii8nMkAhOz32rVE9WeENL.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(334, 'property (3).jpg', 'real_public/PropertiesFiles/tHQiovZiHdFLhkEeI7IywcdiV0TrXJtHwds1EUi9.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(335, 'property (11).jpg', 'real_public/PropertiesFiles/bQD9IED8W6I7oVmoPUsPKfA0DhOcZnzEd2mxGBvb.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(336, 'property (5).jpg', 'real_public/PropertiesFiles/9KDrtj8wTOXQ5v57J3Ri76T2cJQwHiAoY73kCGia.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(337, 'property (3).jpg', 'real_public/PropertiesFiles/ZJ9uwWjOpc0QPNTuZN7CzrkbmcwOSLQmhak39lTY.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(338, 'property (11).jpg', 'real_public/PropertiesFiles/zuWLhJLpZUhO7kKQjFWRxPa9WHSHKp5HO8TySOZy.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(339, 'property (5).jpg', 'real_public/PropertiesFiles/174QJbwBB2t9AI3vSWnbVdF0S6KyC7WSjMvkhCGA.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(341, 'property (11).jpg', 'real_public/PropertiesFiles/bf27lndrtzrixfROFELJl5ibWAtnnZEPcrPlvZz5.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(342, 'property (5).jpg', 'real_public/PropertiesFiles/CR5P4iNNEd3RVtFHQINbbhEjsYmkwWTpL39LxSIw.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(343, 'property (3).jpg', 'real_public/PropertiesFiles/lEie9IOWZLYVb8UTUJa4Hvc6oWQxm4Kf1ITQhYuX.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(344, 'property (11).jpg', 'real_public/PropertiesFiles/ZnDDij44Nx8BGZsOZiAeOuCTmKvuqkBJNCOuzTgk.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(345, 'property (5).jpg', 'real_public/PropertiesFiles/YybLCjNRhoAyo2QPNa7K11RbZnhGP58B70C10C8E.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(346, 'property (3).jpg', 'real_public/PropertiesFiles/xM2YUhMb6CJyyxWptrENBWMQR71i2qFbw7wk2yqE.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(347, 'property (11).jpg', 'real_public/PropertiesFiles/OSdjuSSQYshNoaaDTwizrUI8QAVCFN2n8bJlPFML.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(348, 'property (5).jpg', 'real_public/PropertiesFiles/tySt97gm7nv2uavc4KrvMqbsyzG1fxOjxlVZ1ECR.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(349, 'property (3).jpg', 'real_public/PropertiesFiles/fcM5ccfhAUSXUG0GBaN7VwSrJTlveyvCgs5hsvfZ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(350, 'property (11).jpg', 'real_public/PropertiesFiles/ZdHFzki9hWGC202e8vMF7WgBzUa0JENn6YsOhS5B.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(351, 'property (5).jpg', 'real_public/PropertiesFiles/BKtYu8foVBRHxBlcVmvKPUHf5Z6NMLjnxKxpJ3s3.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(352, 'property (3).jpg', 'real_public/PropertiesFiles/bqcAdjFZlVn2jwMGisBapekvzNDNLcwspIdBzRvv.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(353, 'property (11).jpg', 'real_public/PropertiesFiles/Q8pWrZ5fxUt901sRsHcItQwsFspqq6gwR41rjA8P.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(354, 'property (5).jpg', 'real_public/PropertiesFiles/aN39LUoIcdZJxcG3SbzzCgxrRn3jIvaziTI9EnW6.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(355, 'property (3).jpg', 'real_public/PropertiesFiles/6gCu4Nf2E4ZF8XdQmicwangImhjUqPVdpfCRqu1b.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(356, 'property (11).jpg', 'real_public/PropertiesFiles/nAJG5OpnMF6tNzsBR4iUHomwS0lY2e5yukOj9RuR.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(357, 'property (5).jpg', 'real_public/PropertiesFiles/y1WGVFpelMXyrt46h5dHLQ1UNsSV4ZmrOegVQrLD.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(358, 'property (3).jpg', 'real_public/PropertiesFiles/uU4kad2Gw9kLV5kEKb6H32MOqPvAtVVjXZgAah3n.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(359, 'property (11).jpg', 'real_public/PropertiesFiles/mUkDA7mmJeamuocFH2MgIzq5ccwd0Jn5i291JjgX.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(360, 'property (5).jpg', 'real_public/PropertiesFiles/qdUXI117PjSoDZYYZvS2O463OGm7jufUuIEwLPOJ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(361, 'property (3).jpg', 'real_public/PropertiesFiles/u8JwBnypk5b2dt7G4yk2S0r1MMCD0G8La5tDoeEF.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(362, 'property (11).jpg', 'real_public/PropertiesFiles/4Xoa2Ig5sfmZwfK5YjKQSzZF2BRoQ7Kla7CNt1Cj.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(363, 'property (5).jpg', 'real_public/PropertiesFiles/clDKFaqmBOkim6uGhgEmSRsnOfnGrcfbQvy9JXap.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(364, 'property (3).jpg', 'real_public/PropertiesFiles/XHxI0JjasnuGYSTl7HTPur71vqtLNlKkZt3M00V7.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL);
INSERT INTO `uploads` (`id`, `file_original_name`, `file_name`, `file_size`, `extension`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(365, 'property (11).jpg', 'real_public/PropertiesFiles/9l1lOBtUlt7WL7WZtWErF35ozrnYWiISvRNzLk1a.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(366, 'property (5).jpg', 'real_public/PropertiesFiles/p7iwhIMQDWVqTCm6Wak0clyAuB6UsSZYGjwTsTV8.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(367, 'property (3).jpg', 'real_public/PropertiesFiles/6NhEwu2eXtsdlq0i0UTZAJtzM8OIHJWSa9eeuLgP.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(368, 'property (11).jpg', 'real_public/PropertiesFiles/pNhjipUSyayk4cfeLvd8aohWEMhGPjOavcIPkRE9.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(369, 'property (5).jpg', 'real_public/PropertiesFiles/FAbOTuUeWHv2UmXggFcYCU1TYJKfJEf47RK4OKkG.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(370, 'property (3).jpg', 'real_public/PropertiesFiles/ANkOhGkIeKeG0dChM5NKeN7X2wMRuzbL7SMZw1ip.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(371, 'property (11).jpg', 'real_public/PropertiesFiles/530OQupABYVMfCwQWZLxMR3ZspBYU5GfD3hU8mSG.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(372, 'property (5).jpg', 'real_public/PropertiesFiles/Bu6czXRoM03aRplkkbCiRG6abg0flq1DOYVlnjwW.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(373, 'property (3).jpg', 'real_public/PropertiesFiles/lIhXjufg713CJ6ooqJ8oWsMYx5b5WF7LEYCAZjFo.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(374, 'property (11).jpg', 'real_public/PropertiesFiles/wSL7ieLqJwTQ5I9MxxRXdLYrLNryz4mP5w6CY2hp.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(375, 'property (5).jpg', 'real_public/PropertiesFiles/w76pXgHrO3mrhUa8S2P55vXhqy4T3EqFBvrUmmVP.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(376, 'property (3).jpg', 'real_public/PropertiesFiles/UA2WQhDpnoUOFtndd3fTLK1LhlN3NCqN5RbfDmU8.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(377, 'property (11).jpg', 'real_public/PropertiesFiles/d5Vgu34SRQQeRjqcpzqnFHXk7L82egoHCJhlbmXu.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(378, 'property (5).jpg', 'real_public/PropertiesFiles/T33CKiF5v2NOkIPOJJz2rMJ2NVUj14pRL0skKLuX.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(379, 'property (3).jpg', 'real_public/PropertiesFiles/elL34QiRYmCktaMxUVCmOeQLFbwDseZKmymCvC0g.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:05', '2024-12-23 17:19:05', NULL),
(380, 'property (11).jpg', 'real_public/PropertiesFiles/y4dbfMTwXPMN4ZS5icGnaOByZzcaPJWgsvEpwmkW.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(381, 'property (5).jpg', 'real_public/PropertiesFiles/JuEP5A0s214V5nUoMpGlrcoCrxFjwCYFufJT7a0E.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(382, 'property (3).jpg', 'real_public/PropertiesFiles/ezsjDBUbmtIQKNepPeJvrP9CNnB08JZCgqpE5HR9.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(383, 'property (11).jpg', 'real_public/PropertiesFiles/JQHB8T2oE1ZkOo3ylso2717vU42FtSiqTEburXFA.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(384, 'property (5).jpg', 'real_public/PropertiesFiles/zlDkLhgNWk8Pu86N59XKI90nEGAeE0ExRdH5DwDe.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(385, 'property (3).jpg', 'real_public/PropertiesFiles/cau4M8cly4U6lu523pWOYGCrIVsmRJ7WvH3xI8aS.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(386, 'property (11).jpg', 'real_public/PropertiesFiles/sp37MYanZxhyKQIsOAkbEuW5kCkGVWgOntp5ctvs.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(387, 'property (5).jpg', 'real_public/PropertiesFiles/VnlWTXLLyAiZBeT2qGze0N6VUf6WWG5bsRezldeJ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(388, 'property (3).jpg', 'real_public/PropertiesFiles/9njGoHtIEPXWRVBkwO2UIcgHVlQrPKJ5Iml7amLJ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(389, 'property (11).jpg', 'real_public/PropertiesFiles/xhYGw0xz5GIRGktzPcXO5up9SkZ19H9TcMm85syN.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(390, 'property (5).jpg', 'real_public/PropertiesFiles/zydvl6ADW4JmZ2IGBEZ7IqU8GAbVCRkFGnM2bPO9.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(391, 'property (3).jpg', 'real_public/PropertiesFiles/rbwZLg55uGiBKX67AVARnqk3CMMViP2Kd9ShUHfA.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(392, 'property (11).jpg', 'real_public/PropertiesFiles/CdBALPJhL79jYY5eUkVNvNsSnA1Dn9AM3kxnlN5r.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(393, 'property (5).jpg', 'real_public/PropertiesFiles/rYXum7RwmM5rttAKJL3oYuwNl7iEdzmrSxYa4ik0.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(394, 'property (3).jpg', 'real_public/PropertiesFiles/cMwHOn1iSyO9x4jJAcx81lc4QyqAkWqWyHUguBo9.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(395, 'property (11).jpg', 'real_public/PropertiesFiles/zUqs1tF3P9DFy4c4niFLGcaz0b9t5TlrkbsItZBy.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(396, 'property (5).jpg', 'real_public/PropertiesFiles/0HnHstos1RMLGM9V0KkFhQ0ko4GnxJYbpIx4krdV.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(397, 'property (3).jpg', 'real_public/PropertiesFiles/IB55UErOCuoINEl8KJ0llMP6pYG3exhn4z3T49xQ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(398, 'property (11).jpg', 'real_public/PropertiesFiles/fQdUpUZw80R0EQJdMqLDLRF2d15k5GH8bqHOftC7.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(399, 'property (5).jpg', 'real_public/PropertiesFiles/AuXn14d7cX4VfBeCPV7sWkwBi7FMuEJqEExVKmhS.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(400, 'property (3).jpg', 'real_public/PropertiesFiles/Lh8bnsic9ToKCKsYc74VjB86nOAWFB5sjHMy4Z36.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(401, 'property (11).jpg', 'real_public/PropertiesFiles/ZUmOPvt73WEH9KxgXO3W0Q9oMJxAK5HzoeaRdSyp.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(402, 'property (5).jpg', 'real_public/PropertiesFiles/YZp2GOfnoGegf2wULSRbf0vSbydZbscMROpd0ALS.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(403, 'property (3).jpg', 'real_public/PropertiesFiles/tVBmhhAWNM0JpP8RstoJzeQuzfwnWZ8hVKaENVkZ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(404, 'property (11).jpg', 'real_public/PropertiesFiles/Th7r3J8ha7XlYt42roLHswIhKtEaWU2jTRORxi0G.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(405, 'property (5).jpg', 'real_public/PropertiesFiles/WvOxrYMay6b7SruoIrsLinHhd1e0atVxCI6GTygy.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(406, 'property (3).jpg', 'real_public/PropertiesFiles/2Xn098HJpcE4IQRFT0hezpLTnpNsAUkHrPwE97vJ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(407, 'property (11).jpg', 'real_public/PropertiesFiles/zgiHkWRhacikDpdVTWk5k55msqYToW9eALUZMwOI.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(408, 'property (5).jpg', 'real_public/PropertiesFiles/gyjcnpczKdEzzQOJVFNhSDRd225AGVQccxoWWvA9.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(409, 'property (3).jpg', 'real_public/PropertiesFiles/k2sOUvpf2CMYQbapzBIzEzmwmilNGjYv831r2s1O.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(410, 'property (11).jpg', 'real_public/PropertiesFiles/Iec7IIYdXls95EJx1OMzAOYfWFzWfSvepMFgbxdB.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(411, 'property (5).jpg', 'real_public/PropertiesFiles/DfEL5K8d8u1IkFHRqGDdIQ1vWOh0NyXR2pcG8vg1.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(412, 'property (3).jpg', 'real_public/PropertiesFiles/Arj9lfE2zQSMdejFF7FdKt4JUn5I22l3J6L5T1Cq.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(413, 'property (11).jpg', 'real_public/PropertiesFiles/fnAUiShatx8Ba82jvJokgO57ACckplQnxTWciBsK.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(414, 'property (5).jpg', 'real_public/PropertiesFiles/1pnfYE0WtyZnnkXKvyuDX5KNwq40zniksPV70wkL.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(415, 'property (3).jpg', 'real_public/PropertiesFiles/Yl3VrkCAg90HgCrH95uGc4HQxFIjyJ4DEuaf691p.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(416, 'property (11).jpg', 'real_public/PropertiesFiles/ryPLXBfIUQn4G6oogBrYfjGIjXS0RgtZ5bBZcgoM.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(417, 'property (5).jpg', 'real_public/PropertiesFiles/XMi7kQDp8KX6qEqRQmUC87mhf7UmLNM9mUBbuiMJ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(418, 'property (3).jpg', 'real_public/PropertiesFiles/LVw1lVk3LbBlUvrzEK7nndtnygK6Nd3CrOQlu8Sl.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(419, 'property (11).jpg', 'real_public/PropertiesFiles/97tEda1i29UES8yvKcJgC9X04EzGAMnlY6f1bqmL.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(420, 'property (5).jpg', 'real_public/PropertiesFiles/Mea8KaB32GirXWeEZ1XjUnogrct892W0UIhcT0zT.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(421, 'property (3).jpg', 'real_public/PropertiesFiles/QmAO7xLhR8dkUpDIbtXNDRNV0jTCLniDklXAkoGe.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(422, 'property (11).jpg', 'real_public/PropertiesFiles/dsX7eSkyR9Zfd9SrxIrpmfSJzZX22dFHhDq8ZQ8P.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(423, 'property (5).jpg', 'real_public/PropertiesFiles/rE5E03g8mU73wvOKvxEbOPhlyxgMg9DW1Q2PcpjG.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(424, 'property (3).jpg', 'real_public/PropertiesFiles/YiJ0KDp36pStMSOLkXKeeQJfgXsbzNcJaGajrM1P.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(425, 'property (11).jpg', 'real_public/PropertiesFiles/XmQebSmJOKuYzp9FqJbOYpb0KKhDilHy8wAFVf8O.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(426, 'property (5).jpg', 'real_public/PropertiesFiles/SMNXJIFUJmhyREUtVSxXpjkJk4MdzvlOYJMSxbkU.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(427, 'property (3).jpg', 'real_public/PropertiesFiles/wWMpeKtd6XOnc2Hjc8lPxoPgF9ANCnlv1xWGTvGO.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(428, 'property (11).jpg', 'real_public/PropertiesFiles/fyPbrGF1zKS5O8HK576DWQUPDPY9YEXChtCZS9WY.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(429, 'property (5).jpg', 'real_public/PropertiesFiles/DeMfoysHvnBG7YfXwPtBMf3qbjIxUykwqh0tAYfF.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:06', '2024-12-23 17:19:06', NULL),
(430, 'property (3).jpg', 'real_public/PropertiesFiles/8Y4QASR6s6T4M4NfnDJTkvn41ZsN6vSkZ9uoaTLv.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:07', '2024-12-23 17:19:07', NULL),
(431, 'property (11).jpg', 'real_public/PropertiesFiles/E5RtayNKwfqv0gl60moiCWbZqUfcTZpyC1anyI6k.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:07', '2024-12-23 17:19:07', NULL),
(432, 'property (5).jpg', 'real_public/PropertiesFiles/2StmigKgNzABG9dScpfg2GDHs9dDJsDBFiKRgEAO.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:07', '2024-12-23 17:19:07', NULL),
(433, 'property (3).jpg', 'real_public/PropertiesFiles/JnZjfqzaoYD1E7bPzVUrxxNz7WqPezWsT1IO3N2k.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:07', '2024-12-23 17:19:07', NULL),
(434, 'property (11).jpg', 'real_public/PropertiesFiles/DMZS7LkH6uc8BKgCr49O7CyPci5TW3CQv1HVsOgX.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:07', '2024-12-23 17:19:07', NULL),
(435, 'property (5).jpg', 'real_public/PropertiesFiles/2wNeRvr3AtHnzZyIdEXjMUYI7sQtdSwDTrstVOvM.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:07', '2024-12-23 17:19:07', NULL),
(436, 'property (3).jpg', 'real_public/PropertiesFiles/DVqSUkMiJ4weTqlRVwVLGxkaHUOzbUlyTP0OeRm2.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:07', '2024-12-23 17:19:07', NULL),
(437, 'property (11).jpg', 'real_public/PropertiesFiles/ujkdoTlbbjVSsFDpXVWs8OpWonw4exzrQSFiPISJ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:07', '2024-12-23 17:19:07', NULL),
(438, 'property (5).jpg', 'real_public/PropertiesFiles/FSg7Ve5M3DglgWjXAPabzHhg9uscwPBTjck7qmuT.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:07', '2024-12-23 17:19:07', NULL),
(439, 'property (3).jpg', 'real_public/PropertiesFiles/3FN55cmDEgKUhBCumuVYqq5LxkymPnC5XDNh7Eb7.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:07', '2024-12-23 17:19:07', NULL),
(440, 'property (11).jpg', 'real_public/PropertiesFiles/ebjK6OrTT0Ym4XBxg0ypA1kn3J8JJ3PCATDCUFxC.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:07', '2024-12-23 17:19:07', NULL),
(441, 'property (5).jpg', 'real_public/PropertiesFiles/vGHFE6e8GsCvtumHpmsfQHSPwd3DEesSPy0luwHu.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:07', '2024-12-23 17:19:07', NULL),
(442, 'property (3).jpg', 'real_public/PropertiesFiles/btAMb59Y1VPgtSFJJ0eMmepLPfp45bVyGJSVILtB.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:07', '2024-12-23 17:19:07', NULL),
(443, 'property (11).jpg', 'real_public/PropertiesFiles/sBRyGnFWkLLIgG68NvATpMgxfWIYMr35zNxvC3HX.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:07', '2024-12-23 17:19:07', NULL),
(444, 'property (5).jpg', 'real_public/PropertiesFiles/jUMzWlQBxdKE1bw8RIr8nr8HNGLArh0OdRh8XFJe.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:07', '2024-12-23 17:19:07', NULL),
(445, 'property (3).jpg', 'real_public/PropertiesFiles/Z3hVERENFw5389onYDNu8tMjYZqR6YNKmzAUSnK0.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:07', '2024-12-23 17:19:07', NULL),
(446, 'property (11).jpg', 'real_public/PropertiesFiles/s0WH6pW64rVjYeM5LzV3Pc7VgpRfgQP19d8uus3I.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:07', '2024-12-23 17:19:07', NULL),
(447, 'property (5).jpg', 'real_public/PropertiesFiles/n94jgBbFuHIyX1PxKXnK1QGoIOOlp3Vltu49d18g.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:07', '2024-12-23 17:19:07', NULL),
(448, 'property (3).jpg', 'real_public/PropertiesFiles/gKBk7Jg4nMALPGoO5WZGR12uSfDWd89eiMW9FbYa.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:07', '2024-12-23 17:19:07', NULL),
(449, 'property (11).jpg', 'real_public/PropertiesFiles/063XvRjuTbMXTWeBuiRxaCm4fwPNnkAsiiT5fC3K.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:07', '2024-12-23 17:19:07', NULL),
(450, 'property (5).jpg', 'real_public/PropertiesFiles/eCs1jOUxkck7rNoNYxexxNrzw9zm0NEaynw6j1O7.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:07', '2024-12-23 17:19:07', NULL),
(451, 'property (3).jpg', 'real_public/PropertiesFiles/OUaotuoG7ZxorjfIxFJJM6PquXmOQt34gGt3hkti.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:07', '2024-12-23 17:19:07', NULL),
(452, 'property (11).jpg', 'real_public/PropertiesFiles/JlH8718GruNwqKt6IF10u5Bv9hki6OcZR5xN6sNA.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:07', '2024-12-23 17:19:07', NULL),
(453, 'property (5).jpg', 'real_public/PropertiesFiles/P748m46f1p4shEA5MLPt4c5Fq1KfBH5OdmqxGbpd.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:19:07', '2024-12-23 17:19:07', NULL),
(454, 'property (1).jpg', 'real_public/PropertiesFiles/Ez5ShHPcUYyZo7sYQi5C02zSnxlaARVo3WPwc5Oj.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(455, 'property (11).jpg', 'real_public/PropertiesFiles/XwxBMkDsjBXJdOmKREz3qzLvF84I5fqnniSO9GkT.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(456, 'property (7).jpg', 'real_public/PropertiesFiles/uRrpYlBlwobEnuxvpEMPVm42iEJpzHqAzqhIwxZK.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(457, 'property (2).jpg', 'real_public/PropertiesFiles/V82fkrgpgtj9eZ7JzgfPzja6PIGVJ4bba2QjB1o1.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(458, 'property (3).jpg', 'real_public/PropertiesFiles/bKydIrhCuKJnoP4q6ACH4MefFKLg4PsyoRY5toET.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(459, 'property (4).jpg', 'real_public/PropertiesFiles/EN5zTpsPQqEHQSyy4GEoqJV3G4h2J9ww9xxbdyux.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(460, 'property (3).jpg', 'real_public/PropertiesFiles/GIvqUrNXhgbWB53JuTjdF1snhXklmEv0n3nXSR9f.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(461, 'property (6).jpg', 'real_public/PropertiesFiles/6S0aBFywybKyznCsRhZP4p9mhGOjmzNy9G7GFuMb.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(462, 'property (5).jpg', 'real_public/PropertiesFiles/fxCKIGPWxi7VMaJo7AmE9L8ZQrzQfTNGo8ZJWkcL.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(463, 'property (3).jpg', 'real_public/PropertiesFiles/zyCBZMbr8W0ctrQG3GdDvmQ9ZL5WvoxFzDsxzMaL.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(464, 'property (9).jpg', 'real_public/PropertiesFiles/BAVBVnehxxp4olt1TgBmw7ogxMudX9KGqIEnS52x.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(465, 'property (11).jpg', 'real_public/PropertiesFiles/EPKT2mApf8ujsPc3iLJicjBrbFwB9dgsyg1sFbyR.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(466, 'property (3).jpg', 'real_public/PropertiesFiles/JQ53uhjzhnm4XO26mJulp1YHP72QSQPADHghn1io.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(467, 'property (9).jpg', 'real_public/PropertiesFiles/Sw7deIXob7rz5yGCiVK7xs6IgDKypcwgQWRFe0sP.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(468, 'property (11).jpg', 'real_public/PropertiesFiles/68VSRRvMly3N9xqyMDu2VS6VJgXTDwpQNIkuXTzr.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(469, 'property (3).jpg', 'real_public/PropertiesFiles/2I2S0fWZKJdHGG2NvteMQf7PbyUp6qS4sYvCA1Uh.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(470, 'property (7).jpg', 'real_public/PropertiesFiles/aquTHHVcWXz1zf9rPBxHvf0yXify8iG1TWSYQjsY.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(471, 'property (11).jpg', 'real_public/PropertiesFiles/GkKybVoTorUIZqNZK8AxmafxvXO14lQJhYGVRoqj.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(472, 'property (3).jpg', 'real_public/PropertiesFiles/9H367lqbszF0uccCCvCSQXMLQ58DzNVLL6Tu6klJ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(473, 'property (9).jpg', 'real_public/PropertiesFiles/JxMIPOuFk2wssgbqP9O88fZfV1qK8zbzkrNZqF3C.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(474, 'property (8).jpg', 'real_public/PropertiesFiles/ConRuqdZ9A0TNFDgezw6KPEQOFVe6JONrGQOm25v.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(475, 'property (10).jpg', 'real_public/PropertiesFiles/15GBNPe0A90XDcS98sOgJP7tivP1p9nVKTLVTI8q.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(476, 'property (9).jpg', 'real_public/PropertiesFiles/VSUdAJXVg8oH0Gj77QYbAhSvRWnm0JjKxXCIiaOS.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(477, 'property (11).jpg', 'real_public/PropertiesFiles/2oFsyEKUPIr1Dw5kBfyn6bCY1yhPVlDrzwzom7Tk.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(478, 'property (3).jpg', 'real_public/PropertiesFiles/OTqqPuIZxBRttnh8njeuEDHDJGWvrZUmx89micWe.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(479, 'property (3).jpg', 'real_public/PropertiesFiles/DnC383KIGxmgkE96ENk1MN9IpIeqqMC7tFVDDpih.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(480, 'property (11).jpg', 'real_public/PropertiesFiles/HuvQiyvFwJw8ZR9Bo28zbKfg3J8x3tj1XEerSoMY.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(481, 'property (5).jpg', 'real_public/PropertiesFiles/Xll5t3JfjVrv48y7YK3fUggr2S7njIkZZRnawyeu.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(482, 'property (3).jpg', 'real_public/PropertiesFiles/7PK4ylAbzeYgqxGUXEJ6YwJLrm2xzYluMfDiR9WG.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(483, 'property (11).jpg', 'real_public/PropertiesFiles/uUVqpXzN9Sp2wcslhRTBb2qjEJfxl8wWPJ7HsU0Y.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(484, 'property (5).jpg', 'real_public/PropertiesFiles/ba08vENIRTmLedHCZt4ITBKGbyWH1mFncPOelnvx.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(485, 'property (3).jpg', 'real_public/PropertiesFiles/7it3gF6VSHAs246DHnlxNmvsCnJdUclvClgXdcSU.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(486, 'property (11).jpg', 'real_public/PropertiesFiles/PZ5IbipzG75Wg9omq9KXXbmeWI5K0wU9HW7XRriI.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(487, 'property (5).jpg', 'real_public/PropertiesFiles/vsMbgsLEnvTvvURB5VmI50oPWnlEKBgwEjVnOnnJ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(488, 'property (3).jpg', 'real_public/PropertiesFiles/QX1JqQix3ixrkz8sVZMIh9B5dy3CCOAeeG2hyLDG.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(489, 'property (11).jpg', 'real_public/PropertiesFiles/bbWWr8VXjwYxBWJAI5hkXYoZsxHCIdpyW9RBMHfU.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(490, 'property (5).jpg', 'real_public/PropertiesFiles/zbqcR2tT8mgc2uAkM9CcoWdag6gVcY6OrWxOjxvU.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(491, 'property (3).jpg', 'real_public/PropertiesFiles/acw1Et06qJ8wq1W8DnkzODN5hrpWXVSULQLIi6A2.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(492, 'property (11).jpg', 'real_public/PropertiesFiles/8MCD5MZMGZ0j7ZOEEIy7n0iN2qjhTRKLc6nkbsXc.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(493, 'property (5).jpg', 'real_public/PropertiesFiles/D44ORdGF9mbSw3dZCaZIfOUuAVNqLPtfuOhZVuCL.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(494, 'property (3).jpg', 'real_public/PropertiesFiles/iXmdRjoiPK4ZZArUiT311lXb5ULqpwdhYEPSjvBY.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(495, 'property (11).jpg', 'real_public/PropertiesFiles/3uwrYp5cSnaFakrBHQTxhnPVup3CewPFy2KBgUpe.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(496, 'property (5).jpg', 'real_public/PropertiesFiles/Xe0BXIImBxF7rOuT2qe39TcmPpF2lQhWV1665lDB.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(497, 'property (3).jpg', 'real_public/PropertiesFiles/GrCP28DCCyhKWGasdEH5ykzn6Y6gOyxddZBDyIf6.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(498, 'property (11).jpg', 'real_public/PropertiesFiles/nDpRRtFOkTiNki2UKoE2ey5VelmX3zVn8HjQjCyL.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(499, 'property (5).jpg', 'real_public/PropertiesFiles/2sRCm1Bda90eQPn8hibP0vXl3DqYByw1MkH06Ap6.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(500, 'property (3).jpg', 'real_public/PropertiesFiles/4wor1MUDokZKDl4Hfv3G3Pox89Rn2cTGs4ZB6oTr.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(501, 'property (11).jpg', 'real_public/PropertiesFiles/ZykH5AguGxn8Yp0UyH81eHocV5G9b7exunfMeUux.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(502, 'property (5).jpg', 'real_public/PropertiesFiles/tzEAkir2F9R4e4hHWtsDJCTmahfVobAmmH6v0948.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:39', '2024-12-23 17:26:39', NULL),
(503, 'property (3).jpg', 'real_public/PropertiesFiles/8FXXrVBQzGrohElCxEpvlbbu9SIaYIf4Kn0H74BH.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(504, 'property (11).jpg', 'real_public/PropertiesFiles/BEqW8IQkS7W9Y8AkLnnbCWg8dNfURRsmnnLezBmr.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(505, 'property (5).jpg', 'real_public/PropertiesFiles/ZsFYqsSBbSqIRHeT0mgQqcyx1uefI8REuWXdxVzW.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(506, 'property (3).jpg', 'real_public/PropertiesFiles/4sIRp3dqSSf5zWSdD3q8RjUIeC4P97HJFvqcWA2c.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(507, 'property (11).jpg', 'real_public/PropertiesFiles/aBm9kC8eeHCEtzaxDvrAydz5ss1QMh2BpWPcHKYS.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(508, 'property (5).jpg', 'real_public/PropertiesFiles/6hfsTkYFLNqy7DMWimOGBqRY2tJ9OaxczXdkh79O.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(509, 'property (3).jpg', 'real_public/PropertiesFiles/CA53P9fgTXTJZxvw0Hr20aVK03HwEDBtZYchN8cO.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(510, 'property (11).jpg', 'real_public/PropertiesFiles/nquIp7L038sWiKgvWowJWTpJNd6wEchSDEgIYg7k.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(511, 'property (5).jpg', 'real_public/PropertiesFiles/UD2yO6TpblhsyD40zO8zZGk2vLReWmv79dfGFY3y.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(512, 'property (3).jpg', 'real_public/PropertiesFiles/cmIDQDmJ3UbsX3ihluMRZp4q7UgyQtrErk6nKbdR.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(513, 'property (11).jpg', 'real_public/PropertiesFiles/FdyMv96ZMDoNvm5HLRalE51BbPT9YM9sS55b1Lk9.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(514, 'property (5).jpg', 'real_public/PropertiesFiles/9TPfDj8gFwGP5nLNvX7CDJVHgHzsBtuozPkrNzeO.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(515, 'property (3).jpg', 'real_public/PropertiesFiles/ptKIWyEjpcLQ6M7ciXKjA1knC2HHUxFaZrLliEqy.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(516, 'property (11).jpg', 'real_public/PropertiesFiles/efd6aDCS38PNRwXBQQ7q2nYAUiyWTyGtsrEDzu9R.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(517, 'property (5).jpg', 'real_public/PropertiesFiles/At6uRVucP9iWoTOw2VrRHKP52tD8K75Kjx4qwEoQ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(518, 'property (3).jpg', 'real_public/PropertiesFiles/jLbO9HIg9y9BMrlwBId3o1k0Vk4yZXz6KzQAtzPx.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(519, 'property (11).jpg', 'real_public/PropertiesFiles/ZaKXnyem35mpSzNAg0kZSl3tKhJeRhqvlDVH6J7K.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(520, 'property (5).jpg', 'real_public/PropertiesFiles/UwAtaLuMVX9Qjz19Jhsm439RExhe0cLKLYVXJFGN.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(521, 'property (3).jpg', 'real_public/PropertiesFiles/VtdPpJsFOkP9EdceX1b0MPou9bwskk2cxaN2gyT7.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(522, 'property (11).jpg', 'real_public/PropertiesFiles/fYxK0eMtAaSWpivY6TTufoocXwfeRQE2XgtS8Nbk.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(523, 'property (5).jpg', 'real_public/PropertiesFiles/6mkKnEVMfa90UFmYBBP5katuVZQiBCHxjJ7AwtIR.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(524, 'property (3).jpg', 'real_public/PropertiesFiles/rwH5uL5gHN2pWudqjIqaTXd6gkeL0eEFYUqCUrFw.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(525, 'property (11).jpg', 'real_public/PropertiesFiles/4xO4l2XM4zfYmgS1BbXqIHDtK1wqlVGmm3MHjQjB.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(526, 'property (5).jpg', 'real_public/PropertiesFiles/Zfa7xdqMlqHElS9MSENoLCCKqOXxZ6qkxDc0ykEh.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(527, 'property (3).jpg', 'real_public/PropertiesFiles/uzMZKLMhBDwjhMqjEORkJFmmw69cLUeEaljmDqe9.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(528, 'property (11).jpg', 'real_public/PropertiesFiles/HznEIBeZXqln6GngjrvA0aNF9XD1zm8G6MtT4BF2.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(529, 'property (5).jpg', 'real_public/PropertiesFiles/ieT2jRlbrvDdx6JaKod9sEoIeRpGslbjViqfuVlM.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(530, 'property (3).jpg', 'real_public/PropertiesFiles/7QQG2MmSnDO8NRxPgVc4m3eDe0L8TJsXWqHOcATG.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(531, 'property (11).jpg', 'real_public/PropertiesFiles/5dBWP3IpiZKYO9dExt9NNJEjvsZT9dD7fh1eQOBQ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(532, 'property (5).jpg', 'real_public/PropertiesFiles/hFgp03ck1OyQjrLqebpyVu6Ss2Cm5SRjXPgBHjc1.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(533, 'property (3).jpg', 'real_public/PropertiesFiles/nhfiXT6fDi3OupFmOyBJDcEOhs5Lc1vWNfRp4VH2.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(534, 'property (11).jpg', 'real_public/PropertiesFiles/H9UvxGHxVLtr3OwaF7d7XtZl50yDvan0BacX5YA3.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(535, 'property (5).jpg', 'real_public/PropertiesFiles/nbiMTiQwfMk1jkG0YVSJ9FdeXrucpxdu2z7ofpPi.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(536, 'property (3).jpg', 'real_public/PropertiesFiles/aeFxX6lELXbF3SZNzndtHFi1FviUDnbfWAsyIfE6.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(537, 'property (11).jpg', 'real_public/PropertiesFiles/bjP7qHsTWvwbMVgR8x2Txox1p8wafw3pRIdNSH9R.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(538, 'property (5).jpg', 'real_public/PropertiesFiles/TbY5e1UQDY7ZzdQeRiPWXXsaVvhht2hVdiwEhVsS.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(539, 'property (3).jpg', 'real_public/PropertiesFiles/TbI47MF9bc5R1dgtBoYNdBzwG75N8JnfLbu1RYWn.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(540, 'property (11).jpg', 'real_public/PropertiesFiles/GWyaBLf8iBYveaJWW2RoeMwk994AjQSCa1jzoOLb.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(541, 'property (5).jpg', 'real_public/PropertiesFiles/vvcQHg6fMuwJmbhkEUxITlz3d3MZFT7luV7wHdDZ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(542, 'property (3).jpg', 'real_public/PropertiesFiles/v3xS83bDHyrURo3oa2YBkOGhMnjFSW0blsxBdmJE.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(543, 'property (11).jpg', 'real_public/PropertiesFiles/6Zb53Qoed8KGEkE4uuEqGsGWwh4O9SIrimWRLpAL.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:40', '2024-12-23 17:26:40', NULL),
(544, 'property (5).jpg', 'real_public/PropertiesFiles/ewXFMiCAt7WFu6vRCC9W2juDca8vdDI2MFCtzCtX.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:41', '2024-12-23 17:26:41', NULL),
(545, 'property (3).jpg', 'real_public/PropertiesFiles/Mf23YTxLHOb8JSu7KXHMr67py7xoEDrq7kYTvce8.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:41', '2024-12-23 17:26:41', NULL),
(546, 'property (11).jpg', 'real_public/PropertiesFiles/IjKm7V8vCypcciOubc1z7fHKrS173hwSJExqKECl.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:41', '2024-12-23 17:26:41', NULL),
(547, 'property (5).jpg', 'real_public/PropertiesFiles/Qi5MfAdoFvtVB7BMdM8SEXj6C2qsfX6jjoCNzT6g.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:41', '2024-12-23 17:26:41', NULL),
(548, 'property (3).jpg', 'real_public/PropertiesFiles/0sJypsPKyiHQdEIhgxgMxB9ExTlTK5UpPjZppdbj.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:41', '2024-12-23 17:26:41', NULL),
(549, 'property (11).jpg', 'real_public/PropertiesFiles/FcLKLgtHLGqtyzzISKOWfyWEgfp5cKmbxdT1rGw1.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:41', '2024-12-23 17:26:41', NULL),
(550, 'property (5).jpg', 'real_public/PropertiesFiles/b4p4nYpFzxYRZsVSMmvpdqM3RPqf2b6VD0lQAfim.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:41', '2024-12-23 17:26:41', NULL),
(551, 'property (3).jpg', 'real_public/PropertiesFiles/GPD0NvvA1qVWo07HAdipsVMErzjFhs5LZoiKU5wr.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:41', '2024-12-23 17:26:41', NULL),
(552, 'property (11).jpg', 'real_public/PropertiesFiles/hdJv2cdvoW6JsVkIS2eFpr5ny3HGDnOe8At4y4RA.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:41', '2024-12-23 17:26:41', NULL),
(553, 'property (5).jpg', 'real_public/PropertiesFiles/qtDBQrcXH8HDyBcLZNLz6oBNOqkg5utBYil0c2KK.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:41', '2024-12-23 17:26:41', NULL),
(554, 'property (3).jpg', 'real_public/PropertiesFiles/ubOtLidtDpG87yEYW9ZHZdRpwlbeepbz05hTOwnP.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:41', '2024-12-23 17:26:41', NULL),
(555, 'property (11).jpg', 'real_public/PropertiesFiles/kCkAvWHmVs9WyoY4PoIqNb67hfoXjtSiwEJ0vASp.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:41', '2024-12-23 17:26:41', NULL),
(556, 'property (5).jpg', 'real_public/PropertiesFiles/PB1zJOp4767fwK5zAkafYv7A0dRM6FFLX70OX8GC.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:41', '2024-12-23 17:26:41', NULL),
(557, 'property (3).jpg', 'real_public/PropertiesFiles/MwE2gE3GqSuR2NsfNfswRq0XwZvasozML961HVWo.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:41', '2024-12-23 17:26:41', NULL),
(558, 'property (11).jpg', 'real_public/PropertiesFiles/DpSAhUKFWKzpbsqmavt0uPBl2sALNhC1gNQze22W.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:41', '2024-12-23 17:26:41', NULL),
(559, 'property (5).jpg', 'real_public/PropertiesFiles/f7wog3qb1faD7Vmq0GajGCYJjinNuvHoWCAxskhD.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:41', '2024-12-23 17:26:41', NULL),
(560, 'property (3).jpg', 'real_public/PropertiesFiles/2KmAHwgy0hOxcFjwiSjybQZv5K8vepDOLcdeaMyZ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:41', '2024-12-23 17:26:41', NULL),
(561, 'property (11).jpg', 'real_public/PropertiesFiles/WF2CQ1DaFgUNgnIhTRSwXOEqrDZIHLzXomfSBf7Z.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:41', '2024-12-23 17:26:41', NULL),
(562, 'property (5).jpg', 'real_public/PropertiesFiles/xu55xaIMfHVFjlNjk2XC8vld9yQp0GSLnJnXbS7N.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:41', '2024-12-23 17:26:41', NULL),
(563, 'property (3).jpg', 'real_public/PropertiesFiles/so36KYIWSwsl8zI6x8EV1YEdHkNKAPHSZuGvtddd.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:41', '2024-12-23 17:26:41', NULL),
(564, 'property (11).jpg', 'real_public/PropertiesFiles/lkMffzZcmMNLo5sEo1r4OJXVCQVYpHd0BlH458Al.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:41', '2024-12-23 17:26:41', NULL),
(565, 'property (5).jpg', 'real_public/PropertiesFiles/qMoFQJ4X0HnDjgjlfKe7kVyEYzq77FdnVahxEUEl.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:26:41', '2024-12-23 17:26:41', NULL),
(566, 'property (1).jpg', 'real_public/PropertiesFiles/y89kl9B4VKCv3RwWC9fCu4spIffGmz0sjE4l4bCu.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:42:54', '2024-12-23 17:42:54', NULL),
(567, 'property (11).jpg', 'real_public/PropertiesFiles/K2GTkES6X2PdYrWFx9qk0LS33dF4E46JtjbLnFH4.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:42:54', '2024-12-23 17:42:54', NULL),
(568, 'property (7).jpg', 'real_public/PropertiesFiles/BqppsGrqARgkBj8bdv0wxAP9HcpHgeWbV5qkbfqf.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:42:54', '2024-12-23 17:42:54', NULL),
(569, 'property (2).jpg', 'real_public/PropertiesFiles/Ugz6C4eHJoUmxJKEocEnPDkiGsWQL9newgD7PSM6.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:42:54', '2024-12-23 17:42:54', NULL),
(570, 'property (1).jpg', 'real_public/PropertiesFiles/flwAScFeFPy6Oc6ONoB8TG7Hr1mEw8Jq1ilaUecx.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:53:54', '2024-12-23 17:53:54', NULL),
(571, 'property (11).jpg', 'real_public/PropertiesFiles/wSq3EeZYm85MCweMNYcdxaytVl0q3ksjjhPG6FUu.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:53:54', '2024-12-23 17:53:54', NULL),
(572, 'property (7).jpg', 'real_public/PropertiesFiles/d9jmb3zKNG1D5dO1lf5egEGLRSlTdjIz7WmG29Je.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:53:54', '2024-12-23 17:53:54', NULL),
(573, 'property (2).jpg', 'real_public/PropertiesFiles/G2sHuSC67awf3NQEWOV440CJ8EPWeP6ODkWnztNu.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:53:54', '2024-12-23 17:53:54', NULL),
(574, 'property (1).jpg', 'real_public/PropertiesFiles/8AGxNvRgaZvgtxI1UtB4nmgXtVfZQyuqvwAzS8qX.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(575, 'property (11).jpg', 'real_public/PropertiesFiles/BJWy1cI8MvFeegJbnlj4kMVJBxtL4CXAoQkVLmMC.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(576, 'property (7).jpg', 'real_public/PropertiesFiles/9ZRm7pgGMfAiRLHKrFzlvkGym4eDFiqH1Xq55GLd.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(577, 'property (2).jpg', 'real_public/PropertiesFiles/2HsGqS2N8bJne4P8KKs8h6zVs4qFKOqvj2SRMddY.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(578, 'property (3).jpg', 'real_public/PropertiesFiles/KjgrExOjZ8j6XeQALPcekGMJyamVUxLOKkh1MIdW.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(579, 'property (4).jpg', 'real_public/PropertiesFiles/zZIuEr3kSXJYzmYVaIgERMCFayRuAWEJ1Kcrjaap.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(580, 'property (3).jpg', 'real_public/PropertiesFiles/skvduqUz8aMuTFEwQBz5Sa0FqUPAMcHrqLkbdygz.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(581, 'property (6).jpg', 'real_public/PropertiesFiles/w7rPUozWG05kmSZIWDR6Ew7ahYQcUHzDb6594qfj.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(582, 'property (5).jpg', 'real_public/PropertiesFiles/PTPmG3clhuLxdHAGSEuzYqEbRa7pFN8GFXJ0waFa.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(583, 'property (3).jpg', 'real_public/PropertiesFiles/U7Ah7LlUlpvArC4laP0WgXfzv6VKSg1fd82MDq8I.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(584, 'property (9).jpg', 'real_public/PropertiesFiles/cUoDNp8oglWjAm1MUN0WXd4fbwP65OcuDsYcCyLr.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(585, 'property (11).jpg', 'real_public/PropertiesFiles/QpXjHnsO5H4ierqwUjJjGnsLaKVd3VaAspvlbOIn.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(586, 'property (3).jpg', 'real_public/PropertiesFiles/kkrZQCDEwPxlawWCapd0aQBWD2S7OOnPvvU196aQ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(587, 'property (9).jpg', 'real_public/PropertiesFiles/ZGKu4iuWm8ed8HmB1SdGKRLqkFdSSKuF9PUtO6OK.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(588, 'property (11).jpg', 'real_public/PropertiesFiles/geCwVoevqyOfh2boE36ZkN5IiWdtv9AZnN9rvHad.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(589, 'property (3).jpg', 'real_public/PropertiesFiles/N1Wzsh4w2egFGnN9MmXvoKOZvH9CyG2VC9QdQUYR.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(590, 'property (7).jpg', 'real_public/PropertiesFiles/XZNlrHrlcCp0jxXfuLb1J6cOc8U4ktfs5OVkfrQe.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(591, 'property (11).jpg', 'real_public/PropertiesFiles/gPAzLLtfXSTIP78II2r7W2r2CbWQEMyZpQbdwwXg.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(592, 'property (3).jpg', 'real_public/PropertiesFiles/rYemYsdpKJUTwmIEhTFjwFkANRMHa8otlSW7yHo6.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(593, 'property (9).jpg', 'real_public/PropertiesFiles/q8xgBaVOY6JUok3GEZ0B6TdYvGwQ494EIdK8nX6w.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(594, 'property (8).jpg', 'real_public/PropertiesFiles/J05ctrqlRpxBYGFtwLhB5bZmHKGlI2wyoHw6FSqL.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(595, 'property (10).jpg', 'real_public/PropertiesFiles/YfJ4gVEC818ABYgvpi2YW5uG790wlmlWFYo1WyEI.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(596, 'property (9).jpg', 'real_public/PropertiesFiles/DTE88waOJMTCfbHC22KHti0KayuhlZA4C9d3Z1WE.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(597, 'property (11).jpg', 'real_public/PropertiesFiles/N3x26O0NzQs8Or3oLtwuXOQtxJqi6obHWqCPxxX8.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(598, 'property (3).jpg', 'real_public/PropertiesFiles/aK5BUIlqQJFYE5oCSJTfapiNA5VLKKMQYOXIDDnG.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(599, 'property (3).jpg', 'real_public/PropertiesFiles/gGkYONnIUpztkI5vdKVBYq07rGxgVOcXoyUSCAO8.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(600, 'property (11).jpg', 'real_public/PropertiesFiles/HUWHHFHroGzotpqqBvfprnN61xr9lIaBq0tHLKAE.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(601, 'property (5).jpg', 'real_public/PropertiesFiles/EVy9OMS50rwrA2Y0iewbHjsN6pOMbOejOmiC2AxA.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(602, 'property (3).jpg', 'real_public/PropertiesFiles/3nTWPSGN1XlnBTMNpqUj70e7pfWJqSK25prLipl5.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(603, 'property (11).jpg', 'real_public/PropertiesFiles/m99MXeitURXxMaqlV01Rq2i5Xt2IEJveRVXIIwXX.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(604, 'property (5).jpg', 'real_public/PropertiesFiles/qMtjeyDpvdvv4mT5eF8jabX6rw30XOFoMKzoKeIK.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(605, 'property (3).jpg', 'real_public/PropertiesFiles/bPrB3tdlZldxninxs9NmsslnpUvFxsbcj6K02fjm.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(606, 'property (11).jpg', 'real_public/PropertiesFiles/W8PKC3SwNZslQlFzq22ENglRff3qs1FETXjmHPDI.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(607, 'property (5).jpg', 'real_public/PropertiesFiles/r9EX4YmwhsDKt5jvzkU58xojp3KQtyvDxhJPMNnU.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(608, 'property (3).jpg', 'real_public/PropertiesFiles/dUydOJnvT9XLjptvAtMlUepN0UKsOK6iNwAuowHg.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(609, 'property (11).jpg', 'real_public/PropertiesFiles/aMNl6DmgBrj9hUUs1KuXwSInq5WhRSfSo41MjLAR.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(610, 'property (5).jpg', 'real_public/PropertiesFiles/h6s5JN5jNYggAPHiln9tu8BwShX5UWIPIvF2EelJ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(611, 'property (3).jpg', 'real_public/PropertiesFiles/34lJWMkwl0kv6Y9prke7t9peaT241Gw29S7q9Cvt.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(612, 'property (11).jpg', 'real_public/PropertiesFiles/JWamvfI1ADL5h5TUOhFjKeHntYNGVTtcWXPnxrQJ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(613, 'property (5).jpg', 'real_public/PropertiesFiles/c5AQpEM65GAaLH2yj2OIFozR4Xcm9g2T21Pg7SKk.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(614, 'property (3).jpg', 'real_public/PropertiesFiles/BblHzeoLtopTMC5mysxnMwhtO8bPoHNWEEV4ygS3.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(615, 'property (11).jpg', 'real_public/PropertiesFiles/9W8NtETQfgM37lPxQbWLWYN52KpT3f21VQj6FoIq.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(616, 'property (5).jpg', 'real_public/PropertiesFiles/zmGgDO8hZeUTMFzd8tRb4gcyCUqCdbu5v3i2HlvH.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(617, 'property (3).jpg', 'real_public/PropertiesFiles/LPAKXcxLpqe0DNTp0QAYVtqa2Ga57H4kB2A2mEph.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(618, 'property (11).jpg', 'real_public/PropertiesFiles/iNUAQvwqWxnwKF9vbDsf4ZTThBJVdUjemFw8jydu.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(619, 'property (5).jpg', 'real_public/PropertiesFiles/Glo7o6gtAOEDe08UFvsTN0SyayAk0G1kCbwzOcWf.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(620, 'property (3).jpg', 'real_public/PropertiesFiles/LDkNIoToI4tBU3wOPL73JvGRhq2QfGNIHJ8TB599.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(621, 'property (11).jpg', 'real_public/PropertiesFiles/pKolRsimpvtSNExR9LaZRMH7yBo5lceQvgxJyACH.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(622, 'property (5).jpg', 'real_public/PropertiesFiles/RbbFb9sdmFR49VhPhYf4N2VBkXSO0XCy2sb7r6Fq.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:17', '2024-12-23 17:56:17', NULL),
(623, 'property (3).jpg', 'real_public/PropertiesFiles/8VX1eInMGrEDtIgSR2jo6TBx8GZ2eZQhcbuDKTnL.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(624, 'property (11).jpg', 'real_public/PropertiesFiles/1v1Z4k6hZpIcBezK5GlYNkvWrpWLOWz0P1G7hIa7.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(625, 'property (5).jpg', 'real_public/PropertiesFiles/mgx9cR4wdbV2mZAxFxdJvh9Cm9VmDV0fMUL6m5b8.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(626, 'property (3).jpg', 'real_public/PropertiesFiles/P45MofkM4h3UDAtlXgoIqHP6daLwcA2232FVQd8y.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(627, 'property (11).jpg', 'real_public/PropertiesFiles/4ZoGPXKHhoJ3PLieu7Kg9yG1jQaEbi9gxukH5TKQ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(628, 'property (5).jpg', 'real_public/PropertiesFiles/Xm287R7jUWrh6PR4ot4ouu76ejoWALV4aLIwAoD0.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(629, 'property (3).jpg', 'real_public/PropertiesFiles/PjD6KW3wQtMo2l1L7mm2TfHBexcI2uP1k7dPqtkz.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(630, 'property (11).jpg', 'real_public/PropertiesFiles/JOCKWbKDRl6xCRk8g4pwoCzIWGrYFNdBs9aJpCnu.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(631, 'property (5).jpg', 'real_public/PropertiesFiles/9CJstGR4V3UTr89h1WLQxkZvrZyknt5ughD1nUg4.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(632, 'property (3).jpg', 'real_public/PropertiesFiles/NmqWvt1WNLiQ53KBan67gWOzbwINfoatihhnp56V.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(633, 'property (11).jpg', 'real_public/PropertiesFiles/s9jfFM7xivvyXbe8v4B4lAlvMJk6MoS1zRQdHu6r.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(634, 'property (5).jpg', 'real_public/PropertiesFiles/Fiid8bpPC9mwRXs9SRcJmssyOGDIsom32N1Empg3.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(635, 'property (3).jpg', 'real_public/PropertiesFiles/krYTmzfK0oTtvypfgUUWU1WUU0Mi0V6hlmCrHYV2.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(636, 'property (11).jpg', 'real_public/PropertiesFiles/H9gr1EnGhEIRGFzkV6vnOHqYcmaTHdvfNZrIODDS.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(637, 'property (5).jpg', 'real_public/PropertiesFiles/NTOV7DisCZsMMOpekJs8R7ubq2bV8Mxvy1ofWuFo.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(638, 'property (3).jpg', 'real_public/PropertiesFiles/1SUj63xD48eDIfIkCOPv8ilxWqPxDo8cjhX0D8tn.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(639, 'property (11).jpg', 'real_public/PropertiesFiles/ZqQHBwUI0b7v1BJZ6pYimHrwjQ6g61tiqHrqtcWd.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(640, 'property (5).jpg', 'real_public/PropertiesFiles/LaQBCHSFM6bSgxXZdyluiOhpFZVU32Ti3IiNnPdJ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL);
INSERT INTO `uploads` (`id`, `file_original_name`, `file_name`, `file_size`, `extension`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(641, 'property (3).jpg', 'real_public/PropertiesFiles/jMhBnTwdb0fqjDoDpHFnm6d8PJgcirpTDEn9wOsv.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(642, 'property (11).jpg', 'real_public/PropertiesFiles/3B5PHRf1XCyMepMC926PZ49rKJHWU9cDp6fBNYsc.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(643, 'property (5).jpg', 'real_public/PropertiesFiles/54iexTu1VxeSEyL5COivNNBOEbpsYu4sK1py5cWC.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(644, 'property (3).jpg', 'real_public/PropertiesFiles/1DSomYnDPkabR6cKh76zPsAnAsTrnl96ESsRch8i.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(645, 'property (11).jpg', 'real_public/PropertiesFiles/7v7Kc1XWL3ESwDyoxjcIfpZGVOip6gBQqXWRUWyz.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(646, 'property (5).jpg', 'real_public/PropertiesFiles/RRAwxuV52DfP2KCA5XyyrotyV6DmB31ASOBJjJB2.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(647, 'property (3).jpg', 'real_public/PropertiesFiles/sFm5Z9OeyTmkNmI0k8dHdynuhFLKhjl4pK8ny3Hx.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(648, 'property (11).jpg', 'real_public/PropertiesFiles/uOhCtGoAf4qOgyZ669jDPYHIQz5as3SJpAfBCXcL.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(649, 'property (5).jpg', 'real_public/PropertiesFiles/wWeQa71bR0cU234t9iF8JLb6DJB2PczijJ0G7ywK.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(650, 'property (3).jpg', 'real_public/PropertiesFiles/hMDiXxQMIby1JHZiwca4l8XAcTwyeJUdp5RfHwBv.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(651, 'property (11).jpg', 'real_public/PropertiesFiles/ivnvFndC9ywSTnm9hRQUI72fD1Rr9dmaaL0WdHRt.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(652, 'property (5).jpg', 'real_public/PropertiesFiles/fl6LW1DXs3FsMn2qbRYU0EWGn2QKG5omrutxgAOR.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(653, 'property (3).jpg', 'real_public/PropertiesFiles/OtuSbZrHdK948sgkDzTrBTpWx3ngK8lsYN2r5Xoe.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(654, 'property (11).jpg', 'real_public/PropertiesFiles/FFq9gOmPoSjNLEbXsxBTaVwgCGm2j7T836jJQLL0.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(655, 'property (5).jpg', 'real_public/PropertiesFiles/UOOCYfbjBBUZrN5wWzIlwJnXIwiStizQW6Y807sp.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(656, 'property (3).jpg', 'real_public/PropertiesFiles/6Bh75Kil48eIQPjmEmeReUHNAAhT2L9kJtQ6kgYq.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(657, 'property (11).jpg', 'real_public/PropertiesFiles/VmMekv2ltXSqIVZuYg5OSXswhRFCN4Yct6DXEA0L.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(658, 'property (5).jpg', 'real_public/PropertiesFiles/BJt6QT1Rmabk3yQYHoKgAL01IYd6U9hJSEQmxetz.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(659, 'property (3).jpg', 'real_public/PropertiesFiles/pR4GAnYjFguPg2XLdEo8uhsxJWKHfbRo2a0NovXU.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(660, 'property (11).jpg', 'real_public/PropertiesFiles/XIk0cC89DTFNqCYyJmxFGTgP1JDpXCWJNYYB0NR3.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(661, 'property (5).jpg', 'real_public/PropertiesFiles/kZlFLeRSyHonbkZXVF8GbkD4OZuQBzt3uHotY7qG.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(662, 'property (3).jpg', 'real_public/PropertiesFiles/y1refkQN3kD1PhvHUh4y6obZn5Xia7wLTNopr1gv.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(663, 'property (11).jpg', 'real_public/PropertiesFiles/XM5hJnKSEmlo7NFLDW6on5Aq5LvDSkdDYFBv2IcM.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:18', '2024-12-23 17:56:18', NULL),
(664, 'property (5).jpg', 'real_public/PropertiesFiles/ga3dqkL2x0WYCUvY5zC37A14HHrYAMEVeD8f3QLR.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:19', '2024-12-23 17:56:19', NULL),
(665, 'property (3).jpg', 'real_public/PropertiesFiles/NnWeYSojulaVnlJ279E5qTNP7Jg6RYdYU5BCQISZ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:19', '2024-12-23 17:56:19', NULL),
(666, 'property (11).jpg', 'real_public/PropertiesFiles/tWwAlziwKAH6PzAKUdbrPVUAwf5OeVITQ1frxaSl.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:19', '2024-12-23 17:56:19', NULL),
(667, 'property (5).jpg', 'real_public/PropertiesFiles/uATjngPyq2Hn0Gjr6G8GL3TWxEuCVNeHwKHXRc0W.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:19', '2024-12-23 17:56:19', NULL),
(668, 'property (3).jpg', 'real_public/PropertiesFiles/ihIwOSOwnFkcnq3iJfkVZBUWTuC6lnNbAYOsOi3w.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:19', '2024-12-23 17:56:19', NULL),
(669, 'property (11).jpg', 'real_public/PropertiesFiles/3tlXJ9pATbtd8WPKJ26Aa7mp5ZdeXCxlPTy45mWA.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:19', '2024-12-23 17:56:19', NULL),
(670, 'property (5).jpg', 'real_public/PropertiesFiles/wTPPrZUzD8dHEkDiQVelLOpYI00X9x4BtsHoeyaI.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:19', '2024-12-23 17:56:19', NULL),
(671, 'property (3).jpg', 'real_public/PropertiesFiles/o28kYdJ2ta4DzL1zPHkNmytGGHmzoS0vsIX1uPlb.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:19', '2024-12-23 17:56:19', NULL),
(672, 'property (11).jpg', 'real_public/PropertiesFiles/2gyJJlEIK1o0w0Ssafk1V4glrW6k3KJRUGyDY6lm.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:19', '2024-12-23 17:56:19', NULL),
(673, 'property (5).jpg', 'real_public/PropertiesFiles/QFrx1LCb6ETSkTJ6ntQpWtLvjPsfM68Bu4swh0SP.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:19', '2024-12-23 17:56:19', NULL),
(674, 'property (3).jpg', 'real_public/PropertiesFiles/O515HoAcAiJFKwki3QKNV84W9GGwZPOPULT71JjO.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:19', '2024-12-23 17:56:19', NULL),
(675, 'property (11).jpg', 'real_public/PropertiesFiles/7OdeVQAMqsuFS6hSNxWKykwAoC2DbGoVinRu6ZAy.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:19', '2024-12-23 17:56:19', NULL),
(676, 'property (5).jpg', 'real_public/PropertiesFiles/1OQJR5g7Yi4O9WYJP8vgAdZsToopukDuNNEFg6lw.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:19', '2024-12-23 17:56:19', NULL),
(677, 'property (3).jpg', 'real_public/PropertiesFiles/W8JJ6wnrYmLlNnGso9WVvZUFmpUTW7nX8KKRVeTY.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:19', '2024-12-23 17:56:19', NULL),
(678, 'property (11).jpg', 'real_public/PropertiesFiles/YJ1dK1vb6bF5m9gG9Xe1sJeHgtWOFJMxCRMAVvuH.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:19', '2024-12-23 17:56:19', NULL),
(679, 'property (5).jpg', 'real_public/PropertiesFiles/2S50TbdKoeWrqCS7r6eTx7vhxTnjDg2cFDx3fnUf.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:19', '2024-12-23 17:56:19', NULL),
(680, 'property (3).jpg', 'real_public/PropertiesFiles/lCdP51IPsDVAl7eYpag6x8vxCYPxa7lYBnrUB5Wm.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:19', '2024-12-23 17:56:19', NULL),
(681, 'property (11).jpg', 'real_public/PropertiesFiles/eP3kaWP8PwlmQE5lZpz3Ak2O3tk8lMtNfT4FmzlR.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:19', '2024-12-23 17:56:19', NULL),
(682, 'property (5).jpg', 'real_public/PropertiesFiles/zWoOrHh6osWzKeOooecO1aiqreWjRfA7uPyXnGrZ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:19', '2024-12-23 17:56:19', NULL),
(683, 'property (3).jpg', 'real_public/PropertiesFiles/LPSjFPVnPtJJdLpc4kMWGqQVzILRZxutgJdGJawT.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:19', '2024-12-23 17:56:19', NULL),
(684, 'property (11).jpg', 'real_public/PropertiesFiles/aI7TdgB2lK6oGdLBviptJ6bSN8JAMagnvILnW6Zi.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:19', '2024-12-23 17:56:19', NULL),
(685, 'property (5).jpg', 'real_public/PropertiesFiles/sFslAxU9Ydo2x2l5reQrFZ8tWc1Mlg2Yqiz3ntia.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-23 17:56:19', '2024-12-23 17:56:19', NULL),
(688, 'property (1).jpg', 'real_public/PropertiesFiles/hYx137XyHMfT6W02yIVjk6gfqMDEYvYx2kAPYQaR.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:24', '2024-12-31 06:04:24', NULL),
(689, 'property (11).jpg', 'real_public/PropertiesFiles/fY6Y3ZoG8t0vrzlg0nAsAHI7HwLe0feSUbhAtiUc.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:24', '2024-12-31 06:04:24', NULL),
(690, 'property (7).jpg', 'real_public/PropertiesFiles/sJfZsqhARmeA1KI7swrgNBwNngIfkejwxnUz7q6H.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:24', '2024-12-31 06:04:24', NULL),
(691, 'property (2).jpg', 'real_public/PropertiesFiles/Mz9S8je1OSvOGSDtMPry4DhZjd42JRz1U5LYYWHW.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:24', '2024-12-31 06:04:24', NULL),
(692, 'property (3).jpg', 'real_public/PropertiesFiles/3kAxEWsOBtQ0IETtfuRpivjldocBHrgP2PfJTf0e.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:24', '2024-12-31 06:04:24', NULL),
(693, 'property (4).jpg', 'real_public/PropertiesFiles/GZvIkdIvmt2Oj1tPsMOD5R2FlRJTqr565pGM1bZy.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:24', '2024-12-31 06:04:24', NULL),
(694, 'property (3).jpg', 'real_public/PropertiesFiles/0XCzylQ5CDb5cz4AdjtqtREES1r4R1qAKXPwVsJr.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:24', '2024-12-31 06:04:24', NULL),
(695, 'property (6).jpg', 'real_public/PropertiesFiles/BLkIg90aTd57rFcXrkwyHkelXiVcXVT5ChYCvtJM.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:24', '2024-12-31 06:04:24', NULL),
(696, 'property (5).jpg', 'real_public/PropertiesFiles/NjsBy50LMs6iSDhGVZAqSKVcRHR3KCS7fQmVA9V4.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:24', '2024-12-31 06:04:24', NULL),
(697, 'property (3).jpg', 'real_public/PropertiesFiles/x2Q69sfFS79PPh3FSFqopV2lZEV8Ij2UzsTt5x7q.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:24', '2024-12-31 06:04:24', NULL),
(698, 'property (9).jpg', 'real_public/PropertiesFiles/BZHirxIZwC3s2r6x05Imdm6LC6BxFANRRAtyN9uV.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:24', '2024-12-31 06:04:24', NULL),
(699, 'property (11).jpg', 'real_public/PropertiesFiles/rmqMfz6yH1cvUm7181JB8h2tE6T0eOW9UDBxqKYc.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:25', '2024-12-31 06:04:25', NULL),
(700, 'property (3).jpg', 'real_public/PropertiesFiles/1ejSwRGbBOIHH96G8JYnjjoDNwx7N5njzL9Kutaa.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:25', '2024-12-31 06:04:25', NULL),
(701, 'property (9).jpg', 'real_public/PropertiesFiles/OEtxhPwTp8R25ZDfEEu2BGsfBBW0l4aVOBVZHpKu.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:25', '2024-12-31 06:04:25', NULL),
(702, 'property (11).jpg', 'real_public/PropertiesFiles/yKNONZ6Y2PojBZGzYs6fa64jxqRvf2VoB2xoDMD3.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:25', '2024-12-31 06:04:25', NULL),
(703, 'property (3).jpg', 'real_public/PropertiesFiles/RlyfDLyKcG5CCqjTDuCAI2rdSF7Azeeowb8lBbrx.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:25', '2024-12-31 06:04:25', NULL),
(704, 'property (7).jpg', 'real_public/PropertiesFiles/xNd2VeOlBslocVWh4X7krJtxrmUbz8qoWu03gRZC.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:25', '2024-12-31 06:04:25', NULL),
(705, 'property (11).jpg', 'real_public/PropertiesFiles/6n6E8H2ZQlN3VQlRD4vqEWknW6UrNYo2Bfrt9h6g.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:25', '2024-12-31 06:04:25', NULL),
(706, 'property (3).jpg', 'real_public/PropertiesFiles/HrFfnmfmNO0WzJtnc1GavtlcItnrKncD8XtdPlyK.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:25', '2024-12-31 06:04:25', NULL),
(707, 'property (9).jpg', 'real_public/PropertiesFiles/oJVzJHh8gSkiE2B0WruQITdZrMKkzTyftJXLM5Ts.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:25', '2024-12-31 06:04:25', NULL),
(708, 'property (8).jpg', 'real_public/PropertiesFiles/pbwslNYB1A9pjb8znKvsQYMwsxkOOauRrd1JKU5O.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:25', '2024-12-31 06:04:25', NULL),
(709, 'property (10).jpg', 'real_public/PropertiesFiles/u69vwQ7uWijxJEe1GVdbFJihqNR8CFgvMS7Yqs6X.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:25', '2024-12-31 06:04:25', NULL),
(710, 'property (9).jpg', 'real_public/PropertiesFiles/ZMW8mfm6sbpcQy34nGMU7Z0iGQqC22NlX7GAd7TH.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:25', '2024-12-31 06:04:25', NULL),
(711, 'property (11).jpg', 'real_public/PropertiesFiles/K3hMakMJCs3MJwxgntvl7eA1YeMMt3pdzg6G4e5V.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:25', '2024-12-31 06:04:25', NULL),
(712, 'property (3).jpg', 'real_public/PropertiesFiles/kpKxpuxuDoQAi3oYcTnQPv1aovG5rAvXAy8NGxzk.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:25', '2024-12-31 06:04:25', NULL),
(713, 'property (3).jpg', 'real_public/PropertiesFiles/ALFtlXEVPYpZx4oYoKVtEhJVGoJQp5Olj7BNK6x3.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:25', '2024-12-31 06:04:25', NULL),
(714, 'property (11).jpg', 'real_public/PropertiesFiles/uXHxICrM2sHGqoLpoBTJpTP5JwkBczAezGukgyH8.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:25', '2024-12-31 06:04:25', NULL),
(715, 'property (5).jpg', 'real_public/PropertiesFiles/iEX9MlZo8PG8TXSpBYp8BcOo8YAl3zsguq0ksThk.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:04:25', '2024-12-31 06:04:25', NULL),
(716, 'property (1).jpg', 'real_public/PropertiesFiles/YqdUWkJaWkYc8P3Dk8IzrULCsAV9vee24uwjYrKl.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:16:36', '2024-12-31 06:16:36', NULL),
(717, 'property (11).jpg', 'real_public/PropertiesFiles/52dkAN37lEtw1dKxkNiMzBZUpNYZ68Wd9IcOKmNh.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:16:36', '2024-12-31 06:16:36', NULL),
(718, 'property (1).jpg', 'real_public/PropertiesFiles/Zfd9T0WfGTPzd0jcuxgC3B5ux9zIxo9UUF1kChh2.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 06:16:36', '2024-12-31 06:16:36', NULL),
(724, 'property (1).jpg', 'real_public/PropertiesFiles/UTRTHul4ZTC2gcshtlloJ6iE9gvIAaXBSHOkoxug.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 15:32:02', '2024-12-31 15:32:02', NULL),
(725, 'property (1).jpg', 'real_public/PropertiesFiles/XGNl01Qe2qaWAdQk0ePI0jHwKuUN5Sw5W61gtjWH.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 15:32:02', '2024-12-31 15:32:02', NULL),
(726, 'property (1).jpg', 'real_public/PropertiesFiles/yPQxK6pVCBEizryRwt4X44098qomMMeAHz1Ff6Le.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 15:32:03', '2024-12-31 15:32:03', NULL),
(735, 'property (1).jpg', 'real_public/PropertiesFiles/R1A7BOpuvT18bw4ULr5IOkMMeVGkxJRZUGNgjoRL.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(736, 'property (11).jpg', 'real_public/PropertiesFiles/JGbvsIX1qHYM0pUShJZ9dquRBuPZ3WzYwQgCuCX2.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(737, 'property (7).jpg', 'real_public/PropertiesFiles/hfrqXaJJL81CY0mMFlB6uXsD3ZPpS6cBnwawmlQG.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(738, 'property (2).jpg', 'real_public/PropertiesFiles/YkHMRD4qxzBMAHNb0tkFPiaQnCvC7SwLyDOisCJw.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(739, 'property (3).jpg', 'real_public/PropertiesFiles/HDyfGynbdfWCeb62h8iIoUQ7zVoajr5BC9x4gMDl.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(740, 'property (4).jpg', 'real_public/PropertiesFiles/k1RCsPzR5skOcSw6wmCr2qh6I4ZLBRbA0XyTPA9g.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(741, 'property (3).jpg', 'real_public/PropertiesFiles/sTrQ32AHyu1QjRHS09XzdSwfaLeG6su2BQYpwwio.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(742, 'property (6).jpg', 'real_public/PropertiesFiles/sjQUqYHcetpM8O8ZU6cMjAyYZTxTAIHV2137Bzap.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(743, 'property (5).jpg', 'real_public/PropertiesFiles/BsYPe3vI0su4UK6X9baAP5uxLseu3haHZAIgyX8Z.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(744, 'property (3).jpg', 'real_public/PropertiesFiles/0NUVVxAZVSwI2n6N89iU1emxcgPiaKcYeZXxr56A.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(745, 'property (9).jpg', 'real_public/PropertiesFiles/oMfkC1xGB0WXF8qj7hsHioZ3bxrGuel6LVFCoqan.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(746, 'property (11).jpg', 'real_public/PropertiesFiles/4S6KXRKPWiSeEnRzCpDuAOyzPgXEt5JM3aGWJMZ3.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(747, 'property (3).jpg', 'real_public/PropertiesFiles/htsGAacIzbtTom5bNrs8tGAg7ptCnklajrfIE5Wo.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(748, 'property (9).jpg', 'real_public/PropertiesFiles/zaNMiV2uhdHqj3C0vE9689kNG80md9Dzx2O2m4na.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(749, 'property (11).jpg', 'real_public/PropertiesFiles/4OjtAGPJvS2ZgBx4qFnbpqtUiTxFG28iEUkuJKot.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(750, 'property (3).jpg', 'real_public/PropertiesFiles/LBbche2gp5wvDog8SgngITos00RAJNN7bqiyKaqj.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(751, 'property (7).jpg', 'real_public/PropertiesFiles/dy0xzI5E51Z8jlPzDsCoNY31v5dTzfvlgEGQvUB4.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(752, 'property (11).jpg', 'real_public/PropertiesFiles/dr7CjzbvLpYW8Uas1Utj8c2tIQRCWFP3QshYghTB.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(753, 'property (3).jpg', 'real_public/PropertiesFiles/LAvbiC28WdjYSGBgR5dn7rcAmDFk1ZwoGFOjMSF0.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(754, 'property (9).jpg', 'real_public/PropertiesFiles/VMCNVnSOo0sqgot3mt0Uu5OrV0f14l6rmmyVS6Rs.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(755, 'property (8).jpg', 'real_public/PropertiesFiles/ha0D9e9s07Cpg9awmghggTWHVloWO2NMNC0jaLIT.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(756, 'property (10).jpg', 'real_public/PropertiesFiles/u2Jd8T5f1YptwTmTnqHv6oGxvwmKqibOjUvugTRo.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(757, 'property (9).jpg', 'real_public/PropertiesFiles/R606UisaYSOA5sUI483gC4sI0vCAg3YO7EmLx8xr.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(758, 'property (11).jpg', 'real_public/PropertiesFiles/wenDS8yDCxgiy1z07Y7TQZgeSbGZ8kmtHdtiYzv3.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(759, 'property (3).jpg', 'real_public/PropertiesFiles/xiUs59lJRZdhX6NsteA0UDT7uIxdsiWGUJQki56E.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(760, 'property (3).jpg', 'real_public/PropertiesFiles/hicczrmNXHnH4NW2dsK4lUvslljy1KcdsYnsakZd.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(761, 'property (11).jpg', 'real_public/PropertiesFiles/1SvFNzo8TRCqTYqRK34oRbwddhO9helgP2K2zSz1.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(762, 'property (5).jpg', 'real_public/PropertiesFiles/Z01fhcUIU3TlDMj1FdBRlYkTqHTrt0PWpz2kiSup.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:05:04', '2024-12-31 16:05:04', NULL),
(763, 'A1.jpg', 'real_public/PropertiesFiles/UwyMnHAC9WrJ9WF3vfZHN3ZJuGeFFVkoAgPUiYaX.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(764, 'A2.jpg', 'real_public/PropertiesFiles/d4TCLfYZ6qwl7udQfBYyf1GHAasaGDORE79c9JOo.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(765, 'A3.jpg', 'real_public/PropertiesFiles/zMkkiLJPGR2NoklQqHBMuGRsfT73XzewEh3Uy5B6.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(766, 'A4.jpg', 'real_public/PropertiesFiles/TzwCJSMQdR6bSwunPavSuWt3vxHdvuE7y3bp2Ota.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(767, 'A5.jpg', 'real_public/PropertiesFiles/zNSoGXQy14f0BIVcMs7LCq1C23qB8P67e324SNVv.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(768, 'A6.jpg', 'real_public/PropertiesFiles/fUo747v2VeuQnMwrhiDTK38XrZYFA0CqufUDVvza.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(769, 'A7.jpg', 'real_public/PropertiesFiles/aYx1Ds8lLvTd401xvNgGc3mkSNHbvnlBPQeo7XT8.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(770, 'A8.jpg', 'real_public/PropertiesFiles/JKXphIZ3SGVm1SsnQLpSPGA9pLSphaKMdM0lkgV9.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(771, 'A9.jpg', 'real_public/PropertiesFiles/SmZ2cUro3kaxgt91eKt86ebnaYPSE7FgwDlpY4Oe.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(772, 'A10.jpg', 'real_public/PropertiesFiles/9oDmPldAQJE2XdQEi1tG524fP770aXRCYf4lxFwh.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(773, 'A11.jpg', 'real_public/PropertiesFiles/LK6KnVHR1vYuL7th9d2UvONy3cjHjMfL8mQfVHAu.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(774, 'A12.jpg', 'real_public/PropertiesFiles/0bUZNiFFeRliLV97UCFcFLSeZ2vY5k2QDXSVZOfN.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(775, 'A13.jpg', 'real_public/PropertiesFiles/5MjWZU4Y6oCZQCRSg93RpzszNYC1S7LpPDKcejYS.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(776, 'A14.jpg', 'real_public/PropertiesFiles/X53op6A9OGaGJgkByRthN4nA3NQ1iKSU9kcwrp7T.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(777, 'A15.jpg', 'real_public/PropertiesFiles/14mcmkD7Lp0hdVPFOtHqgZcn1zuP5x0fOfRr4SAv.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(778, 'A16.jpg', 'real_public/PropertiesFiles/ur8f8dtDTv1TIygJy7MZ6NMhtTttfN2JQYX1JIR4.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(779, 'A17.jpg', 'real_public/PropertiesFiles/OxbJTtZ8bb6HYiVHj9iNSiq8HqMYNTUFyQ8I6HAW.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(780, 'A18.jpg', 'real_public/PropertiesFiles/qKO8VYr2UZawhY4WxHCviCidExmwXC9hiszGts7z.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(781, 'A19.jpg', 'real_public/PropertiesFiles/ajpfxfuH0sxm89r4ilhXfPM2zBPCh2aOiUXl8rJ1.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(782, 'A20.jpg', 'real_public/PropertiesFiles/hr5i9hnh3qupG8QRYMdbVpmGeaDsrH3cYnqFIrSh.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(783, 'A21.jpg', 'real_public/PropertiesFiles/yOutAdIcPKO1uUdAV69kA5dSFsee6a25TRCYIhVl.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(784, 'A22.jpg', 'real_public/PropertiesFiles/Vc0zOrspHSEylCVB8sL9ok09csq5UWLGBUkQtKHO.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(785, 'A23.jpg', 'real_public/PropertiesFiles/Z8f0qIPrh3YXOwyQbuORRvcYUabNB2h40evYvZ1P.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(786, 'A24.jpg', 'real_public/PropertiesFiles/8EHLp9OobD4NvGmhfoE97cyu3DCoFItv9OMSZQVy.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(787, 'A25.jpg', 'real_public/PropertiesFiles/PjgQkWCIcNhLjtznnOpyse0PyBJcu5TpUAPuY7L9.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(788, 'A26.jpg', 'real_public/PropertiesFiles/mCUbyhIq8fNg3PfKJYfUvCUB2YRQnR0wAHkGy0mf.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(789, 'A27.jpg', 'real_public/PropertiesFiles/VaMQ5x8MFDtSHbZwtS09pNrG2N7VCAU0xh5k935O.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(790, 'A28.jpg', 'real_public/PropertiesFiles/cZLeMo0eoD4flMWbJPQErOBDCyDL0zYjixgUt1e0.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(791, 'A29.jpg', 'real_public/PropertiesFiles/vKrlvK5yO9g8xka9sjXdzkzixn9gWDeITCQ0XlUU.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(792, 'A30.jpg', 'real_public/PropertiesFiles/UB85Z8QhnwKTIgOrZLhCiueDTnvm5dqugNYGjooP.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(793, 'A31.jpg', 'real_public/PropertiesFiles/e88aEuwBrmhM2VjR3QiVlahugNEtU13lO75FWdzN.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(794, 'A32.jpg', 'real_public/PropertiesFiles/gGWbfT150qsnA2OHoQ83g2rpuKlEz7PclDfyxGuO.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(795, 'A33.jpg', 'real_public/PropertiesFiles/9a454hvadr8yWORhFjfmmT0wtLHPhxOhyo6LGrMN.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(796, 'A34.jpg', 'real_public/PropertiesFiles/9t4k5FFgYmztRqmFxu9FJXbxRU1IyGAA2qyj84YU.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(797, 'A35.jpg', 'real_public/PropertiesFiles/yjmNgwILlJ0eF8NfOQ9uREGThRlJdXcPmA6BR65m.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(798, 'A36.jpg', 'real_public/PropertiesFiles/4Kio5tDND8XHiDfirak8fw66Wci0EjOY3kuAHomN.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(799, 'A37.jpg', 'real_public/PropertiesFiles/EymeEX5EwbSZZGY2qVJG2E3X0gUZI7LahXCuLouj.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(800, 'A38.jpg', 'real_public/PropertiesFiles/uFFudhs7pphnTCHIJTULDxPJCuaT5U7bkuEEe9cb.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(801, 'A39.jpg', 'real_public/PropertiesFiles/LVw7RsTdmoQd8MKxzGVjac5Ke3nuTlzi5eJf1sGQ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(802, 'A40.jpg', 'real_public/PropertiesFiles/cSdfqsvBfCCBZfErZr32QMMD4LTNH23YY1tLDuCY.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(803, 'A41.jpg', 'real_public/PropertiesFiles/UZVgcNj6NBwbIQCO7qoa1J3pPxkq73MH4uKXjyzJ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(804, 'A42.jpg', 'real_public/PropertiesFiles/VvrwJ3TbMngyPjOsUJUXgM1GyLAYmJi3QZIu7tTO.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(805, 'B1.jpg', 'real_public/PropertiesFiles/LnAS3htnIOD1SjEq4mEcqe61Vefm6XvzAZb6M2C6.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(806, 'B2.jpg', 'real_public/PropertiesFiles/m0sE3d2liQvBQcq9uZ8wFq9HoxPKsJyydz9GOjvc.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(807, 'B3.jpg', 'real_public/PropertiesFiles/bBZqVl0k5uJJUPjpF4Asxr0AhDVGXDy77sli5CKL.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(808, 'B4.jpg', 'real_public/PropertiesFiles/XFqHhJPrSCv55aXakctJ0OimaubVeWDt4fjaQaEF.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(809, 'B5.jpg', 'real_public/PropertiesFiles/KUGQZtnpr28FzmhU6xWYEvZRAhi820bg4PjTb7CT.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(810, 'B6.jpg', 'real_public/PropertiesFiles/jO8Abf80iqpRhW5CEu3HBGeXiR7nSRzaJEkue2c9.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(811, 'B7.jpg', 'real_public/PropertiesFiles/FsmYuqGXqVFBVWmUVIZtJKebljTokHhbmT9ENctX.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(812, 'B8.jpg', 'real_public/PropertiesFiles/y84u8zHfpyqNozaVWPrmkLSrzLTvTRPpVDsl6vqG.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(813, 'B9.jpg', 'real_public/PropertiesFiles/wG2k0cUQKg4FzRORZsiubYv70xFXdbg3RBh3q78n.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(814, 'B10.jpg', 'real_public/PropertiesFiles/DRBCXjX1FvD1bnsuXvNZ7zK1CP2EtGzHnLUGyp0m.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(815, 'B11.jpg', 'real_public/PropertiesFiles/8BfgcZeDsGf0shoVXv21KL7hnTZ7U3y0clzH3rK4.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(816, 'B12.jpg', 'real_public/PropertiesFiles/fyOijQOs5tmREHe63wAtFfr9GQBehmtt4GWrq6AR.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(817, 'B13.jpg', 'real_public/PropertiesFiles/hsmEu9u1qusGghdhEYhP7ckp7uVjQFjAj8W1uyLp.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(818, 'B14.jpg', 'real_public/PropertiesFiles/nhG57VBm1886Y97feP2TGJ1TzJGKe0T0PfPhlduT.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(819, 'B15.jpg', 'real_public/PropertiesFiles/BUg2ucEK6p07nUugfKTCiKkpkucuorREESbdBEQg.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(820, 'B16.jpg', 'real_public/PropertiesFiles/PRXZM9Phxa7ziaipPaFE0kcXvoncD6pHG2nxHZax.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(821, 'B17.jpg', 'real_public/PropertiesFiles/RrLPPA3gWAWII2Saub7RK7ZiCWFrul8BLzVCfthR.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(822, 'B18.jpg', 'real_public/PropertiesFiles/qgQMCRllLODFgwe2f0lU6qaoDFV1sAUzrSGfi8mn.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(823, 'B19.jpg', 'real_public/PropertiesFiles/Qqqa1ARKf9aJtQU9yvuMpJIGCSrpLo7XK1UfgLXP.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(824, 'B20.jpg', 'real_public/PropertiesFiles/0wie8yQj9DKafvR6wqWwKlh5KWXBhwpqdCPVzh69.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(825, 'B21.jpg', 'real_public/PropertiesFiles/lE5qdZ6nu2ElVAQTJCG4sWcE56MsX3EwiJVz1Cga.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(826, 'B22.jpg', 'real_public/PropertiesFiles/FrOxKyz1oWOl2zCiZl7wm53gWcf8onEssNBCZZmi.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(827, 'B23.jpg', 'real_public/PropertiesFiles/SkCN54NjgOxlLdto44Q9cZAOi1Qoc8wRBFUyi9TO.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(828, 'B24.jpg', 'real_public/PropertiesFiles/Kpne9sbjRoGBOHl2CN97SqmweJOEULWPgOi9aA7W.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(829, 'B25.jpg', 'real_public/PropertiesFiles/Lpt1wVTPeGgUZC2jqq5n8v1Y8vrhjtjiNveogSV3.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(830, 'B26.jpg', 'real_public/PropertiesFiles/3YuUir0uQh5FRJ3hIpxpnDvbeLWP8Rg9seuD3h21.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(831, 'B27.jpg', 'real_public/PropertiesFiles/01prJVjOz8cmt3vZIH0d4Jd7qWNoIYhrf5hekwdD.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(832, 'B28.jpg', 'real_public/PropertiesFiles/kSW6BP050YbD96vkvWXkRSBOgvIPTWKcyItinQnJ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(833, 'B29.jpg', 'real_public/PropertiesFiles/uPfszZVX5uqtLEm6WRgVtaQ76qTWXTd00R0AscUn.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(834, 'B30.jpg', 'real_public/PropertiesFiles/bNLYbwnkmPlw97xau2V4b05XsqslcgpEyTv5XUn9.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(835, 'B31.jpg', 'real_public/PropertiesFiles/x3qTB1XvN25zDAuWyxwZ13JLwteaCEMe4HquigaD.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(836, 'B32.jpg', 'real_public/PropertiesFiles/GW1dO3RcvdQJ02pGHjf53bfeRVy1zNZjAQQXi2Cs.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(837, 'B33.jpg', 'real_public/PropertiesFiles/aE0Jr3Hb8XnQHGNJINDEGjpKa3PHW77KxSGWYcZq.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(838, 'B34.jpg', 'real_public/PropertiesFiles/BbvQ6EeQjRvg3Mp4KOYNHMEDrVQzh7PI0Pmtsw2U.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(839, 'B35.jpg', 'real_public/PropertiesFiles/SL0m4CzpNh3vOKdts5FqDieNvQyjW3dkNHKmx9BV.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(840, 'B36.jpg', 'real_public/PropertiesFiles/8b24oGtht0s02ZTydkwlewxCqOXTKpXZdLZJzBWV.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(841, 'B37.jpg', 'real_public/PropertiesFiles/xTNJ3et9gYbavRWyUMnygJHYtTm92bGfrIhquSO9.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(842, 'B38.jpg', 'real_public/PropertiesFiles/zuoA32jahMHnWImuykyiF2uXfiUr2styCjID7EIO.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(843, 'B39.jpg', 'real_public/PropertiesFiles/lhyVfPSYiwqNnMPX5dGNB7b9HnOwIbewLQxjJH1F.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(844, 'B40.jpg', 'real_public/PropertiesFiles/4tmELcFMEdsHC7aLkidc5KbUsXob3mEVZNhU1okx.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(845, 'B41.jpg', 'real_public/PropertiesFiles/P70vT0mKiAVELT8EEvqdj0Gc0a5BU9o7naN06cs2.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(846, 'B42.jpg', 'real_public/PropertiesFiles/SHjd1QhsYAczwBlrqvcHBOrXO4NE5Ml9y1LwkhDu.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(847, 'C1.jpg', 'real_public/PropertiesFiles/RoYCz4QgvBk1QCbiQnlIOu1e9k98ihILeA5TDETD.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(848, 'C2.jpg', 'real_public/PropertiesFiles/mxhR7v8UKZwmawTRR2PasJipFDkMS0eSIEe6B9RE.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(849, 'C3.jpg', 'real_public/PropertiesFiles/sDV9iYjIJtEeeLPbMQiuYAU6OQq4iQIYelge1uHD.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(850, 'C4.jpg', 'real_public/PropertiesFiles/vmDSXfqoaxNm6YcwjuDdqAo5hiKrlTyIXtUElrfJ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(851, 'C5.jpg', 'real_public/PropertiesFiles/RBX05qnyZar2MhmGYc9DpFINkSSf0xmGmy2tUNl9.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(852, 'C6.jpg', 'real_public/PropertiesFiles/x8SKSSeEUZctEgCCi6LNaQLapeAViUZSts3foqER.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(853, 'C7.jpg', 'real_public/PropertiesFiles/k5xQYDipmoZcplEsExneFbiW2Dxg2nt6Qlz4kcxG.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(854, 'C8.jpg', 'real_public/PropertiesFiles/nTlzZZ1jTBWEHARrDVMUPQKE7YAaXvm7NG0fpGxz.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(855, 'C9.jpg', 'real_public/PropertiesFiles/56AIkqOBUcDU9RRPfHHaPMHC3UQ6oSyt4aIKLPIZ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:50', '2024-12-31 16:06:50', NULL),
(856, 'C10.jpg', 'real_public/PropertiesFiles/witiRiNYV00o6I0wjmO8mP0dlqHhQeP5jIvhTgwz.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(857, 'C11.jpg', 'real_public/PropertiesFiles/NGq7fUvybHReBkZQ6y4qvFrJISwA6iit8gimr7L2.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(858, 'C12.jpg', 'real_public/PropertiesFiles/Q7JpAC61UxNaNPokgNf4nvT2W1zRf0OufNAmzuRs.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(859, 'C13.jpg', 'real_public/PropertiesFiles/1oMabYWFfl1YvqruSutY62mtyHpOrkAc6SvBU8wn.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(860, 'C14.jpg', 'real_public/PropertiesFiles/52fh7zYr0gpXFg2n5Zg9hwEppSoOEw4FqiHu5VRV.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(861, 'C15.jpg', 'real_public/PropertiesFiles/zlTuvbj5d11WFWRICt7TfyZTGDBANUz6gvWlUIzF.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(862, 'C16.jpg', 'real_public/PropertiesFiles/ClxFIE8q1TX80m4n51Zs9xNHRMBYIknRLfBzqH1X.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(863, 'C17.jpg', 'real_public/PropertiesFiles/AakG0qPvnpW8fpUAFLO3RDRneh0kuRUzQyECpKmb.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(864, 'C18.jpg', 'real_public/PropertiesFiles/pfFIB60xTSB5UIWKxTAetjw74mjKru7WtAqKRAu4.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(865, 'C19.jpg', 'real_public/PropertiesFiles/dYkOV8W9rHdrUCkUtw9ZqyRgVVqGu2g4GdtjeI0x.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(866, 'C20.jpg', 'real_public/PropertiesFiles/mMjn8i1DUmxryCYxOGl8jSZr3piNYCFBirlloKEm.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(867, 'C21.jpg', 'real_public/PropertiesFiles/TVL2qMTPWUGHlWYBUT1oAuyZf2x0Ibgd3BYjuMun.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(868, 'C22.jpg', 'real_public/PropertiesFiles/w5bryLEgmfcKKRfTuQ8N31S3blOGKtaCxItMNiaz.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(869, 'C23.jpg', 'real_public/PropertiesFiles/EJa23rAONNxc9EyaslfwJDZId6NRPYWCZpdK8s0C.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(870, 'C24.jpg', 'real_public/PropertiesFiles/j3JI7PLtSJhLfCAYDdXXy5Q4QnFdabE2vPBjS08m.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(871, 'C25.jpg', 'real_public/PropertiesFiles/4kHaSdNPT9MhTZkjqUVUSm9VWtdRGwfn7kx86Ogb.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(872, 'C26.jpg', 'real_public/PropertiesFiles/Pv4gUU0Zh9hrgvOjGaZFxeT3ZEtTmbtDXZr8xKqm.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(873, 'C27.jpg', 'real_public/PropertiesFiles/wj7fxx2JRU8R6vEdUHuYGszWJm8sZLMCGFoO7Avh.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(874, 'C28.jpg', 'real_public/PropertiesFiles/FCImncGQicqgKsCQfV6b35hYTp5Z3Rkzq8xNRTQY.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(875, 'C29.jpg', 'real_public/PropertiesFiles/g0yUCgBfIDtZkWTD7A6SainGBCVae1Op127eWvy6.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(876, 'C30.jpg', 'real_public/PropertiesFiles/HkXrqW9c4aCDrRn3D2FqPIepq9qK3SawqC6E9WFA.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(877, 'C31.jpg', 'real_public/PropertiesFiles/dl2Dt9mBxhISWdWyl3hu8OQQZxldBUCU6pdhnsKw.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(878, 'C32.jpg', 'real_public/PropertiesFiles/ZK6toGcjKxwQhEgYwyerRWUpwXKZxpKOljmgWode.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(879, 'C33.jpg', 'real_public/PropertiesFiles/eLTDl7i4GHXNL6Ri4nuMY6SQezd9HhiPX0pvoemy.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(880, 'C34.jpg', 'real_public/PropertiesFiles/5ngJGyKXgRgNIHntEAn54h7p9lxHwkNdwnJImOKe.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(881, 'C35.jpg', 'real_public/PropertiesFiles/DWRchPHCuv8Jh5VqaPlV4U1sYrnK7DL08rKxvJIW.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(882, 'C36.jpg', 'real_public/PropertiesFiles/pVuRUaelOGRTTSWT504xJpmCyhoRvB1yyk40V2a0.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(883, 'C37.jpg', 'real_public/PropertiesFiles/SlZaB1WxPHeOKZfp98nm0SROany0J0QVmtcmJgOY.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(884, 'C38.jpg', 'real_public/PropertiesFiles/a0kssheDWGG6ljQP1Z1DvRjyHh5HCFPcO88rgi2k.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(885, 'C39.jpg', 'real_public/PropertiesFiles/TPgovaKnQfoorvZ4OAQHCOtdx56r3di6ltbzSjZb.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(886, 'C40.jpg', 'real_public/PropertiesFiles/QOktcRcZ1SBpjeixbvUmJthLg7OdzlmLnUSxKeIw.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(887, 'C41.jpg', 'real_public/PropertiesFiles/Y2QaO6plRk0oxAQXNAE3kda6ZM939zPkr9ZEqfTH.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(888, 'C42.jpg', 'real_public/PropertiesFiles/GoAAROt2PmB26tUig3z5oqkRBdweW3DVjxnXn3ZX.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(889, 'D1.jpg', 'real_public/PropertiesFiles/haA4Gfi6hF66WdNP5pLXQyCw68r0BWpv67qcNHjI.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(890, 'D2.jpg', 'real_public/PropertiesFiles/hSA6Pxsy5hpCqDN2073FG93o4xzTJsdrX5DPyQsu.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(891, 'D3.jpg', 'real_public/PropertiesFiles/uKpT0U9PceZJ1YKCrTTB7Dxl8u2EI5IfQMxjBMuE.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(892, 'D4.jpg', 'real_public/PropertiesFiles/8yzPB89vjmsyGDkelVE5kLIT7WLnu3ICgiNWtpj4.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(893, 'D5.jpg', 'real_public/PropertiesFiles/ZH3WQx9dWHDTAGFezHIOhXXRPrMBZRZQ5bgQz2Mc.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(894, 'D6.jpg', 'real_public/PropertiesFiles/FGh5TBLHhfSJVBa0It41w4A41VoryMx7C0HPnIya.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(895, 'D7.jpg', 'real_public/PropertiesFiles/Z6Jpl8xlvzlXbEBnLFxEa61uPrJiCT3ic9QHQcIy.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(896, 'D8.jpg', 'real_public/PropertiesFiles/qoasJhOnaHGcJu70UY7rcNQP8cjogEQTMZH5qOpi.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(897, 'D9.jpg', 'real_public/PropertiesFiles/Ob2NzTdgFXOIj8zqh3eiQghP26IxJALIPAiROO4m.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(898, 'D10.jpg', 'real_public/PropertiesFiles/cCbHKfvSeQLr1sWKI1vfEghJbBVd8A6AIlV8QRwB.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(899, 'D11.jpg', 'real_public/PropertiesFiles/ISJVXWvdLOgx80XYmf6d6nT7ymwGMBD2IyaV8ezS.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(900, 'D12.jpg', 'real_public/PropertiesFiles/FQb07Hd2AT2X4l7l9FyBOYH2jzY5XyCGAyMeTM9d.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(901, 'D13.jpg', 'real_public/PropertiesFiles/TdZs3WwW0pr4umsF1OK2HxNd4GjmqX2UIMILqn3r.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(902, 'D14.jpg', 'real_public/PropertiesFiles/4fiTFYvZIH1vs0UhPJOkb57L3Wal9zEaQ6hf5YRX.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(903, 'D15.jpg', 'real_public/PropertiesFiles/q0axaLxCAYpXlCfTaoqZS9OExLih2gpdds7uJAYc.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(904, 'D16.jpg', 'real_public/PropertiesFiles/AvLn57MqvmbYN6rMxxRzU5y559zqD0tD7qVXe3mh.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(905, 'D17.jpg', 'real_public/PropertiesFiles/konXMZoIOs2s6iHp1GQ6b1EdHCT4ShfuBlOtvMHK.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(906, 'D18.jpg', 'real_public/PropertiesFiles/R4oWa7OmSk3Gv9iuzluZHRQ9UFAchccnQ5eufRxW.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(907, 'D19.jpg', 'real_public/PropertiesFiles/SODd6QMYwfj7yHVKw0ozBXOBthtMgWPbrjGtUT03.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(908, 'D20.jpg', 'real_public/PropertiesFiles/IpvScm7HLCkw7JzmofjLBh0O5QAKsKP2rQJQ3IcM.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(909, 'D21.jpg', 'real_public/PropertiesFiles/RiQ9mNanzyiAXnBQO9HEv8cUVj5BXd2wg7KKgWqh.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(910, 'D22.jpg', 'real_public/PropertiesFiles/OuRgzgVHcYFGteoGXvoqi7F8hi4qcA6hLiFPD6xL.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(911, 'D23.jpg', 'real_public/PropertiesFiles/Daenic15L3OT3ikwBnsm4wZSSq6VYhi4n5AyIgu8.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(912, 'D24.jpg', 'real_public/PropertiesFiles/aF4wKtOv53F4QH9dIqEWpVLAP09NkvjR8C5gpPgV.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(913, 'D25.jpg', 'real_public/PropertiesFiles/jV6VwCMuAdLrFaodfF7r8HNncWMTtWIkJ0tDCv85.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(914, 'D26.jpg', 'real_public/PropertiesFiles/QkdZ3CaJeSzkkqySp3DJD4nDFobSTeEDVQ9IfPhY.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(915, 'D27.jpg', 'real_public/PropertiesFiles/qSE5i5Qh3t6RE2doQJieWVcl4QNoSTHZVruJEzkg.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(916, 'E1.jpg', 'real_public/PropertiesFiles/Cr8ziOaBor4V4ggVsfUNnatX7GkiJ7YwCqPDd4DW.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(917, 'E2.jpg', 'real_public/PropertiesFiles/QhUubqvW1suUFzNZJNOUD6qhChyRjMfWYkrpc4NO.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(918, 'E3.jpg', 'real_public/PropertiesFiles/AsCdTKhIWweW9tXKgiXbqAYRB69dN2lq8u7Zt6cY.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(919, 'E4.jpg', 'real_public/PropertiesFiles/atdOpBUBajt7z1MhAdViFzYGoVuEkwQ00LH0zm82.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(920, 'E5.jpg', 'real_public/PropertiesFiles/LFkREAO4Hg9UYX0W25BATL5vArvNVMNamRBRXlvr.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(921, 'E6.jpg', 'real_public/PropertiesFiles/pkgoPGfxVs1MbwIPZJTSuUVIjvdxaQ9Vj0js3TSQ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(922, 'E7.jpg', 'real_public/PropertiesFiles/HDclzzZKqox5yUtnt7LLaO5Ujl2hJvX0tgv3v4Rr.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(923, 'E8.jpg', 'real_public/PropertiesFiles/DoOVMx7bqveoO8dvATHUG0DQSaO4HeeGkapDZNtE.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(924, 'E9.jpg', 'real_public/PropertiesFiles/WoNvdiz6DJM0INP34WXKIh2TI3037XXQvnTtVRN2.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(925, 'E10.jpg', 'real_public/PropertiesFiles/VGm47jE6uGOVeiXROGqiQoQ8BBXi6kMBEuoXUiJQ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(926, 'E11.jpg', 'real_public/PropertiesFiles/oyYA6AifxbdxKQbXIbrPFICZviTKWNXf6i0H6kG7.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(927, 'E12.jpg', 'real_public/PropertiesFiles/bFXRXveC5c9Khzm085TBlEMVaOIWV9S09kTNsLqo.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(928, 'E13.jpg', 'real_public/PropertiesFiles/mXyQm4zXK3jwu6GXLoOCdo7WnMAwLxFi3uvQ4Dst.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(929, 'E14.jpg', 'real_public/PropertiesFiles/NxnpOOS7p8H97B3lwZra2mx6iYTLvKNmgtLiD9QG.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(930, 'E15.jpg', 'real_public/PropertiesFiles/EZGvUkpXX0kwrYDjF7rpmpsCdd6qXaxWAj1YfS8g.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(931, 'E16.jpg', 'real_public/PropertiesFiles/eB8xlVZ3yiPhr3iKLV6cvE7UHOlQ05YDO73S1xHC.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(932, 'E17.jpg', 'real_public/PropertiesFiles/DKiaYQFpxbjtz2yFTrE8b63hAe6QepfWoOlAIm5S.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(933, 'E18.jpg', 'real_public/PropertiesFiles/4XtKs12fKpeuBCxYOD39FbKRcwt9vdfUYkkgbZ4Q.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(934, 'E19.jpg', 'real_public/PropertiesFiles/uQgpNd3Zx4B48qkURi2sd9ebbAmzwYZUTIA7HavB.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(935, 'E20.jpg', 'real_public/PropertiesFiles/jBqjusmOKXfc3uZPoOEw1BEPDp8aankLiN9DViSu.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(936, 'E21.jpg', 'real_public/PropertiesFiles/AI3vPg3rav2qTtRsv7MXCZyoIQaWJSSDaOMvQUAA.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(937, 'E22.jpg', 'real_public/PropertiesFiles/HfkjOAHuNoDWrJyZB8bw5fog49t85cI3z9JBlFrE.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(938, 'E23.jpg', 'real_public/PropertiesFiles/a0u7yMTvVFdt5AcscUBDxodwFmbYnBmYXzxm0mln.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(939, 'E24.jpg', 'real_public/PropertiesFiles/tsVdDHBbvMVHuCQReO021orCBafvLH9huwbvQSPN.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(940, 'E25.jpg', 'real_public/PropertiesFiles/vZLueMmq4xNmhfnGv1LqkVmiQgYhnzTKaZbJ6xQj.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL);
INSERT INTO `uploads` (`id`, `file_original_name`, `file_name`, `file_size`, `extension`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(941, 'E26.jpg', 'real_public/PropertiesFiles/pDssbaFO2FhCz2sPWP8agr145MRI8nxYSE1xPoaq.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(942, 'E27.jpg', 'real_public/PropertiesFiles/KU5D6tyEhOScfntGZbQop4b3Ricf1ms6oVBoK1FU.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(943, 'E28.jpg', 'real_public/PropertiesFiles/SSnkbd0JCmEQpl3vIhXpSpEp6WCdbHHhbs9q2xBP.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(944, 'E29.jpg', 'real_public/PropertiesFiles/mieVO22VxejIEmO3uS03iYSr6qr2TueysxUrUMQy.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(945, 'E30.jpg', 'real_public/PropertiesFiles/qugClZflqIqEYJp1vXaKqL2W6giXXhemQ8NKVyOF.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(946, 'E31.jpg', 'real_public/PropertiesFiles/HZRP4gcxxUinA9Zz7Rr2dA7CXdbMxP1yHejNEUrl.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(947, 'E32.jpg', 'real_public/PropertiesFiles/AygbOCCKtCaRQeYqwRc6OVmNHSn1oty7Biu8Sy9h.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(948, 'E33.jpg', 'real_public/PropertiesFiles/loCG5cprCy0rgORaRopERcFamR8S8E5HFJk08t29.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(949, 'E34.jpg', 'real_public/PropertiesFiles/fmpTNU5V9wEjrOGshGlEnWFgG7GdRFTLiKdP4Ar6.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(950, 'E35.jpg', 'real_public/PropertiesFiles/BIQinJ9Pus0OjcQT0gDRrIbg5R78XxmTEPJzqyiv.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(951, 'E36.jpg', 'real_public/PropertiesFiles/GFBdK26oJTeQn4pueMEpi1IXpJacmso72kaWdJGr.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(952, 'E37.jpg', 'real_public/PropertiesFiles/gjqJpysZnCrbDXezNXalL9keMCvGxbTBwtYojcYu.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(953, 'E38.jpg', 'real_public/PropertiesFiles/Od4JfvMfcwhA9wUVlA3RAPoubmpLlBbB01o3KJZn.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:51', '2024-12-31 16:06:51', NULL),
(954, 'E39.jpg', 'real_public/PropertiesFiles/TnE6GneDipTdZ1LKhkcZXWfVJgcBksbpa8QE43Q1.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(955, 'E40.jpg', 'real_public/PropertiesFiles/bxOYeSZ64PJqRxzDGdGKkjRW6XEXxHcugGLSZqb2.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(956, 'F1.jpg', 'real_public/PropertiesFiles/8Df1xD804yOsUZ6kLi29aE8fIvr5AHanTgO8mxtL.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(957, 'F2.jpg', 'real_public/PropertiesFiles/jR8E2AJYIj3RYMSOx0uvQQqhbdhrIfWB2hQFsGiJ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(958, 'F3.jpg', 'real_public/PropertiesFiles/wSZzYiLDh7tc6AzVmZtDsjW1lNEcAh0OSkbx74qi.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(959, 'F4.jpg', 'real_public/PropertiesFiles/azo18HOOUqZ1V3sPF5GlnBFchSaPGNkIQAnAqMyz.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(960, 'F5.jpg', 'real_public/PropertiesFiles/pGssGgbThtN48H7p8f7QA9STF1TNc9UU28geodTi.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(961, 'F6.jpg', 'real_public/PropertiesFiles/XEwoohSsIxe77Kl37jqG7osC5FMHtTM8GE5cG8VR.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(962, 'F7.jpg', 'real_public/PropertiesFiles/T0OyjqYwWGWWCZDrsKb7CivbaO6GO1BDxFd93PqT.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(963, 'F8.jpg', 'real_public/PropertiesFiles/ig3Ytlzp8C6IPg5bNZ98nlvrmZd8Ly96oD7sc1Ve.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(964, 'F9.jpg', 'real_public/PropertiesFiles/wqZtOy1VMwa33zmSFaKsUlvtaR5cmMDNXEgAUMXe.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(965, 'F10.jpg', 'real_public/PropertiesFiles/oC22Zt5LweJZq2LSuaEEgOx2pSTa2t3Bt4MoniUk.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(966, 'F11.jpg', 'real_public/PropertiesFiles/SYCHDsEtIppjrD19eHGB3A4RdyoN1tnXokH0aJ3v.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(967, 'F12.jpg', 'real_public/PropertiesFiles/mwPqGgiDAhX7jQGR1PK8vkNbbWek0xO62PvFpdda.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(968, 'F13.jpg', 'real_public/PropertiesFiles/lpzJ1O5r2FwiXys53MUjmcrh16Ia3sVKzwNsSCUv.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(969, 'F14.jpg', 'real_public/PropertiesFiles/lIzgccxTbTABkTp9xYz9Nnb3W5g5tdhfwl2pKgSe.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(970, 'F15.jpg', 'real_public/PropertiesFiles/gYpLVy3X8JyQK2Mc7SoiigSuqRbSZusA8raHrxTt.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(971, 'F16.jpg', 'real_public/PropertiesFiles/PJ42CmEIXGKc5eT9LaZhdplyHytwlrseUUxcpxbI.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(972, 'F17.jpg', 'real_public/PropertiesFiles/OQu5nD3j3nOhUrnt2pcvZcZujyyj1M2JllKOoIhW.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(973, 'F18.jpg', 'real_public/PropertiesFiles/0jDmJ0RebDIXB61tZuErRATx6UwPVpDQwANpCpdM.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(974, 'F19.jpg', 'real_public/PropertiesFiles/KLp0dXmhPfM5OxWSqeHzwpwuAxzY63kMnvO3j1hU.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(975, 'F20.jpg', 'real_public/PropertiesFiles/5Z8LG1mou70z7cnrABbzufW8TF1ubt4toV0aDGqD.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(976, 'F21.jpg', 'real_public/PropertiesFiles/ic7LtRHxNtiBW53pqMwIYcI28PkpyIfMoD8R0pNe.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(977, 'F22.jpg', 'real_public/PropertiesFiles/sWpVe5c07xnynaXOMD3IF3BgdtMYsiTy62vB6cnF.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(978, 'F23.jpg', 'real_public/PropertiesFiles/MbhnTDBXpcI00pDtjw0mImlRbKeURR2aQuf8NR3n.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(979, 'F24.jpg', 'real_public/PropertiesFiles/nxbv9H6rIGHIwOFU0i0GnQ0CqcfX3JGcOVS2Qals.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(980, 'F25.jpg', 'real_public/PropertiesFiles/k0vNgc5bho7KQV80rvqh7Dd1DUx0N1FMHoXl9eTU.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(981, 'F26.jpg', 'real_public/PropertiesFiles/cpc6iMxwSteSinPTRbUvd0jqlesbQWY1a7kFPuRO.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(982, 'F27.jpg', 'real_public/PropertiesFiles/cqWvL2AL2mPhsEcLaoPIiFayyKzMGZnnGH9RwZW8.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(983, 'F28.jpg', 'real_public/PropertiesFiles/lWCn5UmXv709xg4bsyrxh17ScG2xY8q4GNGJHnGL.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(984, 'F29.jpg', 'real_public/PropertiesFiles/jgJJHlpKVDbZGlrduUkdMr1aLuAoFWLDhhAntw5p.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(985, 'F30.jpg', 'real_public/PropertiesFiles/S3P2Hz5iYke3uj9xjkE2UVtdH7UDHqj8HhV99Blq.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(986, 'F31.jpg', 'real_public/PropertiesFiles/h4efLFJsXWrdPW4Qo3CdQN5SPXy58fjeuaDjoeNA.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(987, 'F32.jpg', 'real_public/PropertiesFiles/iUe4Yku0Qyb9L8AWKlmUlT566aShW8mYAI8HbBXq.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(988, 'F33.jpg', 'real_public/PropertiesFiles/SlSnk08AOUzP98wqwBvJhOlnoIc3NOW7htkE7Vbq.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(989, 'F34.jpg', 'real_public/PropertiesFiles/X4JZAkLeTx1fkTyC9g4Gqe8KnHGbfwPAQ80zoQtu.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(990, 'F35.jpg', 'real_public/PropertiesFiles/n31r18kVI0XeLWSARWU1VyHO7UbNipQzj0WKGOlQ.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(991, 'F36.jpg', 'real_public/PropertiesFiles/GjBAPUhfXXtRnCSt9DO2bPO8eKSR9NuVY3Sm8wHg.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(992, 'F37.jpg', 'real_public/PropertiesFiles/zCCY21S5lR8dKFbEXqgvhGqxvwTgHo6g8FrLpb1l.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(993, 'F38.jpg', 'real_public/PropertiesFiles/UQSiQiN4jEsKo6T1n3JCu2XoKRLnA3GYjDXDkOrb.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(994, 'F39.jpg', 'real_public/PropertiesFiles/p9qAcdxjOWqOlzRdbvxBdtfwuwhqhzGBX0cNsI5s.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(995, 'F40.jpg', 'real_public/PropertiesFiles/Fw1Irs1dsPgzxQSLYOM73T72X1nzyu4bZ4Z8Ujr5.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 16:06:52', '2024-12-31 16:06:52', NULL),
(996, 'A37.jpg', 'real_public/CommunitiesFiles//7oxNmglhMHH10USHtSMuNflpSwUwXzt8jG06sLb8.jpg', 56964, 'jpg', 'image/jpeg', '2024-12-31 16:17:44', '2024-12-31 16:17:44', NULL),
(997, 'A38.jpg', 'real_public/CommunitiesFiles//QXQmKADcBDdVhipFlRiy9zAK73JE1fViJPcDl5Px.jpg', 65615, 'jpg', 'image/jpeg', '2024-12-31 16:17:44', '2024-12-31 16:17:44', NULL),
(998, 'A39.jpg', 'real_public/CommunitiesFiles//jb6Sg14glsmZJA7Bb7G26jUR1hDUEzTkuLWSI4d8.jpg', 301145, 'jpg', 'image/jpeg', '2024-12-31 16:17:44', '2024-12-31 16:17:44', NULL),
(999, 'A40.jpg', 'real_public/CommunitiesFiles//BdGkutNoxncFZe42Q1yXuHOueheTZVbhlPm5AHpd.jpg', 301034, 'jpg', 'image/jpeg', '2024-12-31 16:17:44', '2024-12-31 16:17:44', NULL),
(1000, 'A41.jpg', 'real_public/CommunitiesFiles//NG3kajCZJKKhJ4uIO4QnWATDP1pBBGieDylaW2rg.jpg', 301145, 'jpg', 'image/jpeg', '2024-12-31 16:17:44', '2024-12-31 16:17:44', NULL),
(1001, 'B11.jpg', 'real_public/CommunitiesFiles//AxBhGOMfBN8IOD5I5TF2cE8QnFFjZwWAbmQwNYzj.jpg', 94543, 'jpg', 'image/jpeg', '2024-12-31 16:17:44', '2024-12-31 16:17:44', NULL),
(1002, 'B12.jpg', 'real_public/CommunitiesFiles//PWWFG2hx7lHbSBQ7PlDiu5vycZvh9o7F13cdLfG1.jpg', 94543, 'jpg', 'image/jpeg', '2024-12-31 16:17:44', '2024-12-31 16:17:44', NULL),
(1003, 'B13.jpg', 'real_public/CommunitiesFiles//GxHd0HO3Qay2h0uh6ukJbF2n1Gqb9OKE9IXQPjTQ.jpg', 60012, 'jpg', 'image/jpeg', '2024-12-31 16:17:44', '2024-12-31 16:17:44', NULL),
(1004, 'B14.jpg', 'real_public/CommunitiesFiles//bx7ztkvkbavaCuHxfAMAJN1mofmGlNRm0JmXyAVP.jpg', 58628, 'jpg', 'image/jpeg', '2024-12-31 16:17:44', '2024-12-31 16:17:44', NULL),
(1005, 'B15.jpg', 'real_public/CommunitiesFiles//37akBX76IGkcmfQtTRObMGcLNAOvI4i7thCcFxjE.jpg', 65095, 'jpg', 'image/jpeg', '2024-12-31 16:17:44', '2024-12-31 16:17:44', NULL),
(1006, 'B27.jpg', 'real_public/CommunitiesFiles//pyVtmTKYVdqE1tDSivb0wBj2YfMBKui3wBbtdMCA.jpg', 291359, 'jpg', 'image/jpeg', '2024-12-31 16:17:44', '2024-12-31 16:17:44', NULL),
(1007, 'B28.jpg', 'real_public/CommunitiesFiles//VAPoItHGjyOkiwNSzIgxPrzzmZ3K5E5NKMAmYauH.jpg', 303709, 'jpg', 'image/jpeg', '2024-12-31 16:17:44', '2024-12-31 16:17:44', NULL),
(1008, 'B29.jpg', 'real_public/CommunitiesFiles//eX9uignNYXyMxvD7Pc0XzeXrIRJIicVFHyXQP8yl.jpg', 303709, 'jpg', 'image/jpeg', '2024-12-31 16:17:44', '2024-12-31 16:17:44', NULL),
(1009, 'B30.jpg', 'real_public/CommunitiesFiles//ezLY9zw0zw0QqVElMJ6oepHUmRfHnDMXA54FAQky.jpg', 330578, 'jpg', 'image/jpeg', '2024-12-31 16:17:44', '2024-12-31 16:17:44', NULL),
(1010, 'B31.jpg', 'real_public/CommunitiesFiles//XT8lrikjZ55fKnLlBMp60NrO4vWSvBzPO5nzEo6V.jpg', 330578, 'jpg', 'image/jpeg', '2024-12-31 16:17:44', '2024-12-31 16:17:44', NULL),
(1011, 'real_public/CommunityMainImages/PGduGL83i8GHgAbJYrouKsUkCQ1MUUeS6H1lkeTL.png', 'real_public/CommunityMainImages/PGduGL83i8GHgAbJYrouKsUkCQ1MUUeS6H1lkeTL.png', NULL, 'png', 'image/png', '2024-12-31 16:17:44', '2024-12-31 16:17:44', NULL),
(1012, 'real_public/CommunityBannerImages/fhGBl2CYvFz7sHt5k8761URGBdnIry3Eiliptqkl.png', 'real_public/CommunityBannerImages/fhGBl2CYvFz7sHt5k8761URGBdnIry3Eiliptqkl.png', NULL, 'png', 'image/png', '2024-12-31 16:17:44', '2024-12-31 16:17:44', NULL),
(1013, 'A1.jpg', 'real_public/PropertiesFiles/CozI6v3GshH16Pj1QUq3WNtI0fESGU7FdEMIy2Fh.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 17:02:41', '2024-12-31 17:02:41', NULL),
(1014, 'A2.jpg', 'real_public/PropertiesFiles/zQWQXQLGgX6akwsdrRD2ZWJdvMbze4kS4RWYM7kU.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 17:02:41', '2024-12-31 17:02:41', NULL),
(1015, 'A3.jpg', 'real_public/PropertiesFiles/rpvc52iev5nO8nSJWlaCKuHvTdFh9Kbtrra6PhQa.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 17:02:41', '2024-12-31 17:02:41', NULL),
(1016, 'A4.jpg', 'real_public/PropertiesFiles/ZNGrXDmaPWv5d2s5PSvjKuzqBd1kqtoiOJEJpiQt.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 17:02:41', '2024-12-31 17:02:41', NULL),
(1017, 'A5.jpg', 'real_public/PropertiesFiles/wf94AxaQCagWb7NgieWedwJemlf2V5VywojGo5BD.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 17:02:41', '2024-12-31 17:02:41', NULL),
(1018, 'A6.jpg', 'real_public/PropertiesFiles/kvP9ARf98CPqviLRLFkBBrrCIXFxnegps0rkHXCX.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 17:02:41', '2024-12-31 17:02:41', NULL),
(1019, 'A7.jpg', 'real_public/PropertiesFiles/ev6I3njSipeT3LZgYGIxTLpsjPvhApEzfUZLjlxW.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 17:02:41', '2024-12-31 17:02:41', NULL),
(1020, 'A8.jpg', 'real_public/PropertiesFiles/7Z2MdvnS3jCrRijT8YmhsbLOSFcXQQXNAA7gzRNC.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 17:02:41', '2024-12-31 17:02:41', NULL),
(1021, 'A9.jpg', 'real_public/PropertiesFiles/e8qhYXEgLQSj4jUO9ZtpnKcsVyiqztbw61DY5j82.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 17:02:42', '2024-12-31 17:02:42', NULL),
(1022, 'A1.jpg', 'real_public/PropertiesFiles/MuWkqnLDnS5YdKdpF0SttfCQRZPyxGcvAimTuN0u.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 17:03:05', '2024-12-31 17:03:05', NULL),
(1023, 'A2.jpg', 'real_public/PropertiesFiles/Fqz79KjB2cONITrBVoexQUptK8Nyi79tO1J2Iqw8.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 17:03:05', '2024-12-31 17:03:05', NULL),
(1024, 'A3.jpg', 'real_public/PropertiesFiles/KEDNHfdpuJCFqp03d0aMLGCkoRIX659FHtHBM72j.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 17:03:05', '2024-12-31 17:03:05', NULL),
(1025, 'A4.jpg', 'real_public/PropertiesFiles/IqN2whJTpfAljtWvDyi6RGaq1FjttvLvisuuy6LE.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 17:03:05', '2024-12-31 17:03:05', NULL),
(1026, 'A5.jpg', 'real_public/PropertiesFiles/AsCJwmmu1M5fNdFgWRfabaoLuHEpjljefV89xM16.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 17:03:05', '2024-12-31 17:03:05', NULL),
(1027, 'A6.jpg', 'real_public/PropertiesFiles/j3AVvlqhkSc80hw6KK9D87Q2Cbzy1zHNTrwWMq8g.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 17:03:05', '2024-12-31 17:03:05', NULL),
(1028, 'A7.jpg', 'real_public/PropertiesFiles/kMDVnY3WcSeB3T82M0a35kUmBttvW8O8iu07sYmt.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 17:03:05', '2024-12-31 17:03:05', NULL),
(1029, 'A8.jpg', 'real_public/PropertiesFiles/HTbpnbV3s0tnwDuo7MhuFnnHfWF2P00cVsgkSa5o.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 17:03:05', '2024-12-31 17:03:05', NULL),
(1030, 'A9.jpg', 'real_public/PropertiesFiles/zhzrfNeU2sw2efVulytw4SkhI2OZRVArbC3Q91n0.jpg', NULL, 'jpg', 'image/jpeg', '2024-12-31 17:03:05', '2024-12-31 17:03:05', NULL),
(1031, 'mThW06NOq2P4kjwABdz11syP0J73oOnpSckIRAye.png', 'real_public/website_logos/sUVX8a0dBcBiHjKWcrdrgYtf0EGbPowPW27hNlWD.png', 54817, 'png', 'image/png', '2025-01-01 16:30:23', '2025-01-01 16:30:23', NULL),
(1032, 'mThW06NOq2P4kjwABdz11syP0J73oOnpSckIRAye.png', 'real_public/website_logos/VUfb5m5BbqAkTRE1wLaLkU98XpyonH6inUtjDz9I.png', 54817, 'png', 'image/png', '2025-01-01 16:30:23', '2025-01-01 16:30:23', NULL),
(1033, 'real_public/profile_images/4h8ntC10z8CVdnBtxQsfCvygNnwzuPmzODiz3ZQo.png', 'real_public/profile_images/4h8ntC10z8CVdnBtxQsfCvygNnwzuPmzODiz3ZQo.png', NULL, 'png', 'image/png', '2025-01-07 04:31:55', '2025-01-07 04:31:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `role` text COLLATE utf8mb4_general_ci,
  `image` bigint DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `verification_code` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `image`, `remember_token`, `token`, `verification_code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@example.com', '2024-03-04 15:56:44', '$2y$12$NpE.iyEcisFLCwDQp3Mg7.OCIA/6K1vFQeKOsuh1pm3lPHOwvx0ga', 'admin', 1033, NULL, 'snA6fFMSI6m3HlrUqI20UhQPa5n7jstB5foviX4JYrAIqTbmyYMpMU6scNF6mBBp', NULL, NULL, '2024-02-01 15:38:37', '2025-01-07 04:31:55'),
(118, 'naeem', 'shehryar.muslim@gmail.com', '2024-10-30 12:05:05', '$2y$12$NpE.iyEcisFLCwDQp3Mg7.OCIA/6K1vFQeKOsuh1pm3lPHOwvx0ga', 'customer', NULL, NULL, NULL, NULL, NULL, '2024-10-30 12:05:06', '2024-10-30 12:05:06'),
(119, 'Jack', 'jack@flower.example', '2024-10-31 04:13:09', '$2y$12$voMNgZ9PPoL2YvrkT4vER.ELwbTrZpQPiTsEB9phT8wS2sOoKbhau', 'customer', NULL, NULL, NULL, NULL, NULL, '2024-10-31 04:13:09', '2024-10-31 04:13:09'),
(120, 'Syed Umar', 'syed-umar@hotmail.com', '2024-11-04 02:48:39', '$2y$12$NpE.iyEcisFLCwDQp3Mg7.OCIA/6K1vFQeKOsuh1pm3lPHOwvx0ga', 'customer', NULL, NULL, NULL, NULL, NULL, '2024-11-04 02:48:40', '2024-11-04 02:48:40'),
(121, 'john doe', 'jumatay@gmail.com', '2024-11-20 11:22:30', '$2y$12$KjEEpz.lVr3g/rEPnoEZsu2gotBp1GjpZkqCFb0gpn2AO0J1IjtG.', 'customer', NULL, NULL, NULL, NULL, NULL, '2024-11-20 11:22:30', '2024-11-20 11:22:30'),
(122, 'john doe', 'jumatay007@gmail.com', '2024-11-20 11:23:10', '$2y$12$avqRNKzvhd9CdLjlTQaZ/Oq9iqMn7VMOCXww2AXBIgKiQjl3uJq3K', 'customer', NULL, NULL, NULL, NULL, NULL, '2024-11-20 11:23:10', '2024-11-20 11:23:10'),
(123, 'Shahzad Khan', 'vigilanceboy@gmail.com', '2024-11-20 12:13:21', '$2y$12$Lvgj6uJkyUw0PWNlF8yIzePu0bh.PmDqPVVsAjmDKe.YD8kW37QMy', 'customer', NULL, NULL, NULL, NULL, NULL, '2024-11-20 12:13:22', '2024-11-20 12:13:22'),
(124, 'Shahzad Khan', 'study1433@gmail.com', '2024-11-20 12:13:57', '$2y$12$kooASdpzp5IrXUvR3bYJDunEBRjYIsXkJWl0ukRpU6NWveNHctIgy', 'customer', NULL, NULL, NULL, NULL, NULL, '2024-11-20 12:13:57', '2024-11-20 12:13:57'),
(125, 'Jumatay', 'jumataya@gmail.com', '2024-11-20 14:58:29', '$2y$12$tnQrWr.KK0vbd3N0preRyOriCMb3Exmsn0ew00fbxLMoc8dwXbP7.', 'customer', NULL, NULL, NULL, NULL, NULL, '2024-11-20 14:58:30', '2024-11-20 14:58:30'),
(126, 'Bilal hussain', 'billhssn777@gmail.com', '2024-12-10 13:49:57', '$2y$12$hmRNj9oT0I2ifm/KDbiVfuhWgSkdUGkEVfdKi38nP71rbOvi89g4K', 'customer', NULL, NULL, NULL, NULL, NULL, '2024-12-10 13:49:57', '2024-12-10 13:49:57'),
(127, 'Bilal', 'hussain@bilal.example', '2024-12-20 19:30:43', '$2y$12$Tp84TnwIs75tBXR0N.Xvd.3dOsbDwtPtByCkg0Eb3uiEbukbRjql2', 'customer', NULL, NULL, NULL, NULL, NULL, '2024-12-20 19:30:43', '2024-12-20 19:30:43'),
(128, 'Bilal', 'hussain@bilal.example.pk', '2024-12-20 19:30:59', '$2y$12$XuvLL5JmlYF6MLx1DVhJoeuweORC0TT5zqATo8T..V4mLfsiJu1za', 'customer', NULL, NULL, NULL, NULL, NULL, '2024-12-20 19:30:59', '2024-12-20 19:30:59'),
(129, 'David patel', 'david.patel@coastalproperties.com', '2024-12-20 19:32:19', '$2y$12$I5aE8.jBBz7Eb9KTjK2opOBFTeV/1HRxEXlxHTjPodj4RRbKu9UHC', 'agent', NULL, NULL, NULL, NULL, NULL, '2024-12-20 19:32:19', '2024-12-20 19:32:19'),
(130, 'Bilal', 'bill@test.example', '2024-12-23 16:47:20', '$2y$12$0VCGYaKwN.7LSB2znOu2Geh9qTtNeWhe1Mkniw0inU0wmMVyhetlu', 'customer', NULL, NULL, NULL, NULL, NULL, '2024-12-23 16:47:21', '2024-12-23 16:47:21'),
(131, 'Bilal', 'hussai@test.example', '2025-01-07 04:38:08', '$2y$12$mezW49TwI7o3zChNCd./y.B3No6RtwOWWQxrAED9qeNF4rZZQTowO', 'customer', NULL, NULL, NULL, NULL, NULL, '2025-01-07 04:38:08', '2025-01-07 04:38:08'),
(132, 'bilal Testign', 'bill@test.com', '2025-01-07 04:40:18', '$2y$12$gk7ITN7nKEUKh74L0MA6k.SCJIvk/8vX/NKxQ7HRE2uF2ERd.wnc.', 'agent', NULL, NULL, NULL, NULL, NULL, '2025-01-07 04:40:23', '2025-01-07 04:40:23'),
(133, 'test', 'test@testc.cs', '2025-01-07 04:54:12', '$2y$12$fFIn.0ND60fFPCLrMAgBCeBcQUpneaRH2zmacfBOSmVdGNmS3E8SG', 'customer', NULL, NULL, NULL, NULL, NULL, '2025-01-07 04:54:12', '2025-01-07 04:54:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `builders`
--
ALTER TABLE `builders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `builders_communities`
--
ALTER TABLE `builders_communities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `builders_communities_community_id_foreign` (`community_id`),
  ADD KEY `builders_communities_builder_id_foreign` (`builder_id`);

--
-- Indexes for table `carousels`
--
ALTER TABLE `carousels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `communities`
--
ALTER TABLE `communities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `communities_amenity_id_foreign` (`amenity_id`),
  ADD KEY `communities_hoa_id_foreign` (`hoa_id`),
  ADD KEY `communities_neighborhood_id_foreign` (`neighborhood_id`),
  ADD KEY `communities_las_vegas_region_id_foreign` (`las_vegas_region_id`);

--
-- Indexes for table `community_amenities`
--
ALTER TABLE `community_amenities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `community_amenities_community_id_foreign` (`community_id`);

--
-- Indexes for table `community_las_vegas_regions`
--
ALTER TABLE `community_las_vegas_regions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `community_las_vegas_regions_community_id_foreign` (`community_id`);

--
-- Indexes for table `community_neighborhoods`
--
ALTER TABLE `community_neighborhoods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `community_neighborhoods_community_id_foreign` (`community_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_agents_connections`
--
ALTER TABLE `customer_agents_connections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_visiting_homes_history`
--
ALTER TABLE `customer_visiting_homes_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `floorplan`
--
ALTER TABLE `floorplan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hoa`
--
ALTER TABLE `hoa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `incentives`
--
ALTER TABLE `incentives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `las_vegas_regions`
--
ALTER TABLE `las_vegas_regions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `neighborhoods`
--
ALTER TABLE `neighborhoods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `open_houses`
--
ALTER TABLE `open_houses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `our_promises`
--
ALTER TABLE `our_promises`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`property_id`),
  ADD KEY `properties_user_id_foreign` (`user_id`),
  ADD KEY `properties_hoa_id_foreign` (`hoa_id`),
  ADD KEY `properties_school_id_foreign` (`school_id`);

--
-- Indexes for table `property_features`
--
ALTER TABLE `property_features`
  ADD PRIMARY KEY (`feature_id`),
  ADD KEY `property_id_2` (`property_id`),
  ADD KEY `property_id_3` (`property_id`);

--
-- Indexes for table `property_incentives`
--
ALTER TABLE `property_incentives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quick_move_in_homes`
--
ALTER TABLE `quick_move_in_homes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quick_move_in_homes_property_id_foreign` (`property_id`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seo`
--
ALTER TABLE `seo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tours`
--
ALTER TABLE `tours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `floorplan`
--
ALTER TABLE `floorplan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `property_features`
--
ALTER TABLE `property_features`
  MODIFY `feature_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1131;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1034;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `communities`
--
ALTER TABLE `communities`
  ADD CONSTRAINT `communities_amenity_id_foreign` FOREIGN KEY (`amenity_id`) REFERENCES `amenities` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `communities_hoa_id_foreign` FOREIGN KEY (`hoa_id`) REFERENCES `hoa` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `communities_las_vegas_region_id_foreign` FOREIGN KEY (`las_vegas_region_id`) REFERENCES `las_vegas_regions` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `communities_neighborhood_id_foreign` FOREIGN KEY (`neighborhood_id`) REFERENCES `neighborhoods` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `community_amenities`
--
ALTER TABLE `community_amenities`
  ADD CONSTRAINT `community_amenities_community_id_foreign` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `community_las_vegas_regions`
--
ALTER TABLE `community_las_vegas_regions`
  ADD CONSTRAINT `community_las_vegas_regions_community_id_foreign` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `community_neighborhoods`
--
ALTER TABLE `community_neighborhoods`
  ADD CONSTRAINT `community_neighborhoods_community_id_foreign` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `properties`
--
ALTER TABLE `properties`
  ADD CONSTRAINT `properties_hoa_id_foreign` FOREIGN KEY (`hoa_id`) REFERENCES `hoa` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `properties_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `properties_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `property_features`
--
ALTER TABLE `property_features`
  ADD CONSTRAINT `property_features_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`property_id`) ON DELETE CASCADE;

--
-- Constraints for table `quick_move_in_homes`
--
ALTER TABLE `quick_move_in_homes`
  ADD CONSTRAINT `quick_move_in_homes_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`property_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
