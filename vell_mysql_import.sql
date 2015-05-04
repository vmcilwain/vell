--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: authenticatable_roles; Type: TABLE DATA; Schema: public; Owner: vmcilwain
--

INSERT INTO authenticatable_roles (id, name, description, created_at, updated_at) VALUES (1, 'Administrator', 'Application Administration Role', '2015-03-11 00:08:04.380656', '2015-03-11 00:08:04.380656');


--
-- Name: authenticatable_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vmcilwain
--

SELECT pg_catalog.setval('authenticatable_roles_id_seq', 1, true);


--
-- Data for Name: authenticatable_roles_users; Type: TABLE DATA; Schema: public; Owner: vmcilwain
--

INSERT INTO authenticatable_roles_users (role_id, user_id) VALUES (1, 2);


--
-- Data for Name: authenticatable_security_keys; Type: TABLE DATA; Schema: public; Owner: vmcilwain
--

INSERT INTO authenticatable_security_keys (id, user_id, key, expiration_date) VALUES (1, 2, '17e8383f23945fd2f6702895a8496c676fff149d5885ae6d2931d052c9f70d1fd1d7e02160dd60f7b3763f405337611cd7e244e1fda62f33c78000f360ae3f39', '2015-04-04');
INSERT INTO authenticatable_security_keys (id, user_id, key, expiration_date) VALUES (2, 2, '4f03fad8d363c7dc1c3bc01a16a336cb17a07c1b9b57227b50141759abb39a66323df2c2f7d4f38d134a96fdbed89474b56b52b6f82cc9436bc6ddd61ed17e3a', '2015-04-23');


--
-- Name: authenticatable_security_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vmcilwain
--

SELECT pg_catalog.setval('authenticatable_security_keys_id_seq', 2, true);


--
-- Data for Name: authenticatable_users; Type: TABLE DATA; Schema: public; Owner: vmcilwain
--

INSERT INTO authenticatable_users (id, full_name, email, password, salt, created_at, updated_at) VALUES (2, 'Lovell McIlwain', 'vmcilwain@me.com', 'ad6c6746f097d8dc881d4646565d28448cf3e8cdd26820fc776eda2b5182c9f94c404757d26d00d0fff9caf8685d7c23cf8a21a2415b6de71017b360f96bee9d', 'IV4LNCcphOV91Q2ZXJsuTUSXtSSJ1LQJ8lz2ARnWIFy6boPHFKZFzsIQQj7oBY6p', '2015-03-11 00:11:55.14874', '2015-04-20 18:23:44.142156');


--
-- Name: authenticatable_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vmcilwain
--

SELECT pg_catalog.setval('authenticatable_users_id_seq', 2, true);


--
-- Data for Name: blog_categories; Type: TABLE DATA; Schema: public; Owner: vmcilwain
--

INSERT INTO blog_categories (id, name, enabled) VALUES (1, 'Announcements', true);
INSERT INTO blog_categories (id, name, enabled) VALUES (2, 'Ruby on Rails', true);
INSERT INTO blog_categories (id, name, enabled) VALUES (3, 'Ruby', true);
INSERT INTO blog_categories (id, name, enabled) VALUES (4, 'Linux', true);


--
-- Name: blog_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vmcilwain
--

SELECT pg_catalog.setval('blog_categories_id_seq', 4, true);


--
-- Data for Name: blog_comments; Type: TABLE DATA; Schema: public; Owner: vmcilwain
--

INSERT INTO blog_comments (id, blog_id, name, body, created_at, updated_at) VALUES (1, 2, 'SwainTrain', 'What up! Lookin good.', '2015-03-11 15:22:10.520893', '2015-03-11 15:22:10.520893');
INSERT INTO blog_comments (id, blog_id, name, body, created_at, updated_at) VALUES (2, 2, 'Vell', 'Thanks a lot!', '2015-03-11 17:12:57.047868', '2015-03-11 17:12:57.047868');
INSERT INTO blog_comments (id, blog_id, name, body, created_at, updated_at) VALUES (3, 2, 'Kim', 'Great Job! It looks awesome. ', '2015-03-13 04:04:14.243747', '2015-03-13 04:04:14.243747');


--
-- Name: blog_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vmcilwain
--

SELECT pg_catalog.setval('blog_comments_id_seq', 35, true);


--
-- Data for Name: blog_files; Type: TABLE DATA; Schema: public; Owner: vmcilwain
--



