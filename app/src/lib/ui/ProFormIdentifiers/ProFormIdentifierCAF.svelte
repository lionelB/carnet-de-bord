<script lang="ts">
	import type { ExternalUser } from '$lib/types';

	import * as RD from '$lib/remoteData';
	import { Button, Input } from '$lib/ui/base';
	import { post } from '$lib/utils/post';

	async function handleSubmit() {
		users = RD.loading;
		try {
			const data = await post<{ users: ExternalUser[] }>('/pro/queryUser', {
				service: 'CAF',
				data: { postalCode, idCAF },
			});
			users = RD.success(data.users);
		} catch (error) {
			users = RD.failure(error);
		}

		return;
	}

	function resetFetchedUser() {
		users = RD.notAsked;
	}

	let postalCode = '';
	let idCAF = '';
	let errors: { postalCode?: string; idCAF?: string } = {};

	export let users: RD.RemoteData<ExternalUser[], string> = RD.notAsked;
</script>

<form on:submit|preventDefault={handleSubmit} class="mb-6">
	<div class="flex flex-row gap-6">
		<Input
			name="postalCode"
			bind:value={postalCode}
			placeholder={'Ex : 75 008'}
			inputLabel={'Code postal'}
			error={errors.postalCode}
			on:input={resetFetchedUser}
			required
		/>
		<Input
			name="idcaf"
			bind:value={idCAF}
			placeholder={'Ex : XXXXXXX46468'}
			inputLabel={'Identifiant CAF/MSA'}
			error={errors.idCAF}
			on:input={resetFetchedUser}
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
