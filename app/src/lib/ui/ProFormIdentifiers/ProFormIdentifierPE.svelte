<script lang="ts">
	import type { ExternalUser } from '$lib/types';

	import * as RD from '$lib/remoteData';
	import { Button, Input } from '$lib/ui/base';
	import { post } from '$lib/utils/post';

	async function handleSubmit() {
		users = RD.loading;
		try {
			const data = await post<{ users: ExternalUser[] }>('/pro/queryUser', {
				service: 'PE',
				data: { idPE },
			});
			users = RD.success(data.users);
		} catch (error) {
			users = RD.failure(error);
		}
	}

	function resetFetchedUsers() {
		users = RD.notAsked;
	}

	let idPE = '';
	let errors: { idPE?: string } = {};

	export let users: RD.RemoteData<ExternalUser[], string> = RD.notAsked;
</script>

<form on:submit|preventDefault={handleSubmit} class="mb-6">
	<div class="flex flex-row gap-6">
		<Input
			name="idPe"
			bind:value={idPE}
			placeholder={'Ex : XXXXXXX46468'}
			inputLabel={'Identifiant Pôle emploi'}
			error={errors.idPE}
			on:input={resetFetchedUsers}
			required
		/>
		<div class="self-center">
			<Button outline={true} type="submit">Rechercher</Button>
		</div>
	</div>
	<div class="flex flex-col gap-6">
		{#if RD.isLoading(users)}
			<span class="ri ri-refresh-line" />
		{:else if RD.isFailure(users)}
			Une erreur s'est produite. Si le problème persiste, veuillez nous contacter.
		{/if}
	</div>
</form>