--
-- Name: blog_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vmcilwain
--

SELECT pg_catalog.setval('blog_files_id_seq', 1, false);


--
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: vmcilwain
--

INSERT INTO blogs (id, blog_category_id, headline, body, created_at, updated_at) VALUES (2, 1, 'My New Site Is Up and Running', 'I am proud to announce that my new redesigned site is up and running (FINALLY!) :).', '2015-03-11 01:46:27.851247', '2015-03-11 01:46:27.851247');
INSERT INTO blogs (id, blog_category_id, headline, body, created_at, updated_at) VALUES (3, 1, 'Saying Goodbye To Influential People In My Professional Life', 'Today I have decided to say goodbye to quite a few people that have helped groom me into the professional that I am today. For my own reasons, I felt this was a necessary step for my future growth as a professional.<p><br></p><p>To those that I have decided to part with I would like to say thank you for helping me become a better professional. You will not be forgotten. How can you be, every time I start a project the skills that you taught me always shine through. Continue to be the great people you are and I wish you success in all that you do.</p>', '2015-03-12 11:56:56.966401', '2015-03-12 11:56:56.966401');
INSERT INTO blogs (id, blog_category_id, headline, body, created_at, updated_at) VALUES (37, 1, 'Some of My Pictures from ASPPH Annual Meeting ', 'Unfortunately, some of the pictures didn''t turn out so well. Some of them are even a little small. I have to work on my camera skills :) But enjoy if you can make them out.<p><a href="http://vell.herokuapp.com/photo_albums/2">Photo Album</a></p>', '2015-03-30 22:07:51.029899', '2015-03-30 22:07:51.029899');
INSERT INTO blogs (id, blog_category_id, headline, body, created_at, updated_at) VALUES (36, 2, 'How I set up Paperclip to use an EBS instance on AWS with Ruby on Rails 4.2', 'I was faced with an interesting issue where I was building a <a href="http://rubyonrails.org/">Ruby on Rails</a> application to be run on <a href="http://aws.amazon.com/">AWS</a> that needed file uploading but couldn''t be public on S3. My solution to this was to attach an EBS instance to the VM that will be running the rails application and set <a href="https://rubygems.org/gems/paperclip">paperclip</a> to use this EBS instance.<br><br><u>For those that may not make the connect this would be similar to having a rails application and file storage on the same system.</u><br><br>So assuming you have your VM setup. The first thing to do is create an EBS instance. You can talk with your AWS administrator about how to set up an EBS instance. <br><br>NOTE: Even if you are building the VM and adding the EBS to it, you sill need to format and mount that EBS.<br><br>I. Formatting and Mounting the EBS - According to <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-using-volumes.html">here</a><br><ol><li>Find out what the volume id is using the command:</li><ol><li><b>lsblk</b></li></ol><li>Given the id is /dev/xvds you would format the EBS instance using the command: </li><ol><li><b>sudo mkfs -t ext4 /dev/xvds</b></li></ol><li>Next create a directory that will be used to mount the EBS instance. I generally chose /mnt for anything I mount:</li><ol><li><b>sudo mkdir /mnt/ebs</b></li></ol><li>Mount the EBS instance on the directory you just created: </li><ol><li><b>sudo mount /dev/xvds /mnt/ebs</b></li></ol><li>Provided no issues after mounting the EBS instance, add the command to mount the EBS on boot up</li><ol><li><b>sudo cp /etc/fstab /etc/fstab.orig</b></li><li><b>vim /etc/fstab</b></li><li><b>Add to the bottom: /dev/xvd2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /mnt/ebs&nbsp;&nbsp; ext4&nbsp;&nbsp;&nbsp; defaults,nofail&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2</b></li><li><b>Test by running the mount command: sudo mount -a</b></li></ol></ol>II. Setting up paperclip to point to the EBS instance.<br><ol><li>Add paperclip to the rails gem file</li><ol><li><b>gem ''paperclip''</b></li><li><b>bundle install</b></li></ol><li>Create the model for your attachments</li><ol><li><b>rails g model document</b></li></ol><li>Add paperclip to the newly created model</li><ol><li><b>has_attached_file :document_file</b></li><li><b>validates_attachment :document_file, :presence =&gt; true,<br>&nbsp;:content_type =&gt; { :content_type =&gt; ALLOWABLE_APPLICATIONS + ALLOWABLE_IMAGES },<br>&nbsp;:size =&gt; { :in =&gt; 0..5.megabytes }</b></li></ol><li>Add the configuration defaults based on the environment that you want paperclip to operate in. Here is how mine is set.<br></li><ol><li>config/environments/development.rb <b>#Where I am just wanting to point to a directory on my local system</b><br></li><li>&nbsp; <b>config.paperclip_defaults = {<br>&nbsp;&nbsp;&nbsp; storage: :filesystem,<br>&nbsp;&nbsp;&nbsp; path: "#{Rails.root}/public/document_files/:id/:basename.:extension"<br>&nbsp; }</b></li><li>config/environments/production.rb <b>#where I am using an EBS instance on AWS</b><br></li><ol><li>&nbsp;<b>config.paperclip_defaults = {<br>&nbsp;&nbsp;&nbsp; storage: :filesystem,<br>&nbsp;&nbsp;&nbsp; path: "/mnt/ebs/document_files/:id/:basename.:extension"<br>&nbsp; }</b></li></ol></ol></ol>III. Adding the download method to the documents controller (I was using apache + passenger)<p></p><p></p><p><b>&nbsp; def download</b></p><p><span style="line-height: 1.42857143;"><b>&nbsp; &nbsp; send_file(@document.document_file.path, type: @document.document_file_content_type, x_sendfile: true) if File.exists? @document.document_file.path</b></span></p><p><b>&nbsp; end</b></p>That is it! From there, you have done the following:<br><ol><li>Formatted an EBS instance</li><li>Mounted the drive on your linux system</li><li>Set up paperclip to use that EBS instance to save files</li><li>Add a way to download the file</li></ol><p>If you know of a better way to do this or have any questions, definitely post a comment.</p><p><br></p><p>Thanks,<br></p><p></p><p></p>', '2015-03-20 17:59:40.550138', '2015-04-01 15:20:31.429322');
INSERT INTO blogs (id, blog_category_id, headline, body, created_at, updated_at) VALUES (38, 3, 'Why I use the whenever gem for running recurring tasks', 'I had a chance to implement a recurring task in my project and eventually came up on <a href="https://github.com/javan/whenever">Whenever</a>. This is the recurring task gem of my dreams. It''s straight forward and to the point and of at the end of the day it gets the job done. The biggest thing that I like about this gem is that it gives the ability to use cron which is a dream come true.<p><br></p><p>Leveraging cron to run tasks seems like a no brainer to me. To have to go through the hassle of using daemons where I need to create a loop and sleep it for some period of time is crazy. &nbsp;I have also run into some poorly implemented code that used ruby daemons and having to remember to remove the .pid file otherwise the daemon doesn''t start was frustrating.</p><p><br></p><p>So you haven''t clicked on my link to go to the Whenever gem and look at the README and your wondering, how easy it really to set up this gem. Well take a quick peak below:</p><p>Given I have set up a rake task to pole email called&nbsp;<span style="line-height: 1.42857143;"><b style="line-height: 1.42857143;">poll_email.rake</b>, I simple need to to do the following:</span></p><p>1. gem install whenever</p><p>2. wheneverize . #note the "." for the current directory</p><p>3. In the <i>config/scheduler.rb</i> file that was generated I have:</p><blockquote style="margin: 0 0 0 40px; border: none; padding: 0px;"><p></p><p>every 2.minutes do</p><p></p><p></p><p>&nbsp; rake "poll_email:run"</p><p></p><p></p><p>end</p><p></p></blockquote><p>4. whenever --update-crontab # To write to the crontab and have cron execute</p><p>And that literally is it.</p><p><br></p><p>If I wanted to use this in a rails app, I simply need to add the following line to the top of my file</p><p>require File.expand_path(File.dirname(__FILE__) + "/../config/environment")</p><p><br></p><p>If you want to automate updating the crontab there is capistrano integration for it</p><p><br></p><p>This is how I got things to work for me and it took less than 20 minutes to do. Which now that it is done, I feel I took too long :)</p>', '2015-04-06 14:22:45.628572', '2015-04-06 14:22:45.628572');
INSERT INTO blogs (id, blog_category_id, headline, body, created_at, updated_at) VALUES (39, 4, 'Workaround for installing Janus on Centos / Redhat / Fedora', 'I have been having issues getting Janus to run on Centos and Fedora. I usually get an error something like<br><hr>&lt;!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN"&gt;<br><br>400 Bad Request<br><h1>Bad Request</h1><p>Your browser sent a request that this server could not understand.<br>Host name provided via SNI and via HTTP are different</p><hr><p>After working with the Janus team, the workaround to this problem is to copy the contents boostrap.sh file into a local file that is executable, then execute the file.</p><hr>#!/bin/bash<br><br>function die()<br>{<br>&nbsp;&nbsp;&nbsp; echo "${@}"<br>&nbsp;&nbsp;&nbsp; exit 1<br>}<br><br># Add .old to any existing Vim file in the home directory<br>for i in "${HOME}/.vim" "${HOME}/.vimrc" "${HOME}/.gvimrc"; do<br>&nbsp; if [ -e $i ]; then<br>&nbsp;&nbsp;&nbsp; echo "${i} has been renamed to ${i}.old"<br>&nbsp;&nbsp;&nbsp; mv "${i}" "${i}.old" || die "Could not move ${i} to ${i}.old"<br>&nbsp; fi<br>done<br><br># Clone Janus into .vim<br>git clone https://github.com/carlhuda/janus.git "${HOME}/.vim" \<br>&nbsp; || die "Could not clone the repository to ${HOME}/.vim"<br><br># Run rake inside .vim<br>cd "${HOME}/.vim" || die "Could not go into the ${HOME}/.vim"<br>rake || die "Rake failed."<hr><p>or you can do this this in the terminal and copy the most recent content: curl -Lo- <a href="https://bit.ly/janus-bootstrap">https://bit.ly/janus-bootstrap</a><br></p><p>Once you have created the file "some_file.sh", make it an executable <b>chmod -755 some_file.sh</b></p><p>At that point all you have to do is execute the file <b>./some_file.sh</b></p><p>From there watch the magic work<br></p>', '2015-04-20 18:33:19.328121', '2015-04-20 18:33:47.770149');


