user1 = User.create(username: 'name1', password: '12345678')
user2 = User.create(username: 'name2', password: '12345678')

project1 = FactoryBot.create(:project, user: user1)
project2 = FactoryBot.create(:project, user: user2)

task1 = FactoryBot.create(:task, project: project1)
task2 = FactoryBot.create(:task, project: project2)
task3 = FactoryBot.create(:task, project: project2)
task4 = FactoryBot.create(:task, project: project2)

comment1 = FactoryBot.create(:comment, task: task1)
comment2 = FactoryBot.create(:comment, task: task2)
