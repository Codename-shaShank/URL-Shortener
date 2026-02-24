# Debug (1.11.1) Upgrade Suggestions

This gem replaces `byebug` as the default debugger in Rails 7. No code changes are required for existing `debugger` or `binding.irb` calls, as these keywords are now handled by `debug`. Just be aware of the new functionality and commands if you used `byebug` previously.