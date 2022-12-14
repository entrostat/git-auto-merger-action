# git-auto-merger-action

This action is used to check if a base branch that you choose can still merge into feature branches that you specify. If it doesn't, you can trigger an email with the branches that need to be checked out.

This is really useful when you're using `git-flow` and you have large teams. The truth is that we need `feature/`, `epic/`, `hotfix/`, and more branches to stay up to date before we merge them. Pull requests are great, but if they are waiting for a specific release date or certain metrics, they can lead to huge merge conflicts that are super confusing.

This action will send an email with all of the branches that you should check out. I recommend you set up a cron job to run this on a daily basis so that you get an update in the morning if there is something you need to check out!

## Usage
I recommend you set up `smtp` details and get that notification from the start, the alternative is to let the action fail and get the notification from Github. It's probably not as effective, but it'll still get the job done.

Below is an example of how you'd use it in a Github action:
```yaml
name: Check for Merge Conflicts
on:
  schedule:
    - cron: '0 5 * * *' # Runs at 5am every day
jobs:
  git_auto_merge_job:
    runs-on: ubuntu-latest
    name: Check for Merge Conflicts and Notify
    steps:
      - name: Checkout
        uses: actions/checkout@v3

      - name: Check for merge conflicts
        uses: entrostat/git-auto-merge-action@v1.0.4
        with:
          base-branch: 'develop'
          include-patterns: '["feature/.+","feat/.+","epic/.+","hotfix/.+"]'
          exclude-patterns: '["^main$"]'
          smtp-host: ${{ secrets.SMTP_HOST }}
          smtp-port: ${{ secrets.SMTP_PORT }}
          smtp-username: ${{ secrets.SMTP_USERNAME }}
          smtp-password: ${{ secrets.SMTP_PASSWORD }}
          smtp-tls: '0'
          smtp-from-address: ${{ secrets.SMTP_FROM_ADDRESS }}
          notification-emails: ${{ secrets.NOTIFICATION_EMAILS }}
          project-name: "<Your Project Name - For the Email Subject>"
```
