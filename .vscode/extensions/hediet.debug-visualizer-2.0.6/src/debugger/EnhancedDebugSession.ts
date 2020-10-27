import { DebugSession } from "vscode";
import { CompletionItem } from "../webviewContract";
import { observable } from "mobx";

export class EnhancedDebugSession {
	@observable protected activeStackFrame: number | undefined;

	constructor(public readonly session: DebugSession) {}

	protected async getStackTrace(args: {
		threadId: number;
		startFrame?: number;
		levels?: number;
	}): Promise<{ totalFrames?: number; stackFrames: StackFrame[] }> {
		try {
			const reply = (await this.session.customRequest("stackTrace", {
				threadId: args.threadId,
				levels: args.levels,
				startFrame: args.startFrame || 0,
			})) as { totalFrames?: number; stackFrames: StackFrame[] };
			return reply;
		} catch (e) {
			console.error(e);
			throw e;
		}
	}

	public async getCompletions(args: {
		text: string;
		column: number;
		frameId: number | undefined;
	}): Promise<CompletionItem[]> {
		try {
			const reply = await this.session.customRequest("completions", {
				text: args.text,
				frameId: args.frameId,
				column: args.column,
			});
			if (!reply) {
				return [];
			}
			return reply.targets;
		} catch (error) {
			console.error(error);
			return [];
		}
	}

	/**
	 * Evaluates the given expression.
	 * If context is "watch", long results are usually shortened.
	 */

	public async evaluate(args: {
		expression: string;
		frameId: number | undefined;
		context: "watch" | "repl" | "copy";
	}): Promise<{ result: string }> {
		const reply = await this.session.customRequest("evaluate", {
			expression: args.expression,
			frameId: args.frameId,
			context: args.context,
		});
		return { result: reply.result };
	}
}
interface StackFrame {
	id: number;
	name: string;
}
