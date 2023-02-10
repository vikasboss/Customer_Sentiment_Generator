-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: exotel
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CallDB`
--

DROP TABLE IF EXISTS `CallDB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CallDB` (
  `callSid` varchar(40) NOT NULL,
  `transcription` text,
  `summaryText` text,
  `sentiment` int DEFAULT NULL,
  `callbackurl` text,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`callSid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CallDB`
--

LOCK TABLES `CallDB` WRITE;
/*!40000 ALTER TABLE `CallDB` DISABLE KEYS */;
INSERT INTO `CallDB` VALUES ('1c105444571af48d48e297af3c70172a',' Hello. Hello. Hi Mr. Arundham, I\'m Surya calling from XOTEL. Very good afternoon. How are you? Fine, thank you. Mr. Arundham, actually we met you in our seventh SQE Summit event in Mumbai. So, we just wanted to make a follow up call to check on your requirements like when can we connect and take the conversation forward and also if you can start lifting off for any solutions on WhatsApp. I think it\'s a year ending thing, right, so we are only able to pick up in the group and share here. So, I need to go through your products, what you are doing right now. So, next week you see something on RedNest A, or ZoomMix and explain me about your product details about it. Then from there I can take you forward. Okay, sure. And do you have any specific time sort available? Try to give it four o\'clock. Okay, sure, sure Mr. Arundham. I will just share the call and then make a phone call. Okay, thank you. Thank you. Thank you.','\n\nA representative from XOTEL is following up with a customer they met at an event, trying to schedule a time to discuss the customer\'s requirements and see if there is any interest in using XOTEL\'s products. The customer agrees to a time next week and the representative says they will follow up with a phone call.',8,'https://webhook.site/127d4c42-51b1-45c8-9f71-5ad4c62332f1','2023-02-10 17:35:01','2023-02-10 17:35:06'),('2f516e70122ae0403802a7395ad2172a',' Hello. Hello, hi Shivani. Good morning. This is Shivani. Hi Sunaina, how are you? All good, all good Shivani. How are you? I\'m good and good. I just wanted to know what is happening and how we were solving it. Yeah, yeah, yeah. So, I just checked with the backend team, right and I replied to Deep\'s email as well. So, you were, you and I think someone else is also in CC. So, I replied in that and today morning also the email that I got from you, I replied in that also. I checked with the team, okay Shivani. There is no defects on the Exotel site because why I\'m telling you that? Because once we download the Exotel CPI app over the Zoho CRM, right, the user mappings should happen automatically. Whichever app they are in the Zoho CRM, the user should show in the Zoho mapping thing. But that is not coming out. Once that is not, until and unless that is not done, we cannot move to the further process. It would be better to raise a ticket to this Zoho CRM and loop me in as well if you want. Then let\'s see what the people are saying there. Okay. So, since they already checked with Zoho people like twice or thrice and Zoho keeps saying there is no fault in their site and the integration is working and they tried with some other firms also today. So, it has been working. Okay. So, is it, have you checked the mapping thing with them? Yeah, yeah, I think it is working. Some telling me CMI software or something. It is working well. Now there is a... Well, I kind of still prefer Exotel. So, if there is something we could do. Like the backend team tried with both Zoho CRM as well as this, right. They also tried integrating, no? Mm hmm. Did they do that? Yeah, my backend team tried it. The user ID and the password that you provided to me, right. Yeah. So, my team, yeah, my team tried to login to the account and before sending to them, I myself tried, okay. So, in the first the email ID was wrong. So, after you provided me the correct email ID, I was able to login. But the user mapping was not happening. But the user mapping should happen automatically once you download the Exotel CTI app through the Zoho CRM. Because we cannot do anything on that mapping thing. But you also had to like map it separately, right. So, it is not even like there is some issue in the system at that end because you guys also have tried. Yes, exactly, exactly. It would be better if you can connect me with someone from the Zoho. Alright. Okay, okay, so now I know. I will get back. The developers are following with Zoho. I do not really have the mail ID as of yet. I will do that. So, it is very, very good. If you can somehow solve the issue, we will immediately buy it. So, they are looking for this other option also. But since I had begin with Exotel, I still kind of prefer Exotel. Yes, I know that. Yeah, so I will check again and I will see what we can do. So, I do have to connect you to somebody in Zoho. Yeah, somebody from your Zoho and let us first see what these people are saying. Because we cannot do anything over the user mapping thing. It should happen automatically. Whichever is there in the Zoho CRM, once the Exotel CTI app got downloaded over there, the mapping should happen automatically. Nothing can be done from Exotel site in that case. So, let me see what these people are saying, why the mapping is not happening. Yeah, okay. Okay, Sunaya. Yeah. Okay, Shivani. Please update me on this. Okay? Yeah, yeah, sure. Thanks.','\nThe text contains a conversation between two people. They discuss a problem with Exotel, a software company, and how they are trying to solve it. The woman says she will follow up with Exotel and get back to the man.',7,'https://webhook.site/127d4c42-51b1-45c8-9f71-5ad4c62332f1','2023-02-10 18:01:08','2023-02-10 18:01:13'),('85e9fda0cb6d557267a1a6cfedea172a',' Hello. Hello. Yeah. I\'m just being specific. Yeah. Hi, my name is Jannal. I\'m calling from ICT. Yeah. Uh, since you are requested for a call back on the sales team, are you looking for any cloud telephone services? Uh, yeah, we are. Uh, may I know what exactly are you looking for? Uh, for our customer support team. Okay. Is it only for your handling of inbound calls? Uh, no, it is outbound. Uh, it\'s inbound and outbound both? Only outbound. Okay, only outbound. Okay, okay. Understood. Uh, where is your company based out of? Bangalore. Bangalore. And will the, how many agents will be there? Who will be handling the calls? Uh, we will be handling the calls. Okay. So, how many agents will be there, who will be handling the calls? Uh, I think two or maximum three. Interesting people. Okay. Understood. So, we will be able to provide you with a solution, okay, where we provide a total dashboard, okay, in which you are, see the outbound calling can, so one thing is outbound, we do support outbound calling, but we only support transactional outbound calls. We do not support any promotional or cold calling. Yeah, yeah, no, only transactional. Okay. And are you storing, let\'s say the customer details in some kind of CRM or lead management system? Sorry? Are you storing the details in some kind of CRM or lead management system? For that, who will be? Um, no, we have our internal system. So, you have your own system where you are storing the lead generation, right? These are not leads, these are our customers. Yeah, customers only, by, yeah, there are customer details you are storing in program, right? Yeah. Okay, okay, understood, understood. So, do you want me to share the pricing initials or do you want me to schedule a demo lecture next week on Monday or? Demo lecture. Okay. When would you? Demo and writing board actually, yeah, both of you. Okay, I\'ll be able to share the standard conversations across so that you can have a look at it first, okay? And on the latest reward, let me know, I\'ll just have you, the calendar event, you can schedule, you can block our calendar at your communion time and we can conduct the demo at that time. Okay. Yeah. Okay. All right. Yeah, okay, okay, thank you. Yeah, thank you. Bye. Bye.','\n\nThe text contains a conversation between two people. One person is from a company that provides cloud telephone services, and the other is from a customer support team that is interested in using these services. The customer support team is based in Bangalore, and there will be two or three agents handling the calls. The company provides a dashboard where the customer can see the outbound calls, and they only support transactional outbound calls, not promotional or cold calling. The customer is storing the details of their customers in their own internal system. The company offers a demo lecture to the customer so that they can learn more about the services.',7,'https://webhook.site/127d4c42-51b1-45c8-9f71-5ad4c62332f1','2023-02-10 16:15:23','2023-02-10 16:15:29');
/*!40000 ALTER TABLE `CallDB` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-10 23:53:05