--
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vmcilwain
--

SELECT pg_catalog.setval('blogs_id_seq', 39, true);


--
-- Data for Name: contact_mes; Type: TABLE DATA; Schema: public; Owner: vmcilwain
--



--
-- Name: contact_mes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vmcilwain
--

SELECT pg_catalog.setval('contact_mes_id_seq', 1, false);


--
-- Data for Name: homes; Type: TABLE DATA; Schema: public; Owner: vmcilwain
--



--
-- Name: homes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vmcilwain
--

SELECT pg_catalog.setval('homes_id_seq', 1, false);


--
-- Data for Name: photo_albums; Type: TABLE DATA; Schema: public; Owner: vmcilwain
--

INSERT INTO photo_albums (id, name, description, created_at, updated_at) VALUES (2, 'ASPPH Annual Meeting ''15', 'ASPPH Yearly Conference. This was the very first one!', '2015-03-30 21:59:06.063271', '2015-03-30 21:59:06.063271');


--
-- Name: photo_albums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vmcilwain
--

SELECT pg_catalog.setval('photo_albums_id_seq', 2, true);


--
-- Data for Name: photo_comments; Type: TABLE DATA; Schema: public; Owner: vmcilwain
--



--
-- Name: photo_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vmcilwain
--

SELECT pg_catalog.setval('photo_comments_id_seq', 1, false);


