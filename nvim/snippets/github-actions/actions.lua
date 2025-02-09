local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node local i = ls.insert_node
local f = ls.function_node

--  Function Node
local function fn(args,parent,user_args)
   return '' .. args[1][1] .. user_args .. ''
end

-- Basic Workflow
ls.add_snippets('yaml', {
  s("workflow basic", {
    t("name: "), i(1, "workflow-name"),
    t({"","run-name: run-"}), f(fn,{1},{ user_args = { "" }}),
    t({"","on: "}),
    t({"","  push: "}),
    t({"","    branches: "}),
    t({"","      - main"}),
    t({"","jobs: "}),
    t({"","  build: "}),
    t({"","    runs-on: ubuntu-latest"}),
    t({"","    steps: "}),
    t({"","      - name: Checkout code"}),
    t({"","        uses: actions/checkout@v2"}),
    t({"","  "}), f(fn,{1},{ user_args = { "" }}),t": ",
    t({"","    runs-on: ubuntu-latest"}),
    t({"","    steps: "}),
    t({"","      - name: "}), t"step-", f(fn,{1},{ user_args = { "" }}),
    t({"","        run: echo "}), t"'",  f(fn,{1},{ user_args = { "" }}) , t"'"
  })
})

-- On (Trigger)
-- TODO Add choice node here for different types of events
ls.add_snippets('yaml', {
  s("on", {
    t("on: "),
    t({"","  push: "}),
    t({"","    branches: "}),
    t({"","      - main"}),
    t({"","    branches-ignore: "}),
    t({"","      - feature/experimental/**"}),
    t({"","    paths: "}),
    t({"","      - 'src/**'"}),
    t({"","      - '!src/experimental/**'"}),
    t({"","    paths-ignore: "}),
    t({"","      - 'src/experimental/**'"}),
    t({"","  pull_request: "}),
    t({"","    branches: "}),
    t({"","      - main"}),
    t({"","  label: "}),
    t({"","    types: "}),
    t({"","      - created"}),
    t({"","      - deleted"}),
    t({"","      - updated"}),
    t({"","  issue_comment: "}),
    t({"","    types: "}),
    t({"","      - created"})
  })
})

-- Continue from gitdiff comparision
--https://docs.github.com/en/actions/writing-workflows/choosing-when-your-workflow-runs/triggering-a-workflow#git-diff-comparisons

--  Choice node
--  Choice node with teliscope
