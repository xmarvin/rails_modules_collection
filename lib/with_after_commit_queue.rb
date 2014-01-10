module WithAfterCommitQueue
  extend ActiveSupport::Concern

  included do
    after_commit :run_scheduled_queue
  end

  private

  def execute_after_commit(&block)
    @after_commit_queue ||= []
    @after_commit_queue.push(block) if block_given?
  end

  def run_scheduled_queue
    if @after_commit_queue
      @after_commit_queue.compact.each do |block|
        block.call(self)
      end
    end
  end

end
