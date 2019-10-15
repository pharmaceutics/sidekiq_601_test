```bash
$ docker-compose up -d --build
Creating network "sidekiq_601_test_backend" with the default driver
Building app
Step 1/6 : FROM ruby:2.6.3-slim-buster
 ---> 499f4f2d5e4a
Step 2/6 : RUN gem install bundler -v 2.0.2
 ---> Using cache
 ---> 5c4f24869213
Step 3/6 : WORKDIR /app
 ---> Using cache
 ---> 90b5d522545e
Step 4/6 : COPY Gemfile Gemfile.lock ./
 ---> Using cache
 ---> 1c4476f54649
Step 5/6 : RUN bundle install
 ---> Using cache
 ---> 5be4e8f1f972
Step 6/6 : COPY . .
 ---> Using cache
 ---> 84c2a99813db

Successfully built 84c2a99813db
Successfully tagged sidekiq_601_test_app:latest
Creating sidekiq_601_test_redis_1 ... done
Creating sidekiq_601_test_app_1   ... done

$ docker-compose logs -f app
Attaching to sidekiq_601_test_app_1
app_1    | 2019-10-15T13:00:34.602Z pid=1 tid=gt69lqc89 INFO: Booting Sidekiq 6.0.1 with redis options {:url=>"redis://redis:6379", :id=>"Sidekiq-server-PID-1"}
app_1    | 2019-10-15T13:00:34.608Z pid=1 tid=gt69lqc89 INFO: Running in ruby 2.6.3p62 (2019-04-16 revision 67580) [x86_64-linux]
app_1    | 2019-10-15T13:00:34.608Z pid=1 tid=gt69lqc89 INFO: See LICENSE and the LGPL-3.0 for licensing details.
app_1    | 2019-10-15T13:00:34.608Z pid=1 tid=gt69lqc89 INFO: Upgrade to Sidekiq Pro for more features and support: http://sidekiq.org

app_1    | 2019-10-15T13:00:34.611Z pid=1 tid=gt69ne2s9 class=HardWorker jid=244518ceacaf37ba79ce3b64 INFO: start
app_1    | 2019-10-15T13:00:34.646Z pid=1 tid=gt69ne2s9 class=HardWorker jid=244518ceacaf37ba79ce3b64 elapsed=0.035 INFO: fail
app_1    | 2019-10-15T13:00:34.648Z pid=1 tid=gt69ne2s9 WARN: {"context":"Job raised exception","job":{"class":"HardWorker","args":[],"retry":true,"queue":"default","jid":"244518ceacaf37ba79ce3b64","created_at":1571144434.6031506,"at":null,"enqueued_at":1571144434.6033292},"jobstr":"{\"class\":\"HardWorker\",\"args\":[],\"retry\":true,\"queue\":\"default\",\"jid\":\"244518ceacaf37ba79ce3b64\",\"created_at\":1571144434.6031506,\"at\":null,\"enqueued_at\":1571144434.6033292}"}
app_1    | 2019-10-15T13:00:34.649Z pid=1 tid=gt69ne2s9 WARN: RuntimeError:
app_1    | 2019-10-15T13:00:34.649Z pid=1 tid=gt69ne2s9 WARN: /app/app.rb:11:in `perform'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/processor.rb:193:in `execute_job'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/processor.rb:161:in `block (2 levels) in process'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/middleware/chain.rb:133:in `invoke'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/processor.rb:160:in `block in process'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/processor.rb:133:in `block (6 levels) in dispatch'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/job_retry.rb:110:in `local'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/processor.rb:132:in `block (5 levels) in dispatch'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq.rb:37:in `block in <module:Sidekiq>'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/processor.rb:128:in `block (4 levels) in dispatch'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/processor.rb:254:in `stats'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/processor.rb:123:in `block (3 levels) in dispatch'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/job_logger.rb:13:in `call'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/processor.rb:122:in `block (2 levels) in dispatch'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/job_retry.rb:78:in `global'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/processor.rb:121:in `block in dispatch'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/logger.rb:10:in `with'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/job_logger.rb:33:in `prepare'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/processor.rb:120:in `dispatch'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/processor.rb:159:in `process'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/processor.rb:78:in `process_one'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/processor.rb:68:in `run'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/util.rb:17:in `watchdog'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/util.rb:26:in `block in safe_thread'

app_1    | 2019-10-15T13:01:02.949Z pid=1 tid=gt69ne5lx ERROR: Job 'at' must be a Numeric timestamp
app_1    | 2019-10-15T13:01:02.949Z pid=1 tid=gt69ne5lx WARN: ArgumentError: Job 'at' must be a Numeric timestamp
app_1    | 2019-10-15T13:01:02.951Z pid=1 tid=gt69ne5lx WARN: /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/client.rb:225:in `normalize_item'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/client.rb:70:in `push'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/client.rb:136:in `push'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/scheduled.rb:27:in `block (3 levels) in enqueue_jobs'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/scheduled.rb:22:in `each'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/scheduled.rb:22:in `block (2 levels) in enqueue_jobs'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/scheduled.rb:16:in `each'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/scheduled.rb:16:in `block in enqueue_jobs'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq.rb:97:in `block in redis'
app_1    | /usr/local/bundle/gems/connection_pool-2.2.2/lib/connection_pool.rb:65:in `block (2 levels) in with'
app_1    | /usr/local/bundle/gems/connection_pool-2.2.2/lib/connection_pool.rb:64:in `handle_interrupt'
app_1    | /usr/local/bundle/gems/connection_pool-2.2.2/lib/connection_pool.rb:64:in `block in with'
app_1    | /usr/local/bundle/gems/connection_pool-2.2.2/lib/connection_pool.rb:61:in `handle_interrupt'
app_1    | /usr/local/bundle/gems/connection_pool-2.2.2/lib/connection_pool.rb:61:in `with'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq.rb:94:in `redis'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/scheduled.rb:15:in `enqueue_jobs'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/scheduled.rb:78:in `enqueue'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/scheduled.rb:70:in `block in start'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/util.rb:17:in `watchdog'
app_1    | /usr/local/bundle/gems/sidekiq-6.0.1/lib/sidekiq/util.rb:26:in `block in safe_thread'
```
