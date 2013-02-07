require "net/http"
require "github_api"

Github.new ssl: { verify: false }

SCHEDULER.every '10m', :first_in => 0 do |job|

	activities = []

	cfa = Github.activity.events.org 'codeforamerica'

	cfa.each do |event| 
		actor = event["actor"]["login"]
		type = event["type"]
		repo = event["repo"]["name"]

		if type == "PushEvent" 
			activity = "pushed to"
			branch = event["payload"]["ref"].split("refs/heads/")[1]
			message = event["payload"]["commits"].first["message"]
			url = repo
			activities.push({name: actor, activity: activity, subject: branch, preposition: "at", url: "#{url}:", body: message})

		elsif (type == "IssuesEvent" or type == "IssueCommentEvent")
		 	action = event["payload"]["action"]
			if action == "opened"
				activity = "opened issue"
			elsif action == "closed"
				activity = "closed issue"
			end
			if type == "IssueCommentEvent"
				activity = "commented on issue"
			end
			number = event["payload"]["issue"]["number"]
			issue = "#{repo}##{number}"
			message = event["payload"]["issue"]["title"]
			activities.push({name: actor, activity: activity, subject: "#{issue}:", body: message})
		end
	end
	send_event('cfa_github', comments: activities)
end