--
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: vmcilwain
--

INSERT INTO photos (id, photo_album_id, description, created_by, updated_by, created_at, updated_at, document_file_name, document_content_type, document_file_size, document_updated_at) VALUES (1, 1, '', NULL, NULL, '2015-03-11 01:03:01.341958', '2015-03-11 01:03:01.341958', '54a0c4000cf23b7cfd67ac44-610xh.jpg', 'image/jpeg', 13879, '2015-03-11 01:03:00.445223');
INSERT INTO photos (id, photo_album_id, description, created_by, updated_by, created_at, updated_at, document_file_name, document_content_type, document_file_size, document_updated_at) VALUES (2, 2, 'First day with Data Center and Feed Frankie', NULL, NULL, '2015-03-30 21:59:51.589633', '2015-03-30 21:59:51.589633', 'IMG_3877.JPG', 'image/jpeg', 606196, '2015-03-30 21:59:50.780491');
INSERT INTO photos (id, photo_album_id, description, created_by, updated_by, created_at, updated_at, document_file_name, document_content_type, document_file_size, document_updated_at) VALUES (3, 2, 'Me at a demo station displaying an app I created', NULL, NULL, '2015-03-30 22:00:59.402142', '2015-03-30 22:00:59.402142', 'IMG_3881.JPG', 'image/jpeg', 598365, '2015-03-30 22:00:58.676775');
INSERT INTO photos (id, photo_album_id, description, created_by, updated_by, created_at, updated_at, document_file_name, document_content_type, document_file_size, document_updated_at) VALUES (4, 2, 'Another picture of me at my application''s demo station', NULL, NULL, '2015-03-30 22:01:34.897001', '2015-03-30 22:01:34.897001', 'IMG_3882.JPG', 'image/jpeg', 581892, '2015-03-30 22:01:32.902477');
INSERT INTO photos (id, photo_album_id, description, created_by, updated_by, created_at, updated_at, document_file_name, document_content_type, document_file_size, document_updated_at) VALUES (5, 2, 'The start of registration', NULL, NULL, '2015-03-30 22:02:07.751205', '2015-03-30 22:02:07.751205', 'IMG_3886.JPG', 'image/jpeg', 716479, '2015-03-30 22:02:06.188502');
INSERT INTO photos (id, photo_album_id, description, created_by, updated_by, created_at, updated_at, document_file_name, document_content_type, document_file_size, document_updated_at) VALUES (6, 2, 'Some of my teammates. ', NULL, NULL, '2015-03-30 22:03:00.445745', '2015-03-30 22:03:00.445745', 'IMG_3889.JPG', 'image/jpeg', 60179, '2015-03-30 22:03:00.105436');
INSERT INTO photos (id, photo_album_id, description, created_by, updated_by, created_at, updated_at, document_file_name, document_content_type, document_file_size, document_updated_at) VALUES (7, 2, 'Me demoing my application in a different location.', NULL, NULL, '2015-03-30 22:03:31.192591', '2015-03-30 22:03:31.192591', 'IMG_5319.JPG.jpeg', 'image/jpeg', 662081, '2015-03-30 22:03:29.992101');
INSERT INTO photos (id, photo_album_id, description, created_by, updated_by, created_at, updated_at, document_file_name, document_content_type, document_file_size, document_updated_at) VALUES (8, 2, 'Me actually demoing the application.', NULL, NULL, '2015-03-30 22:04:17.5563', '2015-03-30 22:04:17.5563', 'IMG_5328.JPG', 'image/jpeg', 1057594, '2015-03-30 22:04:15.44578');
INSERT INTO photos (id, photo_album_id, description, created_by, updated_by, created_at, updated_at, document_file_name, document_content_type, document_file_size, document_updated_at) VALUES (9, 2, 'The system administrator and I at odds with each other :)', NULL, NULL, '2015-03-30 22:05:14.531219', '2015-03-30 22:05:14.531219', 'IMG_5332.JPG', 'image/jpeg', 1800497, '2015-03-30 22:05:13.100295');


