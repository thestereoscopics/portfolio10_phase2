get '/' do
  erb :index
end


post '/repo' do
  if params[:repo] != ''
    @messages = []
      
    @all_commits = Octokit.commits(params[:repo])

    @num_commits = @all_commits.each { |repo| @messages << repo.commit.message }.count


    @last_commit = Octokit.commits(params[:repo]).last.commit.message
    @last_commit_time = Octokit.commits(params[:repo]).last.commit.author.date

    erb :index
  else
    redirect "/"
  end
end



#leaflet