--
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vmcilwain
--

SELECT pg_catalog.setval('photos_id_seq', 9, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: vmcilwain
--

INSERT INTO schema_migrations (version) VALUES ('20150115234348');
INSERT INTO schema_migrations (version) VALUES ('20150121023013');
INSERT INTO schema_migrations (version) VALUES ('20150130133515');
INSERT INTO schema_migrations (version) VALUES ('20150203012220');
INSERT INTO schema_migrations (version) VALUES ('20150206161809');
INSERT INTO schema_migrations (version) VALUES ('20150223022638');
INSERT INTO schema_migrations (version) VALUES ('20150225221324');
INSERT INTO schema_migrations (version) VALUES ('20150226012607');
INSERT INTO schema_migrations (version) VALUES ('20150301165020');
INSERT INTO schema_migrations (version) VALUES ('20150301165350');
INSERT INTO schema_migrations (version) VALUES ('20150302163416');
INSERT INTO schema_migrations (version) VALUES ('20150310002816');
INSERT INTO schema_migrations (version) VALUES ('20150310002817');
INSERT INTO schema_migrations (version) VALUES ('20150310002818');
INSERT INTO schema_migrations (version) VALUES ('20150310002819');
INSERT INTO schema_migrations (version) VALUES ('20150310002820');
INSERT INTO schema_migrations (version) VALUES ('20150310002821');
INSERT INTO schema_migrations (version) VALUES ('20150310002822');
INSERT INTO schema_migrations (version) VALUES ('20150310005632');


--
-- PostgreSQL database dump complete
